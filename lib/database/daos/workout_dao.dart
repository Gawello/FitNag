import 'package:drift/drift.dart';
import '../app_database.dart';

part 'workout_dao.g.dart';

@DriftAccessor(tables: [
  WorkoutPlans,
  PlanDays,
  PlanDayExercises,
  WorkoutSessions,
  SessionSets,
  Exercises,
])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(super.db);

  // ─── Plans ───

  Future<int> createPlan(WorkoutPlansCompanion plan) {
    return into(workoutPlans).insert(plan);
  }

  Future<WorkoutPlan?> getActivePlan(int userId) {
    return (select(workoutPlans)
          ..where((p) => p.userId.equals(userId) & p.isActive.equals(true)))
        .getSingleOrNull();
  }

  Future<void> deactivateAllPlans(int userId) async {
    await (update(workoutPlans)..where((p) => p.userId.equals(userId)))
        .write(const WorkoutPlansCompanion(isActive: Value(false)));
  }

  // ─── Plan Days ───

  Future<int> createPlanDay(PlanDaysCompanion day) {
    return into(planDays).insert(day);
  }

  Future<List<PlanDay>> getPlanDays(int planId) {
    return (select(planDays)
          ..where((d) => d.planId.equals(planId))
          ..orderBy([(d) => OrderingTerm.asc(d.dayOfWeek)]))
        .get();
  }

  Future<PlanDay?> getPlanDayForWeekday(int planId, int dayOfWeek) {
    return (select(planDays)
          ..where((d) => d.planId.equals(planId) & d.dayOfWeek.equals(dayOfWeek)))
        .getSingleOrNull();
  }

  // ─── Plan Day Exercises ───

  Future<void> addExerciseToPlanDay(PlanDayExercisesCompanion exercise) {
    return into(planDayExercises).insert(exercise);
  }

  Future<List<PlanDayExercise>> getPlanDayExercises(int planDayId) {
    return (select(planDayExercises)
          ..where((e) => e.planDayId.equals(planDayId))
          ..orderBy([(e) => OrderingTerm.asc(e.orderIndex)]))
        .get();
  }

  /// Returns exercises for a plan day joined with exercise details.
  Future<List<({PlanDayExercise planExercise, Exercise exercise})>> getPlanDayExercisesWithDetails(int planDayId) async {
    final query = select(planDayExercises).join([
      innerJoin(exercises, exercises.id.equalsExp(planDayExercises.exerciseId)),
    ])..where(planDayExercises.planDayId.equals(planDayId))
     ..orderBy([OrderingTerm.asc(planDayExercises.orderIndex)]);

    final rows = await query.get();
    return rows.map((row) => (
      planExercise: row.readTable(planDayExercises),
      exercise: row.readTable(exercises),
    )).toList();
  }

  // ─── Sessions ───

  Future<int> startSession(WorkoutSessionsCompanion session) {
    return into(workoutSessions).insert(session);
  }

  Future<void> completeSession(int sessionId, int xp, bool allSets) async {
    await (update(workoutSessions)..where((s) => s.id.equals(sessionId))).write(
      WorkoutSessionsCompanion(
        completedAt: Value(DateTime.now()),
        totalXpEarned: Value(xp),
        allSetsCompleted: Value(allSets),
      ),
    );
  }

  Future<WorkoutSession?> getSession(int sessionId) {
    return (select(workoutSessions)..where((s) => s.id.equals(sessionId)))
        .getSingleOrNull();
  }

  Future<List<WorkoutSession>> getCompletedSessions(int userId) {
    return (select(workoutSessions)
          ..where((s) => s.userId.equals(userId) & s.completedAt.isNotNull())
          ..orderBy([(s) => OrderingTerm.desc(s.completedAt)]))
        .get();
  }

  Future<WorkoutSession?> getLastCompletedSession(int userId) {
    return (select(workoutSessions)
          ..where((s) => s.userId.equals(userId) & s.completedAt.isNotNull())
          ..orderBy([(s) => OrderingTerm.desc(s.completedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> getCompletedSessionCount(int userId) async {
    final count = workoutSessions.id.count();
    final query = selectOnly(workoutSessions)
      ..addColumns([count])
      ..where(workoutSessions.userId.equals(userId) & workoutSessions.completedAt.isNotNull());
    final result = await query.getSingle();
    return result.read(count)!;
  }

  Future<bool> hasWorkoutToday(int userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    final result = await (select(workoutSessions)
          ..where((s) =>
              s.userId.equals(userId) &
              s.completedAt.isNotNull() &
              s.completedAt.isBiggerOrEqualValue(startOfDay) &
              s.completedAt.isSmallerThanValue(endOfDay)))
        .get();
    return result.isNotEmpty;
  }

  Future<Map<DateTime, List<WorkoutSession>>> getSessionsByDateRange(
      int userId, DateTime start, DateTime end) async {
    final sessions = await (select(workoutSessions)
          ..where((s) =>
              s.userId.equals(userId) &
              s.completedAt.isNotNull() &
              s.completedAt.isBiggerOrEqualValue(start) &
              s.completedAt.isSmallerThanValue(end))
          ..orderBy([(s) => OrderingTerm.desc(s.completedAt)]))
        .get();

    final map = <DateTime, List<WorkoutSession>>{};
    for (final session in sessions) {
      final date = DateTime(
        session.completedAt!.year,
        session.completedAt!.month,
        session.completedAt!.day,
      );
      map.putIfAbsent(date, () => []).add(session);
    }
    return map;
  }

  /// Returns an incomplete session (started today, not completed).
  Future<WorkoutSession?> getIncompleteSession(int userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final result = await (select(workoutSessions)
          ..where((s) =>
              s.userId.equals(userId) &
              s.completedAt.isNull() &
              s.startedAt.isBiggerOrEqualValue(startOfDay))
          ..orderBy([(s) => OrderingTerm.desc(s.startedAt)])
          ..limit(1))
        .getSingleOrNull();
    return result;
  }

  /// Returns all expired incomplete sessions (started before today, never completed).
  Future<List<WorkoutSession>> getExpiredIncompleteSessions(int userId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    return (select(workoutSessions)
          ..where((s) =>
              s.userId.equals(userId) &
              s.completedAt.isNull() &
              s.startedAt.isSmallerThanValue(startOfDay)))
        .get();
  }

  /// Auto-close an expired session: set completedAt to end of its start day (23:59:59).
  Future<void> autoCloseSession(int sessionId, DateTime completedAt, int xp, bool allSets) async {
    await (update(workoutSessions)..where((s) => s.id.equals(sessionId))).write(
      WorkoutSessionsCompanion(
        completedAt: Value(completedAt),
        totalXpEarned: Value(xp),
        allSetsCompleted: Value(allSets),
      ),
    );
  }

  /// Returns session sets joined with exercise details for a given session.
  Future<List<({SessionSet sessionSet, Exercise exercise})>>
      getSessionSetsWithExercises(int sessionId) async {
    final query = select(sessionSets).join([
      innerJoin(exercises, exercises.id.equalsExp(sessionSets.exerciseId)),
    ])
      ..where(sessionSets.sessionId.equals(sessionId))
      ..orderBy([
        OrderingTerm.asc(sessionSets.exerciseId),
        OrderingTerm.asc(sessionSets.setNumber),
      ]);

    final rows = await query.get();
    return rows.map((row) => (
          sessionSet: row.readTable(sessionSets),
          exercise: row.readTable(exercises),
        )).toList();
  }

  // ─── Session Sets ───

  Future<void> addSessionSet(SessionSetsCompanion set) {
    return into(sessionSets).insert(set);
  }

  Future<void> updateSessionSet(int setId, SessionSetsCompanion companion) {
    return (update(sessionSets)..where((s) => s.id.equals(setId))).write(companion);
  }

  Future<List<SessionSet>> getSessionSets(int sessionId) {
    return (select(sessionSets)
          ..where((s) => s.sessionId.equals(sessionId))
          ..orderBy([
            (s) => OrderingTerm.asc(s.exerciseId),
            (s) => OrderingTerm.asc(s.setNumber),
          ]))
        .get();
  }

  /// Delete a session and all its sets.
  Future<void> deleteSession(int sessionId) async {
    await (delete(sessionSets)..where((s) => s.sessionId.equals(sessionId))).go();
    await (delete(workoutSessions)..where((s) => s.id.equals(sessionId))).go();
  }

  /// Delete all completed sessions that have zero completed sets (empty logs).
  Future<void> cleanupEmptySessions(int userId) async {
    final completed = await getCompletedSessions(userId);
    for (final session in completed) {
      final sets = await getSessionSets(session.id);
      final hasCompletedSets = sets.any((s) => s.completed);
      if (!hasCompletedSets) {
        await deleteSession(session.id);
      }
    }
  }
}
