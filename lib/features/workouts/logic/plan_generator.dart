import 'dart:math';

import 'package:drift/drift.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/exercise_constants.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/exercise_dao.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/workout_dao.dart';

/// Generates a personalized workout plan and persists it to the database.
///
/// Split type is chosen based on [User.workoutDaysPerWeek]:
/// - 1–3 days  → Full Body
/// - 4 days    → Upper / Lower
/// - 5 days    → Push / Pull / Legs + Upper / Lower
/// - 6+ days   → Push / Pull / Legs × 2
///
/// Exercise selection priorities:
/// 1. Compound movements first.
/// 2. Favorites receive a 70 % probability boost.
/// 3. Blacklisted exercises are always excluded.
/// 4. Only exercises matching the user's equipment and difficulty are used.
/// 5. Focus body parts are preferred when [TrainingFocus.specificBodyPart] is set.
class PlanGenerator {
  PlanGenerator._();

  /// Generates a new [WorkoutPlan] from user preferences and saves it as active.
  ///
  /// Any previously active plan is deactivated first.
  static Future<void> generateAndSavePlan() async {
    final db = AppDatabase.instance;
    final userDao = UserDao(db);
    final exerciseDao = ExerciseDao(db);
    final workoutDao = WorkoutDao(db);

    final user = await userDao.getOrCreateUser();
    final equipmentIndices = await userDao.getEquipment(user.id);
    final focusBodyparts = await userDao.getFocusBodyparts(user.id);

    // Always include bodyweight
    if (!equipmentIndices.contains(Equipment.bodyweightFloor.index)) {
      equipmentIndices.add(Equipment.bodyweightFloor.index);
    }

    final difficulty = Difficulty.values[user.difficultyIndex];
    final trainingFocus = TrainingFocus.values[user.trainingFocusIndex];
    final workoutDays = user.workoutDays.split(',').map(int.parse).toList();
    final daysPerWeek = workoutDays.length;

    // Get available exercises
    final allExercisesRaw = await exerciseDao.getFiltered(
      equipmentIndices: equipmentIndices,
      maxDifficulty: difficulty.index,
    );

    // Remove blacklisted exercises
    final blacklistedIds = await exerciseDao.getBlacklistedIds(user.id);
    final favoriteIds = await exerciseDao.getFavoriteIds(user.id);
    final favoriteSet = favoriteIds.toSet();
    final allExercises = allExercisesRaw
        .where((e) => !blacklistedIds.contains(e.id))
        .toList();

    if (allExercises.isEmpty) return;

    // Determine split type
    final split = _determineSplit(daysPerWeek);

    // Deactivate old plans
    await workoutDao.deactivateAllPlans(user.id);

    // Create new plan
    final planId = await workoutDao.createPlan(
      WorkoutPlansCompanion.insert(
        userId: user.id,
        name: '${difficulty.label} ${trainingFocus.label} Plan',
      ),
    );

    // Create each day
    for (int i = 0; i < workoutDays.length; i++) {
      final dayBodyParts = split[i % split.length];
      final label = _splitLabel(dayBodyParts);

      final dayId = await workoutDao.createPlanDay(
        PlanDaysCompanion.insert(
          planId: planId,
          dayOfWeek: workoutDays[i],
          label: Value(label),
        ),
      );

      // Select exercises for this day
      final dayExercises = _selectExercises(
        allExercises: allExercises,
        targetBodyParts: dayBodyParts,
        focusBodyParts: focusBodyparts,
        difficulty: difficulty,
        trainingFocus: trainingFocus,
        favoriteIds: favoriteSet,
      );

      for (int j = 0; j < dayExercises.length; j++) {
        final exercise = dayExercises[j];
        final scheme = _setRepScheme(trainingFocus, exercise);

        await workoutDao.addExerciseToPlanDay(
          PlanDayExercisesCompanion.insert(
            planDayId: dayId,
            exerciseId: exercise.id,
            orderIndex: j,
            sets: Value(scheme.sets),
            reps: Value(scheme.reps),
            durationSecs: Value(exercise.defaultDurationSecs),
            tempo: Value(exercise.defaultTempo),
          ),
        );
      }
    }
  }

