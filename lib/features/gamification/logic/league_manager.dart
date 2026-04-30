import 'package:drift/drift.dart';

import '../../../core/constants/league_constants.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/workout_dao.dart';

/// Manages the 15-tier league system based on weekly activity averages.
///
/// Tier is calculated from the last 28 days of session data:
/// - Average weekly minutes and days are computed.
/// - Thresholds are defined in [LeagueConstants.tiers].
///
/// Promotion requires 2 consecutive recalculations above the next tier's threshold.
/// Demotion requires 2 consecutive recalculations below the current tier's threshold.
/// Tier changes happen one step at a time (no skipping).
class LeagueManager {
  LeagueManager._();

  /// Calculate current league stats for a user based on last 4 weeks of data.
  /// Returns (avgWeeklyMinutes, avgWeeklyDays, calculatedTier).
  static Future<({double avgMinutes, double avgDays, int tier})>
      calculateCurrentLeague(int userId) async {
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);

    final now = DateTime.now();
    final fourWeeksAgo = now.subtract(const Duration(days: 28));

    final sessions = await workoutDao.getCompletedSessions(userId);
    final recentSessions = sessions.where((s) =>
        s.completedAt != null && s.completedAt!.isAfter(fourWeeksAgo)).toList();

    if (recentSessions.isEmpty) {
      return (avgMinutes: 0.0, avgDays: 0.0, tier: 1);
    }

    // Calculate total minutes across all recent sessions
    double totalMinutes = 0;
    final daySet = <String>{};

    for (final session in recentSessions) {
      if (session.completedAt != null) {
        final duration = session.completedAt!.difference(session.startedAt);
        totalMinutes += duration.inMinutes;
        final dateKey = '${session.completedAt!.year}-${session.completedAt!.month}-${session.completedAt!.day}';
        daySet.add(dateKey);
      }
    }

    // Determine how many weeks of data we have (min 1, max 4)
    final earliestSession = recentSessions
        .map((s) => s.startedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    final daysSinceStart = now.difference(earliestSession).inDays;
    final weeksOfData = (daysSinceStart / 7).clamp(1.0, 4.0);

    final avgWeeklyMinutes = totalMinutes / weeksOfData;
    final avgWeeklyDays = daySet.length / weeksOfData;

    final tier = LeagueConstants.calculateTier(avgWeeklyMinutes, avgWeeklyDays);

    return (avgMinutes: avgWeeklyMinutes, avgDays: avgWeeklyDays, tier: tier);
  }

  /// Recalculate and store league data, handling promotion/demotion logic.
  static Future<void> recalculateAndStore(int userId) async {
    final db = AppDatabase.instance;
    final result = await calculateCurrentLeague(userId);

    // Get or create user league record
    final existing = await (db.select(db.userLeagues)
      ..where((l) => l.userId.equals(userId)))
      .getSingleOrNull();

    if (existing == null) {
      // First time — just insert
      await db.into(db.userLeagues).insert(
        UserLeaguesCompanion.insert(
          userId: userId,
          currentTier: Value(result.tier),
          lastCalculatedAt: Value(DateTime.now()),
        ),
      );
      return;
    }

    final currentTier = existing.currentTier;
    int newTier = currentTier;
    int weeksAboveNext = existing.weeksAboveNext;
    int weeksBelowCurrent = existing.weeksBelowCurrent;

    // Check promotion: if calculated tier > current tier
    if (result.tier > currentTier) {
      weeksAboveNext++;
      weeksBelowCurrent = 0;
      if (weeksAboveNext >= 2) {
        newTier = currentTier + 1; // Promote one tier at a time
        weeksAboveNext = 0;
      }
    }
    // Check demotion: if calculated tier < current tier
    else if (result.tier < currentTier) {
      weeksBelowCurrent++;
      weeksAboveNext = 0;
      if (weeksBelowCurrent >= 2) {
        newTier = currentTier - 1; // Demote one tier at a time
        weeksBelowCurrent = 0;
      }
    } else {
      // Stable at current tier
      weeksAboveNext = 0;
      weeksBelowCurrent = 0;
    }

    newTier = newTier.clamp(1, 15);

    await (db.update(db.userLeagues)..where((l) => l.userId.equals(userId)))
        .write(UserLeaguesCompanion(
      currentTier: Value(newTier),
      weeksAtCurrentTier: Value(
        newTier == currentTier ? existing.weeksAtCurrentTier + 1 : 0,
      ),
      weeksAboveNext: Value(weeksAboveNext),
      weeksBelowCurrent: Value(weeksBelowCurrent),
      lastCalculatedAt: Value(DateTime.now()),
    ));
  }

  /// Get stored league tier for a user (or 1 if none exists).
  static Future<int> getStoredTier(int userId) async {
    final db = AppDatabase.instance;
    final existing = await (db.select(db.userLeagues)
      ..where((l) => l.userId.equals(userId)))
      .getSingleOrNull();
    return existing?.currentTier ?? 1;
  }
}
