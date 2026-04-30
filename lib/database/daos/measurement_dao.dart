import 'package:drift/drift.dart';
import '../app_database.dart';

part 'measurement_dao.g.dart';

@DriftAccessor(tables: [BodyMeasurements])
class MeasurementDao extends DatabaseAccessor<AppDatabase>
    with _$MeasurementDaoMixin {
  MeasurementDao(super.db);

  Future<int> addMeasurement(BodyMeasurementsCompanion measurement) {
    return into(bodyMeasurements).insert(measurement);
  }

  Future<List<BodyMeasurement>> getMeasurements(int userId, {int limit = 50}) {
    return (select(bodyMeasurements)
          ..where((m) => m.userId.equals(userId))
          ..orderBy([(m) => OrderingTerm.desc(m.measuredAt)])
          ..limit(limit))
        .get();
  }

  Stream<List<BodyMeasurement>> watchMeasurements(int userId) {
    return (select(bodyMeasurements)
          ..where((m) => m.userId.equals(userId))
          ..orderBy([(m) => OrderingTerm.desc(m.measuredAt)]))
        .watch();
  }

  Future<BodyMeasurement?> getLatestMeasurement(int userId) {
    return (select(bodyMeasurements)
          ..where((m) => m.userId.equals(userId))
          ..orderBy([(m) => OrderingTerm.desc(m.measuredAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> getMeasurementCount(int userId) async {
    final count = bodyMeasurements.id.count();
    final query = selectOnly(bodyMeasurements)
      ..addColumns([count])
      ..where(bodyMeasurements.userId.equals(userId));
    final result = await query.getSingle();
    return result.read(count)!;
  }
}
