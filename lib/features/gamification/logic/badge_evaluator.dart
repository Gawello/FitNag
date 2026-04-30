import '../../../database/app_database.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../../database/daos/workout_dao.dart';
import '../../../database/daos/measurement_dao.dart';

/// Evaluates badge conditions and awards newly earned badges.
///
/// Call [evaluate] after a workout is completed or a measurement is logged.
/// Returns the badge keys that were newly awarded in this evaluation pass.
///
/// Supported categories:
/// - Streak badges: `streak_3`, `streak_7`, `streak_14`, `streak_30`, `streak_90`
/// - Volume badges: `workout_1`, `workout_10`, `workout_50`, `workout_100`
/// - Measurement: `first_measurement`
/// - Time-based: `early_bird` (before 07:00), `night_owl` (at/after 21:00)
class BadgeEvaluator {
  BadgeEvaluator._();

  /// Checks all badge conditions for [userId] and awards any that are newly met.
  ///
  /// Safe to call multiple times — already-earned badges are skipped via [_tryAward].
  static Future<List<String>> evaluate(int userId) async {
    final db = AppDatabase.instance;
    final gamificationDao = GamificationDao(db);
    final workoutDao = WorkoutDao(db);
    final measurementDao = MeasurementDao(db);

    final newlyEarned = <String>[];

    final streak = await gamificationDao.getOrCreateStreak(userId);
    final totalWorkouts = await workoutDao.getCompletedSessionCount(userId);
    final measurementCount = await measurementDao.getMeasurementCount(userId);
    final lastSession = await workoutDao.getLastCompletedSession(userId);

    // Streak badges
    final streakBadges = {
      3: 'streak_3',
      7: 'streak_7',
      14: 'streak_14',
      30: 'streak_30',
      90: 'streak_90',
    };
    for (final entry in streakBadges.entries) {
      if (streak.currentStreak >= entry.key) {
        final earned = await _tryAward(gamificationDao, userId, entry.value);
        if (earned) newlyEarned.add(entry.value);
      }
    }

    // Volume badges
    final volumeBadges = {
      1: 'workout_1',
      10: 'workout_10',
      50: 'workout_50',
      100: 'workout_100',
    };
    for (final entry in volumeBadges.entries) {
      if (totalWorkouts >= entry.key) {
        final earned = await _tryAward(gamificationDao, userId, entry.value);
        if (earned) newlyEarned.add(entry.value);
      }
    }

    // Measurement badges
    if (measurementCount >= 1) {
      final earned = await _tryAward(gamificationDao, userId, 'first_measurement');
      if (earned) newlyEarned.add('first_measurement');
    }

    // Time-based badges
    if (lastSession?.completedAt != null) {
      final hour = lastSession!.completedAt!.hour;
      if (hour < 7) {
        final earned = await _tryAward(gamificationDao, userId, 'early_bird');
        if (earned) newlyEarned.add('early_bird');
      }
      if (hour >= 21) {
        final earned = await _tryAward(gamificationDao, userId, 'night_owl');
        if (earned) newlyEarned.add('night_owl');
      }
    }

    return newlyEarned;
  }

  static Future<bool> _tryAward(
    GamificationDao dao,
    int userId,
    String badgeKey,
  ) async {
    final badge = await dao.getBadgeByKey(badgeKey);
    if (badge == null) return false;
    if (await dao.hasBadge(userId, badge.id)) return false;
    await dao.awardBadge(userId, badge.id);
    return true;
  }
}
