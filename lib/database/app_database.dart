import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../core/constants/exercise_constants.dart';
import 'daos/exercise_dao.dart';
import 'daos/user_dao.dart';
import 'daos/workout_dao.dart';
import 'daos/gamification_dao.dart';
import 'daos/measurement_dao.dart';
import 'daos/notification_dao.dart';

part 'app_database.g.dart';

// ─── Tables ───

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant(''))();
  IntColumn get difficultyIndex => integer().withDefault(const Constant(0))();
  IntColumn get trainingFocusIndex => integer().withDefault(const Constant(3))();
  RealColumn get heightCm => real().nullable()();
  RealColumn get weightKg => real().nullable()();
  IntColumn get workoutDaysPerWeek => integer().withDefault(const Constant(3))();
  TextColumn get workoutDays => text().withDefault(const Constant('1,3,5'))();
  IntColumn get preferredHour => integer().withDefault(const Constant(9))();
  IntColumn get preferredMinute => integer().withDefault(const Constant(0))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get onboardingComplete => boolean().withDefault(const Constant(false))();
  // Schedule mode: 0 = specific weekdays, 1 = fixed interval, 2 = adaptive
  IntColumn get scheduleMode => integer().withDefault(const Constant(0))();
  IntColumn get intervalDays => integer().withDefault(const Constant(2))();
  DateTimeColumn get intervalStartDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class UserEquipment extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get equipmentIndex => integer()();
}

class UserFocusBodyparts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get bodyPartIndex => integer()();
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get instructions => text().withDefault(const Constant(''))();
  IntColumn get bodyPartIndex => integer()();
  IntColumn get equipmentIndex => integer()();
  IntColumn get difficultyIndex => integer()();
  IntColumn get muscleActionIndex => integer()();
  IntColumn get defaultSets => integer().withDefault(const Constant(3))();
  IntColumn get defaultReps => integer().withDefault(const Constant(10))();
  IntColumn get defaultDurationSecs => integer().nullable()();
  TextColumn get imageAsset => text().nullable()();
  TextColumn get defaultTempo => text().withDefault(const Constant('2-1-1-0'))();
  IntColumn get secondaryEquipmentIndex => integer().nullable()();
}

class WorkoutPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PlanDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get planId => integer().references(WorkoutPlans, #id)();
  IntColumn get dayOfWeek => integer()();
  TextColumn get label => text().withDefault(const Constant(''))();
}

class PlanDayExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get planDayId => integer().references(PlanDays, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get orderIndex => integer()();
  IntColumn get sets => integer().withDefault(const Constant(3))();
  IntColumn get reps => integer().withDefault(const Constant(10))();
  IntColumn get durationSecs => integer().nullable()();
  TextColumn get tempo => text().nullable()();
}

class WorkoutSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get planDayId => integer().nullable().references(PlanDays, #id)();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get totalXpEarned => integer().withDefault(const Constant(0))();
  BoolColumn get allSetsCompleted => boolean().withDefault(const Constant(false))();
}

class SessionSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(WorkoutSessions, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repsCompleted => integer().nullable()();
  RealColumn get weightUsed => real().nullable()();
  IntColumn get durationSecs => integer().nullable()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

class BodyMeasurements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  DateTimeColumn get measuredAt => dateTime().withDefault(currentDateAndTime)();
  RealColumn get weightKg => real().nullable()();
  RealColumn get heightCm => real().nullable()();
  RealColumn get bmi => real().nullable()();
  RealColumn get chestCm => real().nullable()();
  RealColumn get waistCm => real().nullable()();
  RealColumn get hipsCm => real().nullable()();
  RealColumn get bicepsCm => real().nullable()();
  RealColumn get thighsCm => real().nullable()();
  RealColumn get calvesCm => real().nullable()();
  RealColumn get neckCm => real().nullable()();
  RealColumn get forearmCm => real().nullable()();
}

class Streaks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastWorkoutDate => dateTime().nullable()();
}

class XpLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get amount => integer()();
  TextColumn get reason => text()();
  DateTimeColumn get earnedAt => dateTime().withDefault(currentDateAndTime)();
}

