import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../core/constants/notification_messages.dart';
import '../../../core/utils/schedule_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../../database/daos/workout_dao.dart';
import '../../../database/daos/notification_dao.dart';

/// Schedules workout reminder notifications with 5-level urgency escalation.
///
/// On each workout day (when [User.notificationsEnabled] is true), schedules
/// one notification per configured [NotificationWindow], mapping windows to
/// escalation levels 1 (friendly) through 5 (emergency). Falls back to a
/// fixed offset schedule when no windows are configured.
///
/// **Known limitation**: Uses [Future.delayed] — notifications are process-bound
/// and will be silently dropped if the app is killed before delivery. For
/// reliable background delivery, migrate to
/// `FlutterLocalNotificationsPlugin.zonedSchedule()` with the `timezone` package.
class NagScheduler {
  NagScheduler._();

  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(initSettings);
  }

  static Future<void> scheduleNags() async {
    final db = AppDatabase.instance;
    final userDao = UserDao(db);
    final workoutDao = WorkoutDao(db);
    final gamificationDao = GamificationDao(db);
    final notificationDao = NotificationDao(db);

    final user = await userDao.getOrCreateUser();
    if (!user.notificationsEnabled) return;

    // Cancel all existing notifications
    await _notifications.cancelAll();

    final workedOutToday = await workoutDao.hasWorkoutToday(user.id);
    if (workedOutToday) return;

    final now = DateTime.now();
    final isWorkoutDay = await ScheduleHelper.isWorkoutDay(user, now);
    final streak = await gamificationDao.getOrCreateStreak(user.id);

    if (!isWorkoutDay) {
      // Rest day - single friendly message
      final baseTime = DateTime(now.year, now.month, now.day, user.preferredHour, user.preferredMinute);
      await _scheduleNotification(
        id: 100,
        title: 'FitNag',
        body: _pickMessage(NagMessages.restDay, []),
        scheduledTime: baseTime,
      );
      return;
    }

    // Get notification windows
    final windows = await notificationDao.getWindows(user.id);
    final recentMessages = await notificationDao.getRecentMessages(user.id, 1);
    final midnight = DateTime(now.year, now.month, now.day + 1);

    if (windows.isEmpty) {
      // Fallback to legacy single-time nags
      await _scheduleLegacyNags(user, streak, recentMessages, now, midnight);
      return;
    }

    // Schedule one nag per window with escalating urgency
    final messageLevels = _mapWindowsToLevels(windows.length);
    final rng = Random();

    for (int i = 0; i < windows.length; i++) {
      final window = windows[i];
      final level = messageLevels[i];
      final messages = _messagesForLevel(level);

      // Pick random time within window
      final windowStart = DateTime(now.year, now.month, now.day, window.startHour, window.startMinute);
      final windowEnd = DateTime(now.year, now.month, now.day, window.endHour, window.endMinute);
      final windowDuration = windowEnd.difference(windowStart);

      if (windowDuration.inMinutes <= 0) continue;

      final randomOffset = Duration(minutes: rng.nextInt(windowDuration.inMinutes));
      final scheduledTime = windowStart.add(randomOffset);

      if (scheduledTime.isAfter(now) && scheduledTime.isBefore(midnight)) {
        final msg = NagMessages.insertStreak(
          _pickMessage(messages, recentMessages),
          streak.currentStreak,
        );
        await _scheduleNotification(
          id: i + 1,
          title: level >= 4 ? 'EMERGENCY - FitNag' : 'FitNag',
          body: msg,
          scheduledTime: scheduledTime,
        );
      }
    }

    // Last-chance nag at 22:00 if no window ends after 22:00
    final lastWindowEnd = windows.isNotEmpty
        ? DateTime(now.year, now.month, now.day, windows.last.endHour, windows.last.endMinute)
        : now;
    final lastChanceTime = DateTime(now.year, now.month, now.day, 22, 0);

    if (lastWindowEnd.isBefore(lastChanceTime) && lastChanceTime.isAfter(now)) {
      final msg = NagMessages.insertStreak(
        _pickMessage(NagMessages.level5, recentMessages),
        streak.currentStreak,
      );
      await _scheduleNotification(
        id: 99,
        title: 'EMERGENCY - FitNag',
        body: msg,
        scheduledTime: lastChanceTime,
      );
    }
  }

  /// Legacy single-time nag scheduling (fallback when no windows configured)
  static Future<void> _scheduleLegacyNags(
    User user,
    Streak streak,
    List<String> recentMessages,
    DateTime now,
    DateTime midnight,
  ) async {
    final baseTime = DateTime(now.year, now.month, now.day, user.preferredHour, user.preferredMinute);

    final levels = [
      (0, NagMessages.level1, 'FitNag'),
      (2, NagMessages.level2, 'FitNag'),
      (4, NagMessages.level3, 'FitNag'),
      (6, NagMessages.level4, 'FitNag'),
    ];

    for (int i = 0; i < levels.length; i++) {
      final (hoursOffset, messages, title) = levels[i];
      final scheduledTime = baseTime.add(Duration(hours: hoursOffset));
      if (scheduledTime.isAfter(now) && scheduledTime.isBefore(midnight)) {
        final msg = NagMessages.insertStreak(
          _pickMessage(messages, recentMessages),
          streak.currentStreak,
        );
        await _scheduleNotification(
          id: i + 1,
          title: title,
          body: msg,
          scheduledTime: scheduledTime,
        );
      }
    }

    // Level 5: 2 hours before midnight
    final lastChanceTime = midnight.subtract(const Duration(hours: 2));
    if (lastChanceTime.isAfter(now)) {
      final msg = NagMessages.insertStreak(
        _pickMessage(NagMessages.level5, recentMessages),
        streak.currentStreak,
      );
      await _scheduleNotification(
        id: 5,
        title: 'EMERGENCY - FitNag',
        body: msg,
        scheduledTime: lastChanceTime,
      );
    }
  }

  /// Maps number of windows to escalation levels (1-5)
  static List<int> _mapWindowsToLevels(int windowCount) {
    return switch (windowCount) {
      1 => [1],
      2 => [1, 3],
      3 => [1, 3, 5],
      4 => [1, 2, 4, 5],
      5 => [1, 2, 3, 4, 5],
      _ => [1],
    };
  }

  static List<String> _messagesForLevel(int level) {
    return switch (level) {
      1 => NagMessages.level1,
      2 => NagMessages.level2,
      3 => NagMessages.level3,
      4 => NagMessages.level4,
      5 => NagMessages.level5,
      _ => NagMessages.level1,
    };
  }

  static Future<void> cancelAllNags() async {
    await _notifications.cancelAll();
  }

  static Future<void> scheduleMissedDayMessage() async {
    final msg = _pickMessage(NagMessages.missedDay, []);
    final now = DateTime.now();
    final tomorrow8am = DateTime(now.year, now.month, now.day + 1, 8, 0);

    await _scheduleNotification(
      id: 50,
      title: 'FitNag',
      body: msg,
      scheduledTime: tomorrow8am,
    );
  }

  /// Create a default notification window from user's preferred time.
  static Future<void> createDefaultWindow(int userId) async {
    final db = AppDatabase.instance;
    final notificationDao = NotificationDao(db);
    final userDao = UserDao(db);
    final user = await userDao.getOrCreateUser();

    final windows = await notificationDao.getWindows(userId);
    if (windows.isNotEmpty) return;

    final startHour = user.preferredHour;
    final endHour = (startHour + 2).clamp(0, 23);

    await notificationDao.addWindow(
      NotificationWindowsCompanion.insert(
        userId: userId,
        startHour: startHour,
        startMinute: user.preferredMinute,
        endHour: endHour,
        endMinute: user.preferredMinute,
        orderIndex: 0,
      ),
    );
  }

  static String _pickMessage(List<String> pool, List<String> recentlyUsed) {
    final rng = Random();
    final unused = pool.where((m) => !recentlyUsed.contains(m)).toList();
    final candidates = unused.isNotEmpty ? unused : pool;
    return candidates[rng.nextInt(candidates.length)];
  }

  static Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    final delay = scheduledTime.difference(DateTime.now());
    if (delay.isNegative) return;

    // ARCHITECTURAL LIMITATION: Future.delayed is bound to the Dart process
    // lifetime. If the app is killed before [scheduledTime], the notification
    // is never delivered. Fix: migrate to FlutterLocalNotificationsPlugin
    // .zonedSchedule() with the 'timezone' package for true background delivery.
    Future.delayed(delay, () async {
      await _notifications.show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'fitnag_nags',
            'Workout Reminders',
            channelDescription: 'FitNag workout reminders and nags',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    });
  }
}
