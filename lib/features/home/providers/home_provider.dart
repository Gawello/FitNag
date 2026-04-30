import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/schedule_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/workout_dao.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../gamification/logic/league_manager.dart';

class HomeState {
  final User? user;
  final int totalXp;
  final int currentLevel;
  final String levelTitle;
  final int xpForNextLevel;
  final int xpInCurrentLevel;
  final int currentStreak;
  final int longestStreak;
  final bool workedOutToday;
  final PlanDay? todaysPlanDay;
  final int completedWorkouts;
  final WorkoutSession? incompleteSession;
  final int currentLeagueTier;

  const HomeState({
    this.user,
    this.totalXp = 0,
    this.currentLevel = 1,
    this.levelTitle = 'Couch Potato',
    this.xpForNextLevel = 100,
    this.xpInCurrentLevel = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.workedOutToday = false,
    this.todaysPlanDay,
    this.completedWorkouts = 0,
    this.incompleteSession,
    this.currentLeagueTier = 1,
  });
}

final homeStateProvider = FutureProvider<HomeState>((ref) async {
  final db = AppDatabase.instance;
  final userDao = UserDao(db);
  final workoutDao = WorkoutDao(db);
  final gamificationDao = GamificationDao(db);

  final user = await userDao.getOrCreateUser();

  // Auto-close any expired sessions from previous days
  await _closeExpiredSessions(user.id, workoutDao, gamificationDao);

  final totalXp = await gamificationDao.getTotalXp(user.id);
  final streak = await gamificationDao.getOrCreateStreak(user.id);
  final workedOutToday = await workoutDao.hasWorkoutToday(user.id);
  final completedWorkouts = await workoutDao.getCompletedSessionCount(user.id);
  final incompleteSession = await workoutDao.getIncompleteSession(user.id);

  // Calculate level
  int level = 1;
  String title = AppConstants.levels[0].title;
  int nextLevelXp = AppConstants.levels[1].xp;
  int currentLevelXp = 0;

  for (int i = AppConstants.levels.length - 1; i >= 0; i--) {
    if (totalXp >= AppConstants.levels[i].xp) {
      level = i + 1;
      title = AppConstants.levels[i].title;
      currentLevelXp = AppConstants.levels[i].xp;
      nextLevelXp = i < AppConstants.levels.length - 1
          ? AppConstants.levels[i + 1].xp
          : AppConstants.levels[i].xp;
      break;
    }
  }

  // Get today's plan day
  PlanDay? todaysPlanDay;
  final activePlan = await workoutDao.getActivePlan(user.id);
  final now = DateTime.now();
  final isWorkoutDay = await ScheduleHelper.isWorkoutDay(user, now);

  if (activePlan != null && isWorkoutDay) {
    if (user.scheduleMode == 0) {
      // Weekday mode: use existing weekday-based lookup
      todaysPlanDay = await workoutDao.getPlanDayForWeekday(activePlan.id, now.weekday);
    } else {
      // Interval modes: cycle through plan days
      final planDays = await workoutDao.getPlanDays(activePlan.id);
      if (planDays.isNotEmpty) {
        final idx = ScheduleHelper.getRotationalDayIndex(user, now, planDays.length);
        todaysPlanDay = planDays[idx];
      }
    }
  }

  // Get league tier
  final leagueTier = await LeagueManager.getStoredTier(user.id);

  return HomeState(
    user: user,
    totalXp: totalXp,
    currentLevel: level,
    levelTitle: title,
    xpForNextLevel: nextLevelXp - currentLevelXp,
    xpInCurrentLevel: totalXp - currentLevelXp,
    currentStreak: streak.currentStreak,
    longestStreak: streak.longestStreak,
    workedOutToday: workedOutToday,
    todaysPlanDay: todaysPlanDay,
    completedWorkouts: completedWorkouts,
    incompleteSession: incompleteSession,
    currentLeagueTier: leagueTier,
  );
});

/// Auto-close sessions from previous days.
/// Sessions with no completed sets are deleted. Sessions with work are closed.
Future<void> _closeExpiredSessions(
  int userId,
  WorkoutDao workoutDao,
  GamificationDao gamificationDao,
) async {
  final expired = await workoutDao.getExpiredIncompleteSessions(userId);
  if (expired.isEmpty) return;

  for (final session in expired) {
    final sets = await workoutDao.getSessionSets(session.id);
    final completedSets = sets.where((s) => s.completed).toList();

    if (completedSets.isEmpty) {
      // No work done — delete entirely
      await workoutDao.deleteSession(session.id);
      continue;
    }

    // Count distinct exercises that had at least one completed set
    final exerciseIds = completedSets.map((s) => s.exerciseId).toSet();
    final allComplete = sets.isNotEmpty && completedSets.length == sets.length;

    int xp = AppConstants.xpWorkoutBase;
    xp += exerciseIds.length * AppConstants.xpPerExercise;
    if (allComplete) xp += AppConstants.xpAllSetsBonus;

    // Close at end of the day the session was started (23:59:59)
    final startDate = session.startedAt;
    final endOfDay = DateTime(startDate.year, startDate.month, startDate.day, 23, 59, 59);

    await workoutDao.autoCloseSession(session.id, endOfDay, xp, allComplete);
    await gamificationDao.addXp(userId, xp, 'Auto-closed workout');
  }

}
