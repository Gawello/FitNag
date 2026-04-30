import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/app_logger.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/exercise_dao.dart';
import '../../../database/daos/workout_dao.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../../database/daos/user_dao.dart';
import '../../gamification/logic/league_manager.dart';
import '../../gamification/logic/streak_manager.dart';
import '../../notifications/services/nag_scheduler.dart';

class ActiveWorkoutState {
  final int? sessionId;
  final List<ExerciseSetGroup> exerciseGroups;
  final int currentExerciseIndex;
  final int restSecondsRemaining;
  final bool isResting;
  final bool isComplete;
  final DateTime startedAt;

  const ActiveWorkoutState({
    this.sessionId,
    this.exerciseGroups = const [],
    this.currentExerciseIndex = 0,
    this.restSecondsRemaining = 0,
    this.isResting = false,
    this.isComplete = false,
    required this.startedAt,
  });

  ActiveWorkoutState copyWith({
    int? sessionId,
    List<ExerciseSetGroup>? exerciseGroups,
    int? currentExerciseIndex,
    int? restSecondsRemaining,
    bool? isResting,
    bool? isComplete,
  }) {
    return ActiveWorkoutState(
      sessionId: sessionId ?? this.sessionId,
      exerciseGroups: exerciseGroups ?? this.exerciseGroups,
      currentExerciseIndex: currentExerciseIndex ?? this.currentExerciseIndex,
      restSecondsRemaining: restSecondsRemaining ?? this.restSecondsRemaining,
      isResting: isResting ?? this.isResting,
      isComplete: isComplete ?? this.isComplete,
      startedAt: startedAt,
    );
  }

  int get totalSets => exerciseGroups.fold(0, (sum, g) => sum + g.sets.length);
  int get completedSets => exerciseGroups.fold(
      0, (sum, g) => sum + g.sets.where((s) => s.completed).length);
  bool get allSetsCompleted => totalSets > 0 && completedSets == totalSets;
}

class ExerciseSetGroup {
  final Exercise exercise;
  final List<SetData> sets;

  const ExerciseSetGroup({required this.exercise, required this.sets});

  ExerciseSetGroup copyWithSet(int setIndex, SetData set) {
    final newSets = List<SetData>.from(sets);
    newSets[setIndex] = set;
    return ExerciseSetGroup(exercise: exercise, sets: newSets);
  }
}

class SetData {
  final int setNumber;
  final int targetReps;
  final int? repsCompleted;
  final double? weightUsed;
  final int? durationSecs;
  final bool completed;
  final int? dbId;

  const SetData({
    required this.setNumber,
    required this.targetReps,
    this.repsCompleted,
    this.weightUsed,
    this.durationSecs,
    this.completed = false,
    this.dbId,
  });

  SetData copyWith({
    int? repsCompleted,
    double? weightUsed,
    int? durationSecs,
    bool? completed,
    int? dbId,
  }) {
    return SetData(
      setNumber: setNumber,
      targetReps: targetReps,
      repsCompleted: repsCompleted ?? this.repsCompleted,
      weightUsed: weightUsed ?? this.weightUsed,
      durationSecs: durationSecs ?? this.durationSecs,
      completed: completed ?? this.completed,
      dbId: dbId ?? this.dbId,
    );
  }
}

class ActiveWorkoutNotifier extends StateNotifier<ActiveWorkoutState> {
  ActiveWorkoutNotifier() : super(ActiveWorkoutState(startedAt: DateTime.now()));

  Timer? _restTimer;

  Future<void> initialize(int? planDayId) async {
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);
    final userDao = UserDao(db);
    final user = await userDao.getOrCreateUser();

    // Create session
    final sessionId = await workoutDao.startSession(
      WorkoutSessionsCompanion.insert(
        userId: user.id,
        planDayId: Value(planDayId),
        startedAt: DateTime.now(),
      ),
    );

    List<ExerciseSetGroup> groups = [];

    if (planDayId != null) {
      final exercises = await workoutDao.getPlanDayExercisesWithDetails(planDayId);
      for (final item in exercises) {
        final sets = List.generate(
          item.planExercise.sets,
          (i) => SetData(
            setNumber: i + 1,
            targetReps: item.planExercise.reps,
          ),
        );
        groups.add(ExerciseSetGroup(exercise: item.exercise, sets: sets));
      }
    }

    // Create set entries in DB
    for (final group in groups) {
      for (final set in group.sets) {
        await workoutDao.addSessionSet(
          SessionSetsCompanion.insert(
            sessionId: sessionId,
            exerciseId: group.exercise.id,
            setNumber: set.setNumber,
          ),
        );
      }
    }

