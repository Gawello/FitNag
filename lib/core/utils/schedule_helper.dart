import '../../database/app_database.dart';
import '../../database/daos/gamification_dao.dart';

class ScheduleHelper {
  ScheduleHelper._();

  /// Returns true if [date] is a workout day for the given user.
  static Future<bool> isWorkoutDay(User user, DateTime date) async {
    switch (user.scheduleMode) {
      case 0: // Specific weekdays
        final workoutDays = user.workoutDays.split(',').map(int.parse).toList();
        return workoutDays.contains(date.weekday);
      case 1: // Fixed interval from start date
        final startDate = user.intervalStartDate ?? user.createdAt;
        final daysSinceStart = DateTime(date.year, date.month, date.day)
            .difference(DateTime(startDate.year, startDate.month, startDate.day))
            .inDays;
        if (daysSinceStart < 0) return false;
        return daysSinceStart % user.intervalDays == 0;
      case 2: // Adaptive from last workout
        final db = AppDatabase.instance;
        final streak = await GamificationDao(db).getOrCreateStreak(user.id);
        final lastWorkout = streak.lastWorkoutDate;
        if (lastWorkout == null) return true; // Never worked out → today is the day
        final daysSinceLast = DateTime(date.year, date.month, date.day)
            .difference(DateTime(lastWorkout.year, lastWorkout.month, lastWorkout.day))
            .inDays;
        return daysSinceLast >= user.intervalDays;
      default:
        return false;
    }
  }

  /// Returns workout days in a given month (for calendar view).
  static Future<List<DateTime>> getWorkoutDaysInMonth(
      User user, int year, int month) async {
    final days = <DateTime>[];
    final daysInMonth = DateTime(year, month + 1, 0).day;
    for (int d = 1; d <= daysInMonth; d++) {
      final date = DateTime(year, month, d);
      if (await isWorkoutDay(user, date)) {
        days.add(date);
      }
    }
    return days;
  }

  /// Next planned workout day from today (inclusive).
  static Future<DateTime?> nextWorkoutDay(User user) async {
    final today = DateTime.now();
    for (int i = 0; i < 30; i++) {
      final date = today.add(Duration(days: i));
      if (await isWorkoutDay(user, date)) return date;
    }
    return null;
  }

  /// For interval modes, returns the rotational plan day index for a given date.
  /// This cycles through plan days (0, 1, 2, ...) based on workout count.
  static int getRotationalDayIndex(User user, DateTime date, int totalPlanDays) {
    if (totalPlanDays <= 0) return 0;
    switch (user.scheduleMode) {
      case 1: // Fixed interval
        final startDate = user.intervalStartDate ?? user.createdAt;
        final daysSinceStart = DateTime(date.year, date.month, date.day)
            .difference(DateTime(startDate.year, startDate.month, startDate.day))
            .inDays;
        final workoutIndex = daysSinceStart ~/ user.intervalDays;
        return workoutIndex % totalPlanDays;
      default:
        return 0;
    }
  }
}
