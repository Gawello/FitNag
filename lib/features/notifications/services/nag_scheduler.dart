import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

import '../../../core/constants/notification_messages.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/schedule_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../../database/daos/workout_dao.dart';
import '../../../database/daos/notification_dao.dart';

/// Schedules workout reminder notifications with 5-level urgency escalation.
///
/// Notifications are delivered via [FlutterLocalNotificationsPlugin.zonedSchedule],
/// which schedules an OS-level alarm that survives app backgrounding and device
/// reboots (when [RECEIVE_BOOT_COMPLETED] is declared in AndroidManifest.xml
/// and the plugin's boot receiver is registered).
///
/// On each workout day (when [User.notificationsEnabled] is true), schedules
/// one notification per configured [NotificationWindow], mapping windows to
/// escalation levels 1 (friendly) through 5 (emergency). Falls back to a
/// fixed offset schedule when no windows are configured.
///
/// Call [initialize] once at app startup before any other method.
class NagScheduler {
  NagScheduler._();

  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static const _channelId = 'fitnag_nags';
  static const _channelName = 'Workout Reminders';
  static const _channelDescription = 'FitNag workout reminders and nags';

  /// Initializes the plugin and timezone database.
  ///
  /// Must be called in [main] before [runApp].
  static Future<void> initialize() async {
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    await _createChannel();
  }

  static void _onNotificationTap(NotificationResponse response) {
    AppLogger.debug(
      'Notification tapped: id=${response.id} payload=${response.payload}',
      tag: 'NagScheduler',
    );
  }

  /// Creates the Android notification channel with HIGH importance.
  ///
  /// Safe to call multiple times — Android deduplicates by channel ID.
  static Future<void> _createChannel() async {
    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Requests the POST_NOTIFICATIONS runtime permission on Android 13+.
  ///
  /// Returns true if permission was granted or not needed (API < 33).
  static Future<bool> requestPermission() async {
    final androidImpl = _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidImpl == null) return true;

    final granted = await androidImpl.requestNotificationsPermission();
    if (granted != true) {
      AppLogger.warning(
        'POST_NOTIFICATIONS permission not granted by user',
        tag: 'NagScheduler',
      );
    }
    return granted ?? false;
  }

  static Future<void> scheduleNags() async {
    final db = AppDatabase.instance;
    final userDao = UserDao(db);
    final workoutDao = WorkoutDao(db);
    final gamificationDao = GamificationDao(db);
    final notificationDao = NotificationDao(db);

    final user = await userDao.getOrCreateUser();
    if (!user.notificationsEnabled) return;

    await _notifications.cancelAll();

    final workedOutToday = await workoutDao.hasWorkoutToday(user.id);
    if (workedOutToday) return;

    final now = DateTime.now();
    final isWorkoutDay = await ScheduleHelper.isWorkoutDay(user, now);
    final streak = await gamificationDao.getOrCreateStreak(user.id);

    if (!isWorkoutDay) {
      // Rest day — single friendly message
      final baseTime = DateTime(now.year, now.month, now.day, user.preferredHour, user.preferredMinute);
      await _scheduleNotification(
        id: 100,
        title: 'FitNag',
        body: _pickMessage(NagMessages.restDay, []),
        scheduledTime: baseTime,
      );
      return;
    }

    final windows = await notificationDao.getWindows(user.id);
    final recentMessages = await notificationDao.getRecentMessages(user.id, 1);
    final midnight = DateTime(now.year, now.month, now.day + 1);

    if (windows.isEmpty) {
      await _scheduleLegacyNags(user, streak, recentMessages, now, midnight);
      return;
    }

    final messageLevels = _mapWindowsToLevels(windows.length);
    final rng = Random();

    for (int i = 0; i < windows.length; i++) {
      final window = windows[i];
      final level = messageLevels[i];
      final messages = _messagesForLevel(level);

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

  /// Creates a default notification window from user's preferred time.
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

  /// Schedules a notification at [scheduledTime] using the OS alarm system.
  ///
  /// Uses [zonedSchedule] so the notification survives app backgrounding
  /// and device reboots. Requires the boot receiver and exact-alarm permission
  /// declared in AndroidManifest.xml.
  static Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    if (scheduledTime.isBefore(DateTime.now())) return;

    final tzTime = tz.TZDateTime.from(scheduledTime, tz.local);

    try {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        tzTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            playSound: true,
            enableVibration: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'nag_$id',
      );
      AppLogger.debug(
        'Scheduled nag #$id at $scheduledTime',
        tag: 'NagScheduler',
      );
    } catch (e) {
      AppLogger.warning(
        'Failed to schedule notification #$id at $scheduledTime',
        tag: 'NagScheduler',
        error: e,
      );
    }
  }
}