    state = state.copyWith(sessionId: sessionId, exerciseGroups: groups);
  }

  Future<void> initializeAdHoc(List<int> exerciseIds) async {
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);
    final exerciseDao = ExerciseDao(db);
    final userDao = UserDao(db);
    final user = await userDao.getOrCreateUser();

    final sessionId = await workoutDao.startSession(
      WorkoutSessionsCompanion.insert(
        userId: user.id,
        planDayId: const Value(null),
        startedAt: DateTime.now(),
      ),
    );

    final allExercises = await exerciseDao.getAllExercises();
    final exerciseMap = {for (final e in allExercises) e.id: e};

    List<ExerciseSetGroup> groups = [];
    for (final id in exerciseIds) {
      final exercise = exerciseMap[id];
      if (exercise == null) continue;
      final sets = List.generate(
        exercise.defaultSets,
        (i) => SetData(setNumber: i + 1, targetReps: exercise.defaultReps),
      );
      groups.add(ExerciseSetGroup(exercise: exercise, sets: sets));
    }

    for (final group in groups) {
      for (final set in group.sets) {
        await workoutDao.addSessionSet(
          SessionSetsCompanion.insert(
            sessionId: sessionId,
            exerciseId: group.exercise.id,
            setNumber: set.setNumber,
          ),
        );
      }
    }

    state = state.copyWith(sessionId: sessionId, exerciseGroups: groups);
  }

  Future<void> resumeSession(int sessionId) async {
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);

    final session = await workoutDao.getSession(sessionId);
    if (session == null) return;

    final setsWithExercises = await workoutDao.getSessionSetsWithExercises(sessionId);
    if (setsWithExercises.isEmpty) return;

    // Group by exercise
    final Map<int, ExerciseSetGroup> groupMap = {};
    final List<int> exerciseOrder = [];

    for (final item in setsWithExercises) {
      final exerciseId = item.exercise.id;
      if (!groupMap.containsKey(exerciseId)) {
        exerciseOrder.add(exerciseId);
        groupMap[exerciseId] = ExerciseSetGroup(
          exercise: item.exercise,
          sets: [],
        );
      }
      final set = SetData(
        setNumber: item.sessionSet.setNumber,
        targetReps: item.sessionSet.repsCompleted ?? item.exercise.defaultReps,
        repsCompleted: item.sessionSet.repsCompleted,
        weightUsed: item.sessionSet.weightUsed,
        durationSecs: item.sessionSet.durationSecs,
        completed: item.sessionSet.completed,
        dbId: item.sessionSet.id,
      );
      final existing = groupMap[exerciseId];
      if (existing == null) continue;
      final currentSets = List<SetData>.from(existing.sets)..add(set);
      groupMap[exerciseId] = ExerciseSetGroup(
        exercise: item.exercise,
        sets: currentSets,
      );
    }

    final groups = exerciseOrder
        .map((id) => groupMap[id])
        .whereType<ExerciseSetGroup>()
        .toList();

    // Find the first exercise with incomplete sets
    int startIndex = 0;
    for (int i = 0; i < groups.length; i++) {
      if (groups[i].sets.any((s) => !s.completed)) {
        startIndex = i;
        break;
      }
    }

    state = ActiveWorkoutState(
      sessionId: sessionId,
      exerciseGroups: groups,
      currentExerciseIndex: startIndex,
      startedAt: session.startedAt,
    );
  }

  Future<void> addExercise(Exercise exercise) async {
    final sessionId = state.sessionId;
    if (sessionId == null) {
      AppLogger.warning('addExercise called with no active session', tag: 'WorkoutProvider');
      return;
    }
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);

    final sets = List.generate(
      exercise.defaultSets,
      (i) => SetData(setNumber: i + 1, targetReps: exercise.defaultReps),
    );
    final group = ExerciseSetGroup(exercise: exercise, sets: sets);

    for (final set in sets) {
      await workoutDao.addSessionSet(
        SessionSetsCompanion.insert(
          sessionId: sessionId,
          exerciseId: exercise.id,
          setNumber: set.setNumber,
        ),
      );
    }

    final groups = [...state.exerciseGroups, group];
    state = state.copyWith(exerciseGroups: groups);
  }

  Future<void> completeSet(int exerciseIndex, int setIndex, {int? reps, double? weight}) async {
    final wasFirstSet = state.completedSets == 0;

    final groups = List<ExerciseSetGroup>.from(state.exerciseGroups);
    final group = groups[exerciseIndex];
    final set = group.sets[setIndex];
    groups[exerciseIndex] = group.copyWithSet(
      setIndex,
      set.copyWith(
        completed: true,
        repsCompleted: reps ?? set.targetReps,
        weightUsed: weight,
      ),
    );
    state = state.copyWith(exerciseGroups: groups);

    // Persist set to DB immediately
    final sessionId = state.sessionId;
    if (sessionId != null) {
      final db = AppDatabase.instance;
      final workoutDao = WorkoutDao(db);
      final dbSets = await workoutDao.getSessionSets(sessionId);
      final matching = dbSets.where((s) =>
          s.exerciseId == group.exercise.id && s.setNumber == set.setNumber);
      if (matching.isNotEmpty) {
        await workoutDao.updateSessionSet(
          matching.first.id,
          SessionSetsCompanion(
            repsCompleted: Value(reps ?? set.targetReps),
            weightUsed: Value(weight),
            completed: const Value(true),
          ),
        );
      }
    }

    // On first completed set: update streak + cancel nags
    if (wasFirstSet) {
      final db = AppDatabase.instance;
      final user = await UserDao(db).getOrCreateUser();
      await StreakManager.updateStreak(user.id);
      await NagScheduler.cancelAllNags();
    }
  }

  void startRest({int seconds = 60}) {
    _restTimer?.cancel();
    state = state.copyWith(isResting: true, restSecondsRemaining: seconds);
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.restSecondsRemaining <= 1) {
        timer.cancel();
        state = state.copyWith(isResting: false, restSecondsRemaining: 0);
      } else {
        state = state.copyWith(
          restSecondsRemaining: state.restSecondsRemaining - 1,
        );
      }
    });
  }

  void skipRest() {
    _restTimer?.cancel();
    state = state.copyWith(isResting: false, restSecondsRemaining: 0);
  }

  void nextExercise() {
    if (state.currentExerciseIndex < state.exerciseGroups.length - 1) {
      state = state.copyWith(
        currentExerciseIndex: state.currentExerciseIndex + 1,
      );
    }
  }

  void previousExercise() {
    if (state.currentExerciseIndex > 0) {
      state = state.copyWith(
        currentExerciseIndex: state.currentExerciseIndex - 1,
      );
    }
  }

  Future<int> finishWorkout() async {
    final sessionId = state.sessionId;
    if (sessionId == null) {
      AppLogger.error('finishWorkout called with no active sessionId', tag: 'WorkoutProvider');
      return 0;
    }

    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);
    final gamificationDao = GamificationDao(db);
    final userDao = UserDao(db);
    final user = await userDao.getOrCreateUser();

    // Check if any sets were actually completed
    final hasCompletedSets = state.exerciseGroups
        .any((g) => g.sets.any((s) => s.completed));

    if (!hasCompletedSets) {
      // No work done — delete the empty session entirely
      await workoutDao.deleteSession(sessionId);
      state = state.copyWith(isComplete: true);
      _restTimer?.cancel();
      return 0;
    }

    final allComplete = state.allSetsCompleted;

    // Count exercises that had at least one completed set
    final exercisesWithWork = state.exerciseGroups
        .where((g) => g.sets.any((s) => s.completed)).length;

    // Calculate XP
    int xp = AppConstants.xpWorkoutBase;
    xp += exercisesWithWork * AppConstants.xpPerExercise;
    if (allComplete) xp += AppConstants.xpAllSetsBonus;

    // Streak bonus
    final streak = await gamificationDao.getOrCreateStreak(user.id);
    final streakBonus = (streak.currentStreak * AppConstants.xpStreakMultiplier)
        .clamp(0, AppConstants.xpStreakCap);
    xp += streakBonus;

    // First workout of the week bonus
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final sessions = await workoutDao.getCompletedSessions(user.id);
    final thisWeekSessions = sessions.where((s) =>
        s.completedAt != null && s.completedAt!.isAfter(startOfWeek));
    if (thisWeekSessions.isEmpty) {
      xp += AppConstants.xpFirstWorkoutOfWeek;
    }

    // Save session sets to DB
    final dbSets = await workoutDao.getSessionSets(sessionId);
    for (final group in state.exerciseGroups) {
      for (final set in group.sets) {
        final matching = dbSets.where((s) =>
            s.exerciseId == group.exercise.id && s.setNumber == set.setNumber);
        if (matching.isNotEmpty) {
          await workoutDao.updateSessionSet(
            matching.first.id,
            SessionSetsCompanion(
              repsCompleted: Value(set.repsCompleted),
              weightUsed: Value(set.weightUsed),
              completed: Value(set.completed),
            ),
          );
        }
      }
    }

    // Complete session
    await workoutDao.completeSession(sessionId, xp, allComplete);

    // Award XP
    await gamificationDao.addXp(user.id, xp, 'Completed workout');

    // Update streak
    await StreakManager.updateStreak(user.id);

    // Recalculate league
    await LeagueManager.recalculateAndStore(user.id);

    state = state.copyWith(isComplete: true);
    _restTimer?.cancel();

    return xp;
  }

  @override
  void dispose() {
    _restTimer?.cancel();
    super.dispose();
  }
}

final activeWorkoutProvider =
    StateNotifierProvider.autoDispose<ActiveWorkoutNotifier, ActiveWorkoutState>(
  (ref) => ActiveWorkoutNotifier(),
);

final workoutHistoryProvider = FutureProvider<List<WorkoutSession>>((ref) async {
  final db = AppDatabase.instance;
  final userDao = UserDao(db);
  final user = await userDao.getOrCreateUser();
  return WorkoutDao(db).getCompletedSessions(user.id);
});
