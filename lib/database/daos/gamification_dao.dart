import 'package:drift/drift.dart';
import '../app_database.dart';

part 'gamification_dao.g.dart';

@DriftAccessor(tables: [Streaks, XpLog, Badges, UserBadges])
class GamificationDao extends DatabaseAccessor<AppDatabase>
    with _$GamificationDaoMixin {
  GamificationDao(super.db);

  // ─── Streaks ───

  Future<Streak> getOrCreateStreak(int userId) async {
    final existing = await (select(streaks)
          ..where((s) => s.userId.equals(userId)))
        .getSingleOrNull();
    if (existing != null) return existing;
    final id = await into(streaks).insert(
      StreaksCompanion.insert(userId: userId),
    );
    return (select(streaks)..where((s) => s.id.equals(id))).getSingle();
  }

  Stream<Streak> watchStreak(int userId) {
    return (select(streaks)..where((s) => s.userId.equals(userId)))
        .watchSingle();
  }

  Future<void> updateStreak(int userId, StreaksCompanion companion) async {
    await (update(streaks)..where((s) => s.userId.equals(userId)))
        .write(companion);
  }

  // ─── XP ───

  Future<void> addXp(int userId, int amount, String reason) {
    return into(xpLog).insert(
      XpLogCompanion.insert(userId: userId, amount: amount, reason: reason),
    );
  }

  Future<int> getTotalXp(int userId) async {
    final sum = xpLog.amount.sum();
    final query = selectOnly(xpLog)
      ..addColumns([sum])
      ..where(xpLog.userId.equals(userId));
    final result = await query.getSingle();
    return result.read(sum) ?? 0;
  }

  Stream<int> watchTotalXp(int userId) {
    final sum = xpLog.amount.sum();
    final query = selectOnly(xpLog)
      ..addColumns([sum])
      ..where(xpLog.userId.equals(userId));
    return query.watchSingle().map((row) => row.read(sum) ?? 0);
  }

  Future<List<XpLogData>> getRecentXpLog(int userId, {int limit = 20}) {
    return (select(xpLog)
          ..where((x) => x.userId.equals(userId))
          ..orderBy([(x) => OrderingTerm.desc(x.earnedAt)])
          ..limit(limit))
        .get();
  }

  // ─── Badges ───

  Future<void> insertBadge(BadgesCompanion badge) {
    return into(badges).insert(badge, mode: InsertMode.insertOrIgnore);
  }

  Future<List<Badge>> getAllBadges() => select(badges).get();

  Future<List<UserBadge>> getUserBadges(int userId) {
    return (select(userBadges)..where((b) => b.userId.equals(userId))).get();
  }

  Future<bool> hasBadge(int userId, int badgeId) async {
    final result = await (select(userBadges)
          ..where((b) => b.userId.equals(userId) & b.badgeId.equals(badgeId)))
        .getSingleOrNull();
    return result != null;
  }

  Future<void> awardBadge(int userId, int badgeId) async {
    if (await hasBadge(userId, badgeId)) return;
    await into(userBadges).insert(
      UserBadgesCompanion.insert(userId: userId, badgeId: badgeId),
    );
  }

  Future<Badge?> getBadgeByKey(String key) {
    return (select(badges)..where((b) => b.key.equals(key))).getSingleOrNull();
  }
}
