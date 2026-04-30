import 'package:drift/drift.dart';
import '../app_database.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [Exercises, ExercisePreferences])
class ExerciseDao extends DatabaseAccessor<AppDatabase> with _$ExerciseDaoMixin {
  ExerciseDao(super.db);

  Future<List<Exercise>> getAllExercises() => select(exercises).get();

  Stream<List<Exercise>> watchAllExercises() => select(exercises).watch();

  Future<List<Exercise>> getByBodyPart(int bodyPartIndex) {
    return (select(exercises)..where((e) => e.bodyPartIndex.equals(bodyPartIndex))).get();
  }

  Future<List<Exercise>> getByEquipment(int equipmentIndex) {
    return (select(exercises)..where((e) => e.equipmentIndex.equals(equipmentIndex))).get();
  }

  Future<List<Exercise>> getByDifficulty(int difficultyIndex) {
    return (select(exercises)..where((e) => e.difficultyIndex.isSmallerThanValue(difficultyIndex + 1))).get();
  }

  Future<List<Exercise>> getFiltered({
    List<int>? equipmentIndices,
    int? maxDifficulty,
    int? bodyPartIndex,
  }) {
    return (select(exercises)
          ..where((e) {
            Expression<bool> condition = const Constant(true);
            if (equipmentIndices != null && equipmentIndices.isNotEmpty) {
              // Primary equipment must be in user's list
              condition = condition & e.equipmentIndex.isIn(equipmentIndices);
              // Secondary equipment (if set) must also be in user's list
              condition = condition &
                  (e.secondaryEquipmentIndex.isNull() |
                   e.secondaryEquipmentIndex.isIn(equipmentIndices));
            }
            if (maxDifficulty != null) {
              condition = condition & e.difficultyIndex.isSmallerOrEqualValue(maxDifficulty);
            }
            if (bodyPartIndex != null) {
              condition = condition & e.bodyPartIndex.equals(bodyPartIndex);
            }
            return condition;
          }))
        .get();
  }

  Future<void> insertExercise(ExercisesCompanion exercise) {
    return into(exercises).insert(exercise);
  }

  Future<void> insertAllExercises(List<ExercisesCompanion> exerciseList) async {
    await batch((b) {
      b.insertAll(exercises, exerciseList);
    });
  }

  Future<int> countExercises() async {
    final count = exercises.id.count();
    final query = selectOnly(exercises)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count)!;
  }

  // ─── Exercise Preferences ───

  Future<void> setExercisePreference(int userId, int exerciseId, int preference) async {
    // Delete existing then insert (upsert)
    await (delete(exercisePreferences)
      ..where((p) => p.userId.equals(userId) & p.exerciseId.equals(exerciseId)))
      .go();
    if (preference != 0) {
      await into(exercisePreferences).insert(
        ExercisePreferencesCompanion.insert(
          userId: userId,
          exerciseId: exerciseId,
          preference: Value(preference),
        ),
      );
    }
  }

  Future<int> getExercisePreference(int userId, int exerciseId) async {
    final result = await (select(exercisePreferences)
      ..where((p) => p.userId.equals(userId) & p.exerciseId.equals(exerciseId)))
      .getSingleOrNull();
    return result?.preference ?? 0;
  }

  Future<List<int>> getBlacklistedIds(int userId) async {
    final results = await (select(exercisePreferences)
      ..where((p) => p.userId.equals(userId) & p.preference.equals(2)))
      .get();
    return results.map((r) => r.exerciseId).toList();
  }

  Future<List<int>> getFavoriteIds(int userId) async {
    final results = await (select(exercisePreferences)
      ..where((p) => p.userId.equals(userId) & p.preference.equals(1)))
      .get();
    return results.map((r) => r.exerciseId).toList();
  }

  Future<Map<int, int>> getAllPreferences(int userId) async {
    final results = await (select(exercisePreferences)
      ..where((p) => p.userId.equals(userId)))
      .get();
    return {for (final r in results) r.exerciseId: r.preference};
  }
}
