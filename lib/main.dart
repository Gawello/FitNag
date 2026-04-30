import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'database/app_database.dart';
import 'database/daos/exercise_dao.dart';
import 'database/daos/gamification_dao.dart';
import 'features/notifications/services/nag_scheduler.dart';
import 'features/workouts/services/tempo_metronome.dart';
import 'seed/exercise_seed_data.dart';
import 'seed/badge_seed_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final db = AppDatabase.instance;
  await _seedDataIfNeeded(db);
  await TempoMetronome.initialize();
  await NagScheduler.initialize();

  runApp(const ProviderScope(child: FitNagApp()));
}

Future<void> _seedDataIfNeeded(AppDatabase db) async {
  final exerciseDao = ExerciseDao(db);
  final count = await exerciseDao.countExercises();
  if (count == 0) {
    await exerciseDao.insertAllExercises(ExerciseSeedData.all);
  }

  final gamificationDao = GamificationDao(db);
  final badges = await gamificationDao.getAllBadges();
  if (badges.isEmpty) {
    for (final badge in BadgeSeedData.all) {
      await gamificationDao.insertBadge(badge);
    }
  }
}
