import 'package:drift/drift.dart';

import '../../../database/app_database.dart';
import '../../../database/daos/gamification_dao.dart';

/// Manages the current and longest workout streak for a user.
///
/// A streak increments when a workout is logged on a day consecutive to the
/// previous workout day. Missing a day resets [Streak.currentStreak] to 1
/// (the current workout still counts). Missing two or more days resets it to 0.
class StreakManager {
  StreakManager._();

  /// Updates streak after a workout. Call once per workout session completion.
  ///
  /// - Same day as last workout: no-op.
  /// - Next day: increments [Streak.currentStreak].
  /// - Two or more days later: resets to 1.
  /// Updates [Streak.longestStreak] if the new streak exceeds it.
  static Future<void> updateStreak(int userId) async {
    final db = AppDatabase.instance;
    final dao = GamificationDao(db);
    final streak = await dao.getOrCreateStreak(userId);

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastWorkout = streak.lastWorkoutDate;

    int newStreak = streak.currentStreak;

    if (lastWorkout == null) {
      // First workout ever
      newStreak = 1;
    } else {
      final lastDate = DateTime(lastWorkout.year, lastWorkout.month, lastWorkout.day);
      final diff = today.difference(lastDate).inDays;

      if (diff == 0) {
        // Already worked out today, no change
        return;
      } else if (diff == 1) {
        // Consecutive day
        newStreak = streak.currentStreak + 1;
      } else {
        // Streak broken
        newStreak = 1;
      }
    }

    final newLongest = newStreak > streak.longestStreak ? newStreak : streak.longestStreak;

    await dao.updateStreak(
      userId,
      StreaksCompanion(
        currentStreak: Value(newStreak),
        longestStreak: Value(newLongest),
        lastWorkoutDate: Value(now),
      ),
    );
  }

  /// Call this daily (e.g., from a background task) to check for broken streaks.
  static Future<bool> checkStreakBroken(int userId) async {
    final db = AppDatabase.instance;
    final dao = GamificationDao(db);
    final streak = await dao.getOrCreateStreak(userId);

    if (streak.lastWorkoutDate == null) return false;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(
      streak.lastWorkoutDate!.year,
      streak.lastWorkoutDate!.month,
      streak.lastWorkoutDate!.day,
    );
    final diff = today.difference(lastDate).inDays;

    if (diff > 1 && streak.currentStreak > 0) {
      await dao.updateStreak(
        userId,
        const StreaksCompanion(currentStreak: Value(0)),
      );
      return true;
    }
    return false;
  }
}