class Badges extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get iconAsset => text().withDefault(const Constant(''))();
  TextColumn get category => text()();
}

class UserBadges extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get badgeId => integer().references(Badges, #id)();
  DateTimeColumn get earnedAt => dateTime().withDefault(currentDateAndTime)();
}

class NotificationWindows extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get startHour => integer()();
  IntColumn get startMinute => integer()();
  IntColumn get endHour => integer()();
  IntColumn get endMinute => integer()();
  IntColumn get orderIndex => integer()();
}

class NotificationLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get nagLevel => integer()();
  TextColumn get message => text()();
  DateTimeColumn get sentAt => dateTime().withDefault(currentDateAndTime)();
}

class ExercisePreferences extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  // 0=normal, 1=favorite, 2=blacklisted
  IntColumn get preference => integer().withDefault(const Constant(0))();

  @override
  List<Set<Column>> get uniqueKeys => [{userId, exerciseId}];
}

class UserLeagues extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get currentTier => integer().withDefault(const Constant(1))();
  IntColumn get weeksAtCurrentTier => integer().withDefault(const Constant(0))();
  IntColumn get weeksAboveNext => integer().withDefault(const Constant(0))();
  IntColumn get weeksBelowCurrent => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastCalculatedAt => dateTime().nullable()();
}

// ─── Database ───

@DriftDatabase(
  tables: [
    Users,
    UserEquipment,
    UserFocusBodyparts,
    Exercises,
    WorkoutPlans,
    PlanDays,
    PlanDayExercises,
    WorkoutSessions,
    SessionSets,
    BodyMeasurements,
    Streaks,
    XpLog,
    Badges,
    UserBadges,
    NotificationWindows,
    NotificationLog,
    ExercisePreferences,
    UserLeagues,
  ],
  daos: [
    ExerciseDao,
    UserDao,
    WorkoutDao,
    GamificationDao,
    MeasurementDao,
    NotificationDao,
  ],
)
/// Singleton Drift database for FitNag.
///
/// Holds 18 tables across five domains:
/// - **User profile**: `users`, `user_equipment`, `user_focus_bodyparts`
/// - **Exercises**: `exercises`, `exercise_preferences`
/// - **Workout tracking**: `workout_plans`, `plan_days`, `plan_day_exercises`,
///   `workout_sessions`, `session_sets`
/// - **Measurements**: `body_measurements`
/// - **Gamification**: `streaks`, `xp_log`, `badges`, `user_badges`, `user_leagues`
/// - **Notifications**: `notification_windows`, `notification_log`
///
/// Schema version: 5. All reads and writes go through one of the six DAOs.
/// Access via [AppDatabase.instance].
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static AppDatabase? _instance;
  static AppDatabase get instance => _instance ??= AppDatabase._();

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(exercises, exercises.defaultTempo);
          await m.addColumn(planDayExercises, planDayExercises.tempo);
          await m.createTable(notificationWindows);
        }
        if (from < 3) {
          await m.addColumn(users, users.scheduleMode);
          await m.addColumn(users, users.intervalDays);
          await m.addColumn(users, users.intervalStartDate);
        }
        if (from < 4) {
          await m.addColumn(exercises, exercises.secondaryEquipmentIndex);
          // Update existing exercises with secondary equipment data
          final benchIdx = Equipment.bench.index;
          final chairIdx = Equipment.chair.index;
          final barbellIdx = Equipment.straightBarbell.index;
          await customStatement(
            "UPDATE exercises SET secondary_equipment_index = $benchIdx WHERE name IN ('Dumbbell Bench Press', 'Dumbbell Fly', 'Barbell Bench Press', 'Dumbbell Row', 'Skull Crusher')",
          );
          await customStatement(
            "UPDATE exercises SET secondary_equipment_index = $chairIdx WHERE name IN ('Bulgarian Split Squat', 'Seated Calf Raise')",
          );
          await customStatement(
            "UPDATE exercises SET secondary_equipment_index = $barbellIdx WHERE name = 'Hip Thrust'",
          );
        }
        if (from < 5) {
          await m.createTable(exercisePreferences);
          await m.createTable(userLeagues);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fitnag.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