  /// Returns a list where each element is the list of body parts for that day type.
  static List<List<BodyPart>> _determineSplit(int daysPerWeek) {
    if (daysPerWeek <= 3) {
      // Full body
      return [BodyPart.values.where((bp) => bp != BodyPart.fullBody).toList()];
    } else if (daysPerWeek == 4) {
      // Upper/Lower
      return [
        [BodyPart.chest, BodyPart.back, BodyPart.shoulders, BodyPart.biceps, BodyPart.triceps],
        [BodyPart.quads, BodyPart.hamstrings, BodyPart.glutes, BodyPart.calves, BodyPart.absCore],
      ];
    } else if (daysPerWeek == 5) {
      // Push/Pull/Legs + Upper/Lower
      return [
        [BodyPart.chest, BodyPart.shoulders, BodyPart.triceps], // Push
        [BodyPart.back, BodyPart.biceps, BodyPart.forearms],    // Pull
        [BodyPart.quads, BodyPart.hamstrings, BodyPart.glutes, BodyPart.calves], // Legs
        [BodyPart.chest, BodyPart.back, BodyPart.shoulders, BodyPart.biceps, BodyPart.triceps], // Upper
        [BodyPart.quads, BodyPart.hamstrings, BodyPart.glutes, BodyPart.calves, BodyPart.absCore], // Lower
      ];
    } else {
      // 6 days: PPL x 2
      return [
        [BodyPart.chest, BodyPart.shoulders, BodyPart.triceps],
        [BodyPart.back, BodyPart.biceps, BodyPart.forearms],
        [BodyPart.quads, BodyPart.hamstrings, BodyPart.glutes, BodyPart.calves],
        [BodyPart.chest, BodyPart.shoulders, BodyPart.triceps],
        [BodyPart.back, BodyPart.biceps, BodyPart.forearms],
        [BodyPart.quads, BodyPart.hamstrings, BodyPart.glutes, BodyPart.calves],
      ];
    }
  }

  static String _splitLabel(List<BodyPart> parts) {
    if (parts.length >= 8) return 'Full Body';
    if (_isUpperBody(parts)) return 'Upper Body';
    if (_isLowerBody(parts)) return 'Lower Body';
    if (_isPush(parts)) return 'Push';
    if (_isPull(parts)) return 'Pull';
    if (_isLegs(parts)) return 'Legs';
    return parts.map((p) => p.label).join(' / ');
  }

  static bool _isUpperBody(List<BodyPart> parts) =>
      parts.contains(BodyPart.chest) && parts.contains(BodyPart.back);
  static bool _isLowerBody(List<BodyPart> parts) =>
      parts.contains(BodyPart.quads) && parts.contains(BodyPart.hamstrings) && !parts.contains(BodyPart.chest);
  static bool _isPush(List<BodyPart> parts) =>
      parts.contains(BodyPart.chest) && parts.contains(BodyPart.triceps) && !parts.contains(BodyPart.back);
  static bool _isPull(List<BodyPart> parts) =>
      parts.contains(BodyPart.back) && parts.contains(BodyPart.biceps) && !parts.contains(BodyPart.chest);
  static bool _isLegs(List<BodyPart> parts) =>
      parts.contains(BodyPart.quads) && !parts.contains(BodyPart.chest) && !parts.contains(BodyPart.back);

