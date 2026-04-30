import 'package:drift/drift.dart';
import '../app_database.dart';

part 'notification_dao.g.dart';

@DriftAccessor(tables: [NotificationLog, NotificationWindows])
class NotificationDao extends DatabaseAccessor<AppDatabase>
    with _$NotificationDaoMixin {
  NotificationDao(super.db);

  // ─── Notification Log ───

  Future<void> logNotification(int userId, int nagLevel, String message) {
    return into(notificationLog).insert(
      NotificationLogCompanion.insert(
        userId: userId,
        nagLevel: nagLevel,
        message: message,
      ),
    );
  }

  Future<List<String>> getRecentMessages(int userId, int nagLevel, {int limit = 10}) async {
    final rows = await (select(notificationLog)
          ..where((n) => n.userId.equals(userId) & n.nagLevel.equals(nagLevel))
          ..orderBy([(n) => OrderingTerm.desc(n.sentAt)])
          ..limit(limit))
        .get();
    return rows.map((r) => r.message).toList();
  }

  // ─── Notification Windows ───

  Future<List<NotificationWindow>> getWindows(int userId) {
    return (select(notificationWindows)
          ..where((w) => w.userId.equals(userId))
          ..orderBy([(w) => OrderingTerm.asc(w.orderIndex)]))
        .get();
  }

  Future<int> addWindow(NotificationWindowsCompanion window) {
    return into(notificationWindows).insert(window);
  }

  Future<void> deleteWindow(int windowId) {
    return (delete(notificationWindows)..where((w) => w.id.equals(windowId))).go();
  }

  Future<void> deleteAllWindows(int userId) {
    return (delete(notificationWindows)..where((w) => w.userId.equals(userId))).go();
  }

  Future<void> replaceWindows(int userId, List<NotificationWindowsCompanion> windows) async {
    await (delete(notificationWindows)..where((w) => w.userId.equals(userId))).go();
    for (final window in windows) {
      await into(notificationWindows).insert(window);
    }
  }
}
