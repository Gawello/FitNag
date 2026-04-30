import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../database/app_database.dart';
import '../../../database/daos/measurement_dao.dart';
import '../../../database/daos/user_dao.dart';

final measurementsProvider = FutureProvider<List<BodyMeasurement>>((ref) async {
  final db = AppDatabase.instance;
  final user = await UserDao(db).getOrCreateUser();
  return MeasurementDao(db).getMeasurements(user.id);
});

final latestMeasurementProvider = FutureProvider<BodyMeasurement?>((ref) async {
  final db = AppDatabase.instance;
  final user = await UserDao(db).getOrCreateUser();
  return MeasurementDao(db).getLatestMeasurement(user.id);
});