  static List<Exercise> _selectExercises({
    required List<Exercise> allExercises,
    required List<BodyPart> targetBodyParts,
    required List<int> focusBodyParts,
    required Difficulty difficulty,
    required TrainingFocus trainingFocus,
    Set<int> favoriteIds = const {},
  }) {
    final exercisesPerDay = switch (difficulty) {
      Difficulty.beginner => AppConstants.exercisesPerDayBeginner,
      Difficulty.intermediate => AppConstants.exercisesPerDayIntermediate,
      Difficulty.advanced => AppConstants.exercisesPerDayAdvanced,
    };

    final rng = Random();
    final selected = <Exercise>[];
    final usedIds = <int>{};

    // Group exercises by body part
    final byBodyPart = <int, List<Exercise>>{};
    for (final ex in allExercises) {
      byBodyPart.putIfAbsent(ex.bodyPartIndex, () => []).add(ex);
    }

    // Prioritize focus body parts
    final priorityParts = focusBodyParts.isNotEmpty
        ? targetBodyParts.where((bp) => focusBodyParts.contains(bp.index)).toList()
        : targetBodyParts;

    // First, pick at least one exercise per target body part
    for (final bp in targetBodyParts) {
      final candidates = byBodyPart[bp.index] ?? [];
      if (candidates.isEmpty) continue;

      // Prefer compound movements first
      final compounds = candidates.where((e) =>
          e.muscleActionIndex == MuscleAction.compound.index ||
          e.muscleActionIndex == MuscleAction.push.index ||
          e.muscleActionIndex == MuscleAction.pull.index).toList();
      var pool = compounds.isNotEmpty ? compounds : candidates;

      // Sort favorites to front for higher pick probability
      if (favoriteIds.isNotEmpty) {
        pool = [...pool]..sort((a, b) {
          final aFav = favoriteIds.contains(a.id) ? 0 : 1;
          final bFav = favoriteIds.contains(b.id) ? 0 : 1;
          return aFav.compareTo(bFav);
        });
        // Pick from favorites with 70% probability if any exist
        final favPool = pool.where((e) => favoriteIds.contains(e.id)).toList();
        if (favPool.isNotEmpty && rng.nextDouble() < 0.7) {
          pool = favPool;
        }
      }

      final pick = pool[rng.nextInt(pool.length)];
      if (usedIds.add(pick.id)) {
        selected.add(pick);
      }
    }

    // Fill remaining slots, prioritizing focus body parts
    while (selected.length < exercisesPerDay) {
      final targetParts = priorityParts.isNotEmpty && selected.length < exercisesPerDay - 1
          ? priorityParts
          : targetBodyParts;

      if (targetParts.isEmpty) break;

      final bp = targetParts[rng.nextInt(targetParts.length)];
      final candidates = (byBodyPart[bp.index] ?? [])
          .where((e) => !usedIds.contains(e.id))
          .toList();

      if (candidates.isEmpty) {
        // Try any remaining exercise
        final remaining = allExercises.where((e) => !usedIds.contains(e.id)).toList();
        if (remaining.isEmpty) break;
        final pick = remaining[rng.nextInt(remaining.length)];
        usedIds.add(pick.id);
        selected.add(pick);
      } else {
        final pick = candidates[rng.nextInt(candidates.length)];
        usedIds.add(pick.id);
        selected.add(pick);
      }
    }

    // Sort: compound first, isolation last
    selected.sort((a, b) {
      final aCompound = a.muscleActionIndex == MuscleAction.compound.index ||
          a.muscleActionIndex == MuscleAction.push.index ||
          a.muscleActionIndex == MuscleAction.pull.index;
      final bCompound = b.muscleActionIndex == MuscleAction.compound.index ||
          b.muscleActionIndex == MuscleAction.push.index ||
          b.muscleActionIndex == MuscleAction.pull.index;
      if (aCompound && !bCompound) return -1;
      if (!aCompound && bCompound) return 1;
      return 0;
    });

    return selected;
  }

  static ({int sets, int reps}) _setRepScheme(TrainingFocus focus, Exercise exercise) {
    if (exercise.defaultDurationSecs != null) {
      // Timed exercise
      return (sets: exercise.defaultSets, reps: exercise.defaultReps);
    }

    return switch (focus) {
      TrainingFocus.strengthBuilding => (sets: 4, reps: 5),
      TrainingFocus.generalFitness || TrainingFocus.specificBodyPart => (sets: 3, reps: 10),
      TrainingFocus.cardioConditioning => (sets: 3, reps: 18),
      TrainingFocus.mobilityImprovement || TrainingFocus.flexibility => (sets: 2, reps: 12),
    };
  }
}
