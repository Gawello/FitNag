import 'package:drift/drift.dart';
import '../app_database.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users, UserEquipment, UserFocusBodyparts])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<User> getOrCreateUser() async {
    final existing = await select(users).getSingleOrNull();
    if (existing != null) return existing;
    final id = await into(users).insert(UsersCompanion.insert());
    return (select(users)..where((u) => u.id.equals(id))).getSingle();
  }

  Future<void> updateUser(UsersCompanion companion) async {
    final user = await getOrCreateUser();
    await (update(users)..where((u) => u.id.equals(user.id))).write(companion);
  }

  Stream<User> watchUser() {
    return (select(users)..limit(1)).watchSingle();
  }

  Future<void> setEquipment(int userId, List<int> equipmentIndices) async {
    await (delete(userEquipment)..where((e) => e.userId.equals(userId))).go();
    for (final idx in equipmentIndices) {
      await into(userEquipment).insert(
        UserEquipmentCompanion.insert(userId: userId, equipmentIndex: idx),
      );
    }
  }

  Future<List<int>> getEquipment(int userId) async {
    final rows = await (select(userEquipment)
          ..where((e) => e.userId.equals(userId)))
        .get();
    return rows.map((r) => r.equipmentIndex).toList();
  }

  Future<void> setFocusBodyparts(int userId, List<int> bodypartIndices) async {
    await (delete(userFocusBodyparts)..where((e) => e.userId.equals(userId))).go();
    for (final idx in bodypartIndices) {
      await into(userFocusBodyparts).insert(
        UserFocusBodypartsCompanion.insert(userId: userId, bodyPartIndex: idx),
      );
    }
  }

  Future<List<int>> getFocusBodyparts(int userId) async {
    final rows = await (select(userFocusBodyparts)
          ..where((e) => e.userId.equals(userId)))
        .get();
    return rows.map((r) => r.bodyPartIndex).toList();
  }
}
