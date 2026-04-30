import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/exercise_dao.dart';
import '../../../database/daos/user_dao.dart';

final allExercisesProvider = FutureProvider<List<Exercise>>((ref) async {
  final db = AppDatabase.instance;
  return ExerciseDao(db).getAllExercises();
});

final exerciseByIdProvider = FutureProvider.family<Exercise?, int>((ref, id) async {
  final exercises = await ref.watch(allExercisesProvider.future);
  return exercises.where((e) => e.id == id).firstOrNull;
});

enum PreferenceFilter { all, favorites, blacklisted }

class ExerciseFilter {
  final BodyPart? bodyPart;
  final Equipment? equipment;
  final Difficulty? difficulty;
  final PreferenceFilter preferenceFilter;

  const ExerciseFilter({
    this.bodyPart,
    this.equipment,
    this.difficulty,
    this.preferenceFilter = PreferenceFilter.all,
  });

  ExerciseFilter copyWith({
    BodyPart? bodyPart,
    Equipment? equipment,
    Difficulty? difficulty,
    PreferenceFilter? preferenceFilter,
    bool clearBodyPart = false,
    bool clearEquipment = false,
    bool clearDifficulty = false,
  }) {
    return ExerciseFilter(
      bodyPart: clearBodyPart ? null : (bodyPart ?? this.bodyPart),
      equipment: clearEquipment ? null : (equipment ?? this.equipment),
      difficulty: clearDifficulty ? null : (difficulty ?? this.difficulty),
      preferenceFilter: preferenceFilter ?? this.preferenceFilter,
    );
  }
}

final exerciseFilterProvider = StateProvider<ExerciseFilter>(
  (ref) => const ExerciseFilter(),
);

/// Loads exercise preferences map for the current user: exerciseId -> preference (1=fav, 2=blacklisted)
final exercisePreferencesProvider = FutureProvider<Map<int, int>>((ref) async {
  final db = AppDatabase.instance;
  final user = await UserDao(db).getOrCreateUser();
  return ExerciseDao(db).getAllPreferences(user.id);
});

/// Provider for a single exercise's preference
final exercisePreferenceProvider = FutureProvider.family<int, int>((ref, exerciseId) async {
  final prefs = await ref.watch(exercisePreferencesProvider.future);
  return prefs[exerciseId] ?? 0;
});

final filteredExercisesProvider = Provider<AsyncValue<List<Exercise>>>((ref) {
  final exercisesAsync = ref.watch(allExercisesProvider);
  final filter = ref.watch(exerciseFilterProvider);
  final prefsAsync = ref.watch(exercisePreferencesProvider);

  return exercisesAsync.whenData((exercises) {
    final prefs = prefsAsync.valueOrNull ?? {};

    return exercises.where((e) {
      if (filter.bodyPart != null && e.bodyPartIndex != filter.bodyPart!.index) {
        return false;
      }
      if (filter.equipment != null && e.equipmentIndex != filter.equipment!.index) {
        return false;
      }
      if (filter.difficulty != null && e.difficultyIndex != filter.difficulty!.index) {
        return false;
      }
      // Preference filter
      final pref = prefs[e.id] ?? 0;
      if (filter.preferenceFilter == PreferenceFilter.favorites && pref != 1) {
        return false;
      }
      if (filter.preferenceFilter == PreferenceFilter.blacklisted && pref != 2) {
        return false;
      }
      return true;
    }).toList();
  });
});
