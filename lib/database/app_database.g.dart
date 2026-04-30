// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _difficultyIndexMeta = const VerificationMeta(
    'difficultyIndex',
  );
  @override
  late final GeneratedColumn<int> difficultyIndex = GeneratedColumn<int>(
    'difficulty_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _trainingFocusIndexMeta =
      const VerificationMeta('trainingFocusIndex');
  @override
  late final GeneratedColumn<int> trainingFocusIndex = GeneratedColumn<int>(
    'training_focus_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workoutDaysPerWeekMeta =
      const VerificationMeta('workoutDaysPerWeek');
  @override
  late final GeneratedColumn<int> workoutDaysPerWeek = GeneratedColumn<int>(
    'workout_days_per_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _workoutDaysMeta = const VerificationMeta(
    'workoutDays',
  );
  @override
  late final GeneratedColumn<String> workoutDays = GeneratedColumn<String>(
    'workout_days',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1,3,5'),
  );
  static const VerificationMeta _preferredHourMeta = const VerificationMeta(
    'preferredHour',
  );
  @override
  late final GeneratedColumn<int> preferredHour = GeneratedColumn<int>(
    'preferred_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(9),
  );
  static const VerificationMeta _preferredMinuteMeta = const VerificationMeta(
    'preferredMinute',
  );
  @override
  late final GeneratedColumn<int> preferredMinute = GeneratedColumn<int>(
    'preferred_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _onboardingCompleteMeta =
      const VerificationMeta('onboardingComplete');
  @override
  late final GeneratedColumn<bool> onboardingComplete = GeneratedColumn<bool>(
    'onboarding_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _scheduleModeMeta = const VerificationMeta(
    'scheduleMode',
  );
  @override
  late final GeneratedColumn<int> scheduleMode = GeneratedColumn<int>(
    'schedule_mode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _intervalStartDateMeta = const VerificationMeta(
    'intervalStartDate',
  );
  @override
  late final GeneratedColumn<DateTime> intervalStartDate =
      GeneratedColumn<DateTime>(
        'interval_start_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    difficultyIndex,
    trainingFocusIndex,
    heightCm,
    weightKg,
    workoutDaysPerWeek,
    workoutDays,
    preferredHour,
    preferredMinute,
    notificationsEnabled,
    onboardingComplete,
    scheduleMode,
    intervalDays,
    intervalStartDate,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('difficulty_index')) {
      context.handle(
        _difficultyIndexMeta,
        difficultyIndex.isAcceptableOrUnknown(
          data['difficulty_index']!,
          _difficultyIndexMeta,
        ),
      );
    }
    if (data.containsKey('training_focus_index')) {
      context.handle(
        _trainingFocusIndexMeta,
        trainingFocusIndex.isAcceptableOrUnknown(
          data['training_focus_index']!,
          _trainingFocusIndexMeta,
        ),
      );
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('workout_days_per_week')) {
      context.handle(
        _workoutDaysPerWeekMeta,
        workoutDaysPerWeek.isAcceptableOrUnknown(
          data['workout_days_per_week']!,
          _workoutDaysPerWeekMeta,
        ),
      );
    }
    if (data.containsKey('workout_days')) {
      context.handle(
        _workoutDaysMeta,
        workoutDays.isAcceptableOrUnknown(
          data['workout_days']!,
          _workoutDaysMeta,
        ),
      );
    }
    if (data.containsKey('preferred_hour')) {
      context.handle(
        _preferredHourMeta,
        preferredHour.isAcceptableOrUnknown(
          data['preferred_hour']!,
          _preferredHourMeta,
        ),
      );
    }
    if (data.containsKey('preferred_minute')) {
      context.handle(
        _preferredMinuteMeta,
        preferredMinute.isAcceptableOrUnknown(
          data['preferred_minute']!,
          _preferredMinuteMeta,
        ),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('onboarding_complete')) {
      context.handle(
        _onboardingCompleteMeta,
        onboardingComplete.isAcceptableOrUnknown(
          data['onboarding_complete']!,
          _onboardingCompleteMeta,
        ),
      );
    }
    if (data.containsKey('schedule_mode')) {
      context.handle(
        _scheduleModeMeta,
        scheduleMode.isAcceptableOrUnknown(
          data['schedule_mode']!,
          _scheduleModeMeta,
        ),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('interval_start_date')) {
      context.handle(
        _intervalStartDateMeta,
        intervalStartDate.isAcceptableOrUnknown(
          data['interval_start_date']!,
          _intervalStartDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      difficultyIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty_index'],
      )!,
      trainingFocusIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}training_focus_index'],
      )!,
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      workoutDaysPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_days_per_week'],
      )!,
      workoutDays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_days'],
      )!,
      preferredHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preferred_hour'],
      )!,
      preferredMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preferred_minute'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      onboardingComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_complete'],
      )!,
      scheduleMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schedule_mode'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      )!,
      intervalStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}interval_start_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final int difficultyIndex;
  final int trainingFocusIndex;
  final double? heightCm;
  final double? weightKg;
  final int workoutDaysPerWeek;
  final String workoutDays;
  final int preferredHour;
  final int preferredMinute;
  final bool notificationsEnabled;
  final bool onboardingComplete;
  final int scheduleMode;
  final int intervalDays;
  final DateTime? intervalStartDate;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.name,
    required this.difficultyIndex,
    required this.trainingFocusIndex,
    this.heightCm,
    this.weightKg,
    required this.workoutDaysPerWeek,
    required this.workoutDays,
    required this.preferredHour,
    required this.preferredMinute,
    required this.notificationsEnabled,
    required this.onboardingComplete,
    required this.scheduleMode,
    required this.intervalDays,
    this.intervalStartDate,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['difficulty_index'] = Variable<int>(difficultyIndex);
    map['training_focus_index'] = Variable<int>(trainingFocusIndex);
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    map['workout_days_per_week'] = Variable<int>(workoutDaysPerWeek);
    map['workout_days'] = Variable<String>(workoutDays);
    map['preferred_hour'] = Variable<int>(preferredHour);
    map['preferred_minute'] = Variable<int>(preferredMinute);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['onboarding_complete'] = Variable<bool>(onboardingComplete);
    map['schedule_mode'] = Variable<int>(scheduleMode);
    map['interval_days'] = Variable<int>(intervalDays);
    if (!nullToAbsent || intervalStartDate != null) {
      map['interval_start_date'] = Variable<DateTime>(intervalStartDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      difficultyIndex: Value(difficultyIndex),
      trainingFocusIndex: Value(trainingFocusIndex),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      workoutDaysPerWeek: Value(workoutDaysPerWeek),
      workoutDays: Value(workoutDays),
      preferredHour: Value(preferredHour),
      preferredMinute: Value(preferredMinute),
      notificationsEnabled: Value(notificationsEnabled),
      onboardingComplete: Value(onboardingComplete),
      scheduleMode: Value(scheduleMode),
      intervalDays: Value(intervalDays),
      intervalStartDate: intervalStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalStartDate),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      difficultyIndex: serializer.fromJson<int>(json['difficultyIndex']),
      trainingFocusIndex: serializer.fromJson<int>(json['trainingFocusIndex']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      workoutDaysPerWeek: serializer.fromJson<int>(json['workoutDaysPerWeek']),
      workoutDays: serializer.fromJson<String>(json['workoutDays']),
      preferredHour: serializer.fromJson<int>(json['preferredHour']),
      preferredMinute: serializer.fromJson<int>(json['preferredMinute']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      onboardingComplete: serializer.fromJson<bool>(json['onboardingComplete']),
      scheduleMode: serializer.fromJson<int>(json['scheduleMode']),
      intervalDays: serializer.fromJson<int>(json['intervalDays']),
      intervalStartDate: serializer.fromJson<DateTime?>(
        json['intervalStartDate'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'difficultyIndex': serializer.toJson<int>(difficultyIndex),
      'trainingFocusIndex': serializer.toJson<int>(trainingFocusIndex),
      'heightCm': serializer.toJson<double?>(heightCm),
      'weightKg': serializer.toJson<double?>(weightKg),
      'workoutDaysPerWeek': serializer.toJson<int>(workoutDaysPerWeek),
      'workoutDays': serializer.toJson<String>(workoutDays),
      'preferredHour': serializer.toJson<int>(preferredHour),
      'preferredMinute': serializer.toJson<int>(preferredMinute),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'onboardingComplete': serializer.toJson<bool>(onboardingComplete),
      'scheduleMode': serializer.toJson<int>(scheduleMode),
      'intervalDays': serializer.toJson<int>(intervalDays),
      'intervalStartDate': serializer.toJson<DateTime?>(intervalStartDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({
    int? id,
    String? name,
    int? difficultyIndex,
    int? trainingFocusIndex,
    Value<double?> heightCm = const Value.absent(),
    Value<double?> weightKg = const Value.absent(),
    int? workoutDaysPerWeek,
    String? workoutDays,
    int? preferredHour,
    int? preferredMinute,
    bool? notificationsEnabled,
    bool? onboardingComplete,
    int? scheduleMode,
    int? intervalDays,
    Value<DateTime?> intervalStartDate = const Value.absent(),
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    difficultyIndex: difficultyIndex ?? this.difficultyIndex,
    trainingFocusIndex: trainingFocusIndex ?? this.trainingFocusIndex,
    heightCm: heightCm.present ? heightCm.value : this.heightCm,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    workoutDaysPerWeek: workoutDaysPerWeek ?? this.workoutDaysPerWeek,
    workoutDays: workoutDays ?? this.workoutDays,
    preferredHour: preferredHour ?? this.preferredHour,
    preferredMinute: preferredMinute ?? this.preferredMinute,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    scheduleMode: scheduleMode ?? this.scheduleMode,
    intervalDays: intervalDays ?? this.intervalDays,
    intervalStartDate: intervalStartDate.present
        ? intervalStartDate.value
        : this.intervalStartDate,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      difficultyIndex: data.difficultyIndex.present
          ? data.difficultyIndex.value
          : this.difficultyIndex,
      trainingFocusIndex: data.trainingFocusIndex.present
          ? data.trainingFocusIndex.value
          : this.trainingFocusIndex,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      workoutDaysPerWeek: data.workoutDaysPerWeek.present
          ? data.workoutDaysPerWeek.value
          : this.workoutDaysPerWeek,
      workoutDays: data.workoutDays.present
          ? data.workoutDays.value
          : this.workoutDays,
      preferredHour: data.preferredHour.present
          ? data.preferredHour.value
          : this.preferredHour,
      preferredMinute: data.preferredMinute.present
          ? data.preferredMinute.value
          : this.preferredMinute,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      onboardingComplete: data.onboardingComplete.present
          ? data.onboardingComplete.value
          : this.onboardingComplete,
      scheduleMode: data.scheduleMode.present
          ? data.scheduleMode.value
          : this.scheduleMode,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      intervalStartDate: data.intervalStartDate.present
          ? data.intervalStartDate.value
          : this.intervalStartDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('difficultyIndex: $difficultyIndex, ')
          ..write('trainingFocusIndex: $trainingFocusIndex, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('workoutDaysPerWeek: $workoutDaysPerWeek, ')
          ..write('workoutDays: $workoutDays, ')
          ..write('preferredHour: $preferredHour, ')
          ..write('preferredMinute: $preferredMinute, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('scheduleMode: $scheduleMode, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('intervalStartDate: $intervalStartDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    difficultyIndex,
    trainingFocusIndex,
    heightCm,
    weightKg,
    workoutDaysPerWeek,
    workoutDays,
    preferredHour,
    preferredMinute,
    notificationsEnabled,
    onboardingComplete,
    scheduleMode,
    intervalDays,
    intervalStartDate,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.difficultyIndex == this.difficultyIndex &&
          other.trainingFocusIndex == this.trainingFocusIndex &&
          other.heightCm == this.heightCm &&
          other.weightKg == this.weightKg &&
          other.workoutDaysPerWeek == this.workoutDaysPerWeek &&
          other.workoutDays == this.workoutDays &&
          other.preferredHour == this.preferredHour &&
          other.preferredMinute == this.preferredMinute &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.onboardingComplete == this.onboardingComplete &&
          other.scheduleMode == this.scheduleMode &&
          other.intervalDays == this.intervalDays &&
          other.intervalStartDate == this.intervalStartDate &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> difficultyIndex;
  final Value<int> trainingFocusIndex;
  final Value<double?> heightCm;
  final Value<double?> weightKg;
  final Value<int> workoutDaysPerWeek;
  final Value<String> workoutDays;
  final Value<int> preferredHour;
  final Value<int> preferredMinute;
  final Value<bool> notificationsEnabled;
  final Value<bool> onboardingComplete;
  final Value<int> scheduleMode;
  final Value<int> intervalDays;
  final Value<DateTime?> intervalStartDate;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.difficultyIndex = const Value.absent(),
    this.trainingFocusIndex = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.workoutDaysPerWeek = const Value.absent(),
    this.workoutDays = const Value.absent(),
    this.preferredHour = const Value.absent(),
    this.preferredMinute = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.scheduleMode = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.intervalStartDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.difficultyIndex = const Value.absent(),
    this.trainingFocusIndex = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.workoutDaysPerWeek = const Value.absent(),
    this.workoutDays = const Value.absent(),
    this.preferredHour = const Value.absent(),
    this.preferredMinute = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.scheduleMode = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.intervalStartDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? difficultyIndex,
    Expression<int>? trainingFocusIndex,
    Expression<double>? heightCm,
    Expression<double>? weightKg,
    Expression<int>? workoutDaysPerWeek,
    Expression<String>? workoutDays,
    Expression<int>? preferredHour,
    Expression<int>? preferredMinute,
    Expression<bool>? notificationsEnabled,
    Expression<bool>? onboardingComplete,
    Expression<int>? scheduleMode,
    Expression<int>? intervalDays,
    Expression<DateTime>? intervalStartDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (difficultyIndex != null) 'difficulty_index': difficultyIndex,
      if (trainingFocusIndex != null)
        'training_focus_index': trainingFocusIndex,
      if (heightCm != null) 'height_cm': heightCm,
      if (weightKg != null) 'weight_kg': weightKg,
      if (workoutDaysPerWeek != null)
        'workout_days_per_week': workoutDaysPerWeek,
      if (workoutDays != null) 'workout_days': workoutDays,
      if (preferredHour != null) 'preferred_hour': preferredHour,
      if (preferredMinute != null) 'preferred_minute': preferredMinute,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (onboardingComplete != null) 'onboarding_complete': onboardingComplete,
      if (scheduleMode != null) 'schedule_mode': scheduleMode,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (intervalStartDate != null) 'interval_start_date': intervalStartDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? difficultyIndex,
    Value<int>? trainingFocusIndex,
    Value<double?>? heightCm,
    Value<double?>? weightKg,
    Value<int>? workoutDaysPerWeek,
    Value<String>? workoutDays,
    Value<int>? preferredHour,
    Value<int>? preferredMinute,
    Value<bool>? notificationsEnabled,
    Value<bool>? onboardingComplete,
    Value<int>? scheduleMode,
    Value<int>? intervalDays,
    Value<DateTime?>? intervalStartDate,
    Value<DateTime>? createdAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      difficultyIndex: difficultyIndex ?? this.difficultyIndex,
      trainingFocusIndex: trainingFocusIndex ?? this.trainingFocusIndex,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      workoutDaysPerWeek: workoutDaysPerWeek ?? this.workoutDaysPerWeek,
      workoutDays: workoutDays ?? this.workoutDays,
      preferredHour: preferredHour ?? this.preferredHour,
      preferredMinute: preferredMinute ?? this.preferredMinute,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
      scheduleMode: scheduleMode ?? this.scheduleMode,
      intervalDays: intervalDays ?? this.intervalDays,
      intervalStartDate: intervalStartDate ?? this.intervalStartDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (difficultyIndex.present) {
      map['difficulty_index'] = Variable<int>(difficultyIndex.value);
    }
    if (trainingFocusIndex.present) {
      map['training_focus_index'] = Variable<int>(trainingFocusIndex.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (workoutDaysPerWeek.present) {
      map['workout_days_per_week'] = Variable<int>(workoutDaysPerWeek.value);
    }
    if (workoutDays.present) {
      map['workout_days'] = Variable<String>(workoutDays.value);
    }
    if (preferredHour.present) {
      map['preferred_hour'] = Variable<int>(preferredHour.value);
    }
    if (preferredMinute.present) {
      map['preferred_minute'] = Variable<int>(preferredMinute.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (onboardingComplete.present) {
      map['onboarding_complete'] = Variable<bool>(onboardingComplete.value);
    }
    if (scheduleMode.present) {
      map['schedule_mode'] = Variable<int>(scheduleMode.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (intervalStartDate.present) {
      map['interval_start_date'] = Variable<DateTime>(intervalStartDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('difficultyIndex: $difficultyIndex, ')
          ..write('trainingFocusIndex: $trainingFocusIndex, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('workoutDaysPerWeek: $workoutDaysPerWeek, ')
          ..write('workoutDays: $workoutDays, ')
          ..write('preferredHour: $preferredHour, ')
          ..write('preferredMinute: $preferredMinute, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('scheduleMode: $scheduleMode, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('intervalStartDate: $intervalStartDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserEquipmentTable extends UserEquipment
    with TableInfo<$UserEquipmentTable, UserEquipmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEquipmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _equipmentIndexMeta = const VerificationMeta(
    'equipmentIndex',
  );
  @override
  late final GeneratedColumn<int> equipmentIndex = GeneratedColumn<int>(
    'equipment_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, equipmentIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_equipment';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserEquipmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('equipment_index')) {
      context.handle(
        _equipmentIndexMeta,
        equipmentIndex.isAcceptableOrUnknown(
          data['equipment_index']!,
          _equipmentIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEquipmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEquipmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      equipmentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}equipment_index'],
      )!,
    );
  }

  @override
  $UserEquipmentTable createAlias(String alias) {
    return $UserEquipmentTable(attachedDatabase, alias);
  }
}

class UserEquipmentData extends DataClass
    implements Insertable<UserEquipmentData> {
  final int id;
  final int userId;
  final int equipmentIndex;
  const UserEquipmentData({
    required this.id,
    required this.userId,
    required this.equipmentIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['equipment_index'] = Variable<int>(equipmentIndex);
    return map;
  }

  UserEquipmentCompanion toCompanion(bool nullToAbsent) {
    return UserEquipmentCompanion(
      id: Value(id),
      userId: Value(userId),
      equipmentIndex: Value(equipmentIndex),
    );
  }

  factory UserEquipmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEquipmentData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      equipmentIndex: serializer.fromJson<int>(json['equipmentIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'equipmentIndex': serializer.toJson<int>(equipmentIndex),
    };
  }

  UserEquipmentData copyWith({int? id, int? userId, int? equipmentIndex}) =>
      UserEquipmentData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        equipmentIndex: equipmentIndex ?? this.equipmentIndex,
      );
  UserEquipmentData copyWithCompanion(UserEquipmentCompanion data) {
    return UserEquipmentData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      equipmentIndex: data.equipmentIndex.present
          ? data.equipmentIndex.value
          : this.equipmentIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEquipmentData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('equipmentIndex: $equipmentIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, equipmentIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEquipmentData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.equipmentIndex == this.equipmentIndex);
}

class UserEquipmentCompanion extends UpdateCompanion<UserEquipmentData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> equipmentIndex;
  const UserEquipmentCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.equipmentIndex = const Value.absent(),
  });
  UserEquipmentCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int equipmentIndex,
  }) : userId = Value(userId),
       equipmentIndex = Value(equipmentIndex);
  static Insertable<UserEquipmentData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? equipmentIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (equipmentIndex != null) 'equipment_index': equipmentIndex,
    });
  }

  UserEquipmentCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? equipmentIndex,
  }) {
    return UserEquipmentCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      equipmentIndex: equipmentIndex ?? this.equipmentIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (equipmentIndex.present) {
      map['equipment_index'] = Variable<int>(equipmentIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEquipmentCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('equipmentIndex: $equipmentIndex')
          ..write(')'))
        .toString();
  }
}

class $UserFocusBodypartsTable extends UserFocusBodyparts
    with TableInfo<$UserFocusBodypartsTable, UserFocusBodypart> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFocusBodypartsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _bodyPartIndexMeta = const VerificationMeta(
    'bodyPartIndex',
  );
  @override
  late final GeneratedColumn<int> bodyPartIndex = GeneratedColumn<int>(
    'body_part_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, bodyPartIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_focus_bodyparts';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserFocusBodypart> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('body_part_index')) {
      context.handle(
        _bodyPartIndexMeta,
        bodyPartIndex.isAcceptableOrUnknown(
          data['body_part_index']!,
          _bodyPartIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bodyPartIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFocusBodypart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFocusBodypart(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      bodyPartIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}body_part_index'],
      )!,
    );
  }

  @override
  $UserFocusBodypartsTable createAlias(String alias) {
    return $UserFocusBodypartsTable(attachedDatabase, alias);
  }
}

class UserFocusBodypart extends DataClass
    implements Insertable<UserFocusBodypart> {
  final int id;
  final int userId;
  final int bodyPartIndex;
  const UserFocusBodypart({
    required this.id,
    required this.userId,
    required this.bodyPartIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['body_part_index'] = Variable<int>(bodyPartIndex);
    return map;
  }

  UserFocusBodypartsCompanion toCompanion(bool nullToAbsent) {
    return UserFocusBodypartsCompanion(
      id: Value(id),
      userId: Value(userId),
      bodyPartIndex: Value(bodyPartIndex),
    );
  }

  factory UserFocusBodypart.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFocusBodypart(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      bodyPartIndex: serializer.fromJson<int>(json['bodyPartIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'bodyPartIndex': serializer.toJson<int>(bodyPartIndex),
    };
  }

  UserFocusBodypart copyWith({int? id, int? userId, int? bodyPartIndex}) =>
      UserFocusBodypart(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        bodyPartIndex: bodyPartIndex ?? this.bodyPartIndex,
      );
  UserFocusBodypart copyWithCompanion(UserFocusBodypartsCompanion data) {
    return UserFocusBodypart(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      bodyPartIndex: data.bodyPartIndex.present
          ? data.bodyPartIndex.value
          : this.bodyPartIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserFocusBodypart(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('bodyPartIndex: $bodyPartIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, bodyPartIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFocusBodypart &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.bodyPartIndex == this.bodyPartIndex);
}

class UserFocusBodypartsCompanion extends UpdateCompanion<UserFocusBodypart> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> bodyPartIndex;
  const UserFocusBodypartsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.bodyPartIndex = const Value.absent(),
  });
  UserFocusBodypartsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int bodyPartIndex,
  }) : userId = Value(userId),
       bodyPartIndex = Value(bodyPartIndex);
  static Insertable<UserFocusBodypart> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? bodyPartIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (bodyPartIndex != null) 'body_part_index': bodyPartIndex,
    });
  }

  UserFocusBodypartsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? bodyPartIndex,
  }) {
    return UserFocusBodypartsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bodyPartIndex: bodyPartIndex ?? this.bodyPartIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (bodyPartIndex.present) {
      map['body_part_index'] = Variable<int>(bodyPartIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFocusBodypartsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('bodyPartIndex: $bodyPartIndex')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bodyPartIndexMeta = const VerificationMeta(
    'bodyPartIndex',
  );
  @override
  late final GeneratedColumn<int> bodyPartIndex = GeneratedColumn<int>(
    'body_part_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _equipmentIndexMeta = const VerificationMeta(
    'equipmentIndex',
  );
  @override
  late final GeneratedColumn<int> equipmentIndex = GeneratedColumn<int>(
    'equipment_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyIndexMeta = const VerificationMeta(
    'difficultyIndex',
  );
  @override
  late final GeneratedColumn<int> difficultyIndex = GeneratedColumn<int>(
    'difficulty_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _muscleActionIndexMeta = const VerificationMeta(
    'muscleActionIndex',
  );
  @override
  late final GeneratedColumn<int> muscleActionIndex = GeneratedColumn<int>(
    'muscle_action_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultSetsMeta = const VerificationMeta(
    'defaultSets',
  );
  @override
  late final GeneratedColumn<int> defaultSets = GeneratedColumn<int>(
    'default_sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _defaultRepsMeta = const VerificationMeta(
    'defaultReps',
  );
  @override
  late final GeneratedColumn<int> defaultReps = GeneratedColumn<int>(
    'default_reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _defaultDurationSecsMeta =
      const VerificationMeta('defaultDurationSecs');
  @override
  late final GeneratedColumn<int> defaultDurationSecs = GeneratedColumn<int>(
    'default_duration_secs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageAssetMeta = const VerificationMeta(
    'imageAsset',
  );
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
    'image_asset',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultTempoMeta = const VerificationMeta(
    'defaultTempo',
  );
  @override
  late final GeneratedColumn<String> defaultTempo = GeneratedColumn<String>(
    'default_tempo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('2-1-1-0'),
  );
  static const VerificationMeta _secondaryEquipmentIndexMeta =
      const VerificationMeta('secondaryEquipmentIndex');
  @override
  late final GeneratedColumn<int> secondaryEquipmentIndex =
      GeneratedColumn<int>(
        'secondary_equipment_index',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    instructions,
    bodyPartIndex,
    equipmentIndex,
    difficultyIndex,
    muscleActionIndex,
    defaultSets,
    defaultReps,
    defaultDurationSecs,
    imageAsset,
    defaultTempo,
    secondaryEquipmentIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('body_part_index')) {
      context.handle(
        _bodyPartIndexMeta,
        bodyPartIndex.isAcceptableOrUnknown(
          data['body_part_index']!,
          _bodyPartIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bodyPartIndexMeta);
    }
    if (data.containsKey('equipment_index')) {
      context.handle(
        _equipmentIndexMeta,
        equipmentIndex.isAcceptableOrUnknown(
          data['equipment_index']!,
          _equipmentIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentIndexMeta);
    }
    if (data.containsKey('difficulty_index')) {
      context.handle(
        _difficultyIndexMeta,
        difficultyIndex.isAcceptableOrUnknown(
          data['difficulty_index']!,
          _difficultyIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_difficultyIndexMeta);
    }
    if (data.containsKey('muscle_action_index')) {
      context.handle(
        _muscleActionIndexMeta,
        muscleActionIndex.isAcceptableOrUnknown(
          data['muscle_action_index']!,
          _muscleActionIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_muscleActionIndexMeta);
    }
    if (data.containsKey('default_sets')) {
      context.handle(
        _defaultSetsMeta,
        defaultSets.isAcceptableOrUnknown(
          data['default_sets']!,
          _defaultSetsMeta,
        ),
      );
    }
    if (data.containsKey('default_reps')) {
      context.handle(
        _defaultRepsMeta,
        defaultReps.isAcceptableOrUnknown(
          data['default_reps']!,
          _defaultRepsMeta,
        ),
      );
    }
    if (data.containsKey('default_duration_secs')) {
      context.handle(
        _defaultDurationSecsMeta,
        defaultDurationSecs.isAcceptableOrUnknown(
          data['default_duration_secs']!,
          _defaultDurationSecsMeta,
        ),
      );
    }
    if (data.containsKey('image_asset')) {
      context.handle(
        _imageAssetMeta,
        imageAsset.isAcceptableOrUnknown(data['image_asset']!, _imageAssetMeta),
      );
    }
    if (data.containsKey('default_tempo')) {
      context.handle(
        _defaultTempoMeta,
        defaultTempo.isAcceptableOrUnknown(
          data['default_tempo']!,
          _defaultTempoMeta,
        ),
      );
    }
    if (data.containsKey('secondary_equipment_index')) {
      context.handle(
        _secondaryEquipmentIndexMeta,
        secondaryEquipmentIndex.isAcceptableOrUnknown(
          data['secondary_equipment_index']!,
          _secondaryEquipmentIndexMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      bodyPartIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}body_part_index'],
      )!,
      equipmentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}equipment_index'],
      )!,
      difficultyIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty_index'],
      )!,
      muscleActionIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}muscle_action_index'],
      )!,
      defaultSets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_sets'],
      )!,
      defaultReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_reps'],
      )!,
      defaultDurationSecs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_duration_secs'],
      ),
      imageAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_asset'],
      ),
      defaultTempo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_tempo'],
      )!,
      secondaryEquipmentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}secondary_equipment_index'],
      ),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final String name;
  final String description;
  final String instructions;
  final int bodyPartIndex;
  final int equipmentIndex;
  final int difficultyIndex;
  final int muscleActionIndex;
  final int defaultSets;
  final int defaultReps;
  final int? defaultDurationSecs;
  final String? imageAsset;
  final String defaultTempo;
  final int? secondaryEquipmentIndex;
  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.instructions,
    required this.bodyPartIndex,
    required this.equipmentIndex,
    required this.difficultyIndex,
    required this.muscleActionIndex,
    required this.defaultSets,
    required this.defaultReps,
    this.defaultDurationSecs,
    this.imageAsset,
    required this.defaultTempo,
    this.secondaryEquipmentIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['instructions'] = Variable<String>(instructions);
    map['body_part_index'] = Variable<int>(bodyPartIndex);
    map['equipment_index'] = Variable<int>(equipmentIndex);
    map['difficulty_index'] = Variable<int>(difficultyIndex);
    map['muscle_action_index'] = Variable<int>(muscleActionIndex);
    map['default_sets'] = Variable<int>(defaultSets);
    map['default_reps'] = Variable<int>(defaultReps);
    if (!nullToAbsent || defaultDurationSecs != null) {
      map['default_duration_secs'] = Variable<int>(defaultDurationSecs);
    }
    if (!nullToAbsent || imageAsset != null) {
      map['image_asset'] = Variable<String>(imageAsset);
    }
    map['default_tempo'] = Variable<String>(defaultTempo);
    if (!nullToAbsent || secondaryEquipmentIndex != null) {
      map['secondary_equipment_index'] = Variable<int>(secondaryEquipmentIndex);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      instructions: Value(instructions),
      bodyPartIndex: Value(bodyPartIndex),
      equipmentIndex: Value(equipmentIndex),
      difficultyIndex: Value(difficultyIndex),
      muscleActionIndex: Value(muscleActionIndex),
      defaultSets: Value(defaultSets),
      defaultReps: Value(defaultReps),
      defaultDurationSecs: defaultDurationSecs == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultDurationSecs),
      imageAsset: imageAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(imageAsset),
      defaultTempo: Value(defaultTempo),
      secondaryEquipmentIndex: secondaryEquipmentIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryEquipmentIndex),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      instructions: serializer.fromJson<String>(json['instructions']),
      bodyPartIndex: serializer.fromJson<int>(json['bodyPartIndex']),
      equipmentIndex: serializer.fromJson<int>(json['equipmentIndex']),
      difficultyIndex: serializer.fromJson<int>(json['difficultyIndex']),
      muscleActionIndex: serializer.fromJson<int>(json['muscleActionIndex']),
      defaultSets: serializer.fromJson<int>(json['defaultSets']),
      defaultReps: serializer.fromJson<int>(json['defaultReps']),
      defaultDurationSecs: serializer.fromJson<int?>(
        json['defaultDurationSecs'],
      ),
      imageAsset: serializer.fromJson<String?>(json['imageAsset']),
      defaultTempo: serializer.fromJson<String>(json['defaultTempo']),
      secondaryEquipmentIndex: serializer.fromJson<int?>(
        json['secondaryEquipmentIndex'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'instructions': serializer.toJson<String>(instructions),
      'bodyPartIndex': serializer.toJson<int>(bodyPartIndex),
      'equipmentIndex': serializer.toJson<int>(equipmentIndex),
      'difficultyIndex': serializer.toJson<int>(difficultyIndex),
      'muscleActionIndex': serializer.toJson<int>(muscleActionIndex),
      'defaultSets': serializer.toJson<int>(defaultSets),
      'defaultReps': serializer.toJson<int>(defaultReps),
      'defaultDurationSecs': serializer.toJson<int?>(defaultDurationSecs),
      'imageAsset': serializer.toJson<String?>(imageAsset),
      'defaultTempo': serializer.toJson<String>(defaultTempo),
      'secondaryEquipmentIndex': serializer.toJson<int?>(
        secondaryEquipmentIndex,
      ),
    };
  }

  Exercise copyWith({
    int? id,
    String? name,
    String? description,
    String? instructions,
    int? bodyPartIndex,
    int? equipmentIndex,
    int? difficultyIndex,
    int? muscleActionIndex,
    int? defaultSets,
    int? defaultReps,
    Value<int?> defaultDurationSecs = const Value.absent(),
    Value<String?> imageAsset = const Value.absent(),
    String? defaultTempo,
    Value<int?> secondaryEquipmentIndex = const Value.absent(),
  }) => Exercise(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    instructions: instructions ?? this.instructions,
    bodyPartIndex: bodyPartIndex ?? this.bodyPartIndex,
    equipmentIndex: equipmentIndex ?? this.equipmentIndex,
    difficultyIndex: difficultyIndex ?? this.difficultyIndex,
    muscleActionIndex: muscleActionIndex ?? this.muscleActionIndex,
    defaultSets: defaultSets ?? this.defaultSets,
    defaultReps: defaultReps ?? this.defaultReps,
    defaultDurationSecs: defaultDurationSecs.present
        ? defaultDurationSecs.value
        : this.defaultDurationSecs,
    imageAsset: imageAsset.present ? imageAsset.value : this.imageAsset,
    defaultTempo: defaultTempo ?? this.defaultTempo,
    secondaryEquipmentIndex: secondaryEquipmentIndex.present
        ? secondaryEquipmentIndex.value
        : this.secondaryEquipmentIndex,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      bodyPartIndex: data.bodyPartIndex.present
          ? data.bodyPartIndex.value
          : this.bodyPartIndex,
      equipmentIndex: data.equipmentIndex.present
          ? data.equipmentIndex.value
          : this.equipmentIndex,
      difficultyIndex: data.difficultyIndex.present
          ? data.difficultyIndex.value
          : this.difficultyIndex,
      muscleActionIndex: data.muscleActionIndex.present
          ? data.muscleActionIndex.value
          : this.muscleActionIndex,
      defaultSets: data.defaultSets.present
          ? data.defaultSets.value
          : this.defaultSets,
      defaultReps: data.defaultReps.present
          ? data.defaultReps.value
          : this.defaultReps,
      defaultDurationSecs: data.defaultDurationSecs.present
          ? data.defaultDurationSecs.value
          : this.defaultDurationSecs,
      imageAsset: data.imageAsset.present
          ? data.imageAsset.value
          : this.imageAsset,
      defaultTempo: data.defaultTempo.present
          ? data.defaultTempo.value
          : this.defaultTempo,
      secondaryEquipmentIndex: data.secondaryEquipmentIndex.present
          ? data.secondaryEquipmentIndex.value
          : this.secondaryEquipmentIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions, ')
          ..write('bodyPartIndex: $bodyPartIndex, ')
          ..write('equipmentIndex: $equipmentIndex, ')
          ..write('difficultyIndex: $difficultyIndex, ')
          ..write('muscleActionIndex: $muscleActionIndex, ')
          ..write('defaultSets: $defaultSets, ')
          ..write('defaultReps: $defaultReps, ')
          ..write('defaultDurationSecs: $defaultDurationSecs, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('defaultTempo: $defaultTempo, ')
          ..write('secondaryEquipmentIndex: $secondaryEquipmentIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    instructions,
    bodyPartIndex,
    equipmentIndex,
    difficultyIndex,
    muscleActionIndex,
    defaultSets,
    defaultReps,
    defaultDurationSecs,
    imageAsset,
    defaultTempo,
    secondaryEquipmentIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.instructions == this.instructions &&
          other.bodyPartIndex == this.bodyPartIndex &&
          other.equipmentIndex == this.equipmentIndex &&
          other.difficultyIndex == this.difficultyIndex &&
          other.muscleActionIndex == this.muscleActionIndex &&
          other.defaultSets == this.defaultSets &&
          other.defaultReps == this.defaultReps &&
          other.defaultDurationSecs == this.defaultDurationSecs &&
          other.imageAsset == this.imageAsset &&
          other.defaultTempo == this.defaultTempo &&
          other.secondaryEquipmentIndex == this.secondaryEquipmentIndex);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> instructions;
  final Value<int> bodyPartIndex;
  final Value<int> equipmentIndex;
  final Value<int> difficultyIndex;
  final Value<int> muscleActionIndex;
  final Value<int> defaultSets;
  final Value<int> defaultReps;
  final Value<int?> defaultDurationSecs;
  final Value<String?> imageAsset;
  final Value<String> defaultTempo;
  final Value<int?> secondaryEquipmentIndex;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.instructions = const Value.absent(),
    this.bodyPartIndex = const Value.absent(),
    this.equipmentIndex = const Value.absent(),
    this.difficultyIndex = const Value.absent(),
    this.muscleActionIndex = const Value.absent(),
    this.defaultSets = const Value.absent(),
    this.defaultReps = const Value.absent(),
    this.defaultDurationSecs = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.defaultTempo = const Value.absent(),
    this.secondaryEquipmentIndex = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.instructions = const Value.absent(),
    required int bodyPartIndex,
    required int equipmentIndex,
    required int difficultyIndex,
    required int muscleActionIndex,
    this.defaultSets = const Value.absent(),
    this.defaultReps = const Value.absent(),
    this.defaultDurationSecs = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.defaultTempo = const Value.absent(),
    this.secondaryEquipmentIndex = const Value.absent(),
  }) : name = Value(name),
       bodyPartIndex = Value(bodyPartIndex),
       equipmentIndex = Value(equipmentIndex),
       difficultyIndex = Value(difficultyIndex),
       muscleActionIndex = Value(muscleActionIndex);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? instructions,
    Expression<int>? bodyPartIndex,
    Expression<int>? equipmentIndex,
    Expression<int>? difficultyIndex,
    Expression<int>? muscleActionIndex,
    Expression<int>? defaultSets,
    Expression<int>? defaultReps,
    Expression<int>? defaultDurationSecs,
    Expression<String>? imageAsset,
    Expression<String>? defaultTempo,
    Expression<int>? secondaryEquipmentIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (instructions != null) 'instructions': instructions,
      if (bodyPartIndex != null) 'body_part_index': bodyPartIndex,
      if (equipmentIndex != null) 'equipment_index': equipmentIndex,
      if (difficultyIndex != null) 'difficulty_index': difficultyIndex,
      if (muscleActionIndex != null) 'muscle_action_index': muscleActionIndex,
      if (defaultSets != null) 'default_sets': defaultSets,
      if (defaultReps != null) 'default_reps': defaultReps,
      if (defaultDurationSecs != null)
        'default_duration_secs': defaultDurationSecs,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (defaultTempo != null) 'default_tempo': defaultTempo,
      if (secondaryEquipmentIndex != null)
        'secondary_equipment_index': secondaryEquipmentIndex,
    });
  }

  ExercisesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? instructions,
    Value<int>? bodyPartIndex,
    Value<int>? equipmentIndex,
    Value<int>? difficultyIndex,
    Value<int>? muscleActionIndex,
    Value<int>? defaultSets,
    Value<int>? defaultReps,
    Value<int?>? defaultDurationSecs,
    Value<String?>? imageAsset,
    Value<String>? defaultTempo,
    Value<int?>? secondaryEquipmentIndex,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
      bodyPartIndex: bodyPartIndex ?? this.bodyPartIndex,
      equipmentIndex: equipmentIndex ?? this.equipmentIndex,
      difficultyIndex: difficultyIndex ?? this.difficultyIndex,
      muscleActionIndex: muscleActionIndex ?? this.muscleActionIndex,
      defaultSets: defaultSets ?? this.defaultSets,
      defaultReps: defaultReps ?? this.defaultReps,
      defaultDurationSecs: defaultDurationSecs ?? this.defaultDurationSecs,
      imageAsset: imageAsset ?? this.imageAsset,
      defaultTempo: defaultTempo ?? this.defaultTempo,
      secondaryEquipmentIndex:
          secondaryEquipmentIndex ?? this.secondaryEquipmentIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (bodyPartIndex.present) {
      map['body_part_index'] = Variable<int>(bodyPartIndex.value);
    }
    if (equipmentIndex.present) {
      map['equipment_index'] = Variable<int>(equipmentIndex.value);
    }
    if (difficultyIndex.present) {
      map['difficulty_index'] = Variable<int>(difficultyIndex.value);
    }
    if (muscleActionIndex.present) {
      map['muscle_action_index'] = Variable<int>(muscleActionIndex.value);
    }
    if (defaultSets.present) {
      map['default_sets'] = Variable<int>(defaultSets.value);
    }
    if (defaultReps.present) {
      map['default_reps'] = Variable<int>(defaultReps.value);
    }
    if (defaultDurationSecs.present) {
      map['default_duration_secs'] = Variable<int>(defaultDurationSecs.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (defaultTempo.present) {
      map['default_tempo'] = Variable<String>(defaultTempo.value);
    }
    if (secondaryEquipmentIndex.present) {
      map['secondary_equipment_index'] = Variable<int>(
        secondaryEquipmentIndex.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions, ')
          ..write('bodyPartIndex: $bodyPartIndex, ')
          ..write('equipmentIndex: $equipmentIndex, ')
          ..write('difficultyIndex: $difficultyIndex, ')
          ..write('muscleActionIndex: $muscleActionIndex, ')
          ..write('defaultSets: $defaultSets, ')
          ..write('defaultReps: $defaultReps, ')
          ..write('defaultDurationSecs: $defaultDurationSecs, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('defaultTempo: $defaultTempo, ')
          ..write('secondaryEquipmentIndex: $secondaryEquipmentIndex')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, name, isActive, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlan extends DataClass implements Insertable<WorkoutPlan> {
  final int id;
  final int userId;
  final String name;
  final bool isActive;
  final DateTime createdAt;
  const WorkoutPlan({
    required this.id,
    required this.userId,
    required this.name,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WorkoutPlansCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlansCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory WorkoutPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlan(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WorkoutPlan copyWith({
    int? id,
    int? userId,
    String? name,
    bool? isActive,
    DateTime? createdAt,
  }) => WorkoutPlan(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  WorkoutPlan copyWithCompanion(WorkoutPlansCompanion data) {
    return WorkoutPlan(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlan(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlan &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlan> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name);
  static Insertable<WorkoutPlan> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WorkoutPlansCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlanDaysTable extends PlanDays with TableInfo<$PlanDaysTable, PlanDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<int> planId = GeneratedColumn<int>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_plans (id)',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, planId, dayOfWeek, label];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}plan_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
    );
  }

  @override
  $PlanDaysTable createAlias(String alias) {
    return $PlanDaysTable(attachedDatabase, alias);
  }
}

class PlanDay extends DataClass implements Insertable<PlanDay> {
  final int id;
  final int planId;
  final int dayOfWeek;
  final String label;
  const PlanDay({
    required this.id,
    required this.planId,
    required this.dayOfWeek,
    required this.label,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_id'] = Variable<int>(planId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['label'] = Variable<String>(label);
    return map;
  }

  PlanDaysCompanion toCompanion(bool nullToAbsent) {
    return PlanDaysCompanion(
      id: Value(id),
      planId: Value(planId),
      dayOfWeek: Value(dayOfWeek),
      label: Value(label),
    );
  }

  factory PlanDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanDay(
      id: serializer.fromJson<int>(json['id']),
      planId: serializer.fromJson<int>(json['planId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planId': serializer.toJson<int>(planId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'label': serializer.toJson<String>(label),
    };
  }

  PlanDay copyWith({int? id, int? planId, int? dayOfWeek, String? label}) =>
      PlanDay(
        id: id ?? this.id,
        planId: planId ?? this.planId,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        label: label ?? this.label,
      );
  PlanDay copyWithCompanion(PlanDaysCompanion data) {
    return PlanDay(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      label: data.label.present ? data.label.value : this.label,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanDay(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, planId, dayOfWeek, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanDay &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.label == this.label);
}

class PlanDaysCompanion extends UpdateCompanion<PlanDay> {
  final Value<int> id;
  final Value<int> planId;
  final Value<int> dayOfWeek;
  final Value<String> label;
  const PlanDaysCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.label = const Value.absent(),
  });
  PlanDaysCompanion.insert({
    this.id = const Value.absent(),
    required int planId,
    required int dayOfWeek,
    this.label = const Value.absent(),
  }) : planId = Value(planId),
       dayOfWeek = Value(dayOfWeek);
  static Insertable<PlanDay> custom({
    Expression<int>? id,
    Expression<int>? planId,
    Expression<int>? dayOfWeek,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (label != null) 'label': label,
    });
  }

  PlanDaysCompanion copyWith({
    Value<int>? id,
    Value<int>? planId,
    Value<int>? dayOfWeek,
    Value<String>? label,
  }) {
    return PlanDaysCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<int>(planId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanDaysCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $PlanDayExercisesTable extends PlanDayExercises
    with TableInfo<$PlanDayExercisesTable, PlanDayExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanDayExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _planDayIdMeta = const VerificationMeta(
    'planDayId',
  );
  @override
  late final GeneratedColumn<int> planDayId = GeneratedColumn<int>(
    'plan_day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES plan_days (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _durationSecsMeta = const VerificationMeta(
    'durationSecs',
  );
  @override
  late final GeneratedColumn<int> durationSecs = GeneratedColumn<int>(
    'duration_secs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tempoMeta = const VerificationMeta('tempo');
  @override
  late final GeneratedColumn<String> tempo = GeneratedColumn<String>(
    'tempo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planDayId,
    exerciseId,
    orderIndex,
    sets,
    reps,
    durationSecs,
    tempo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_day_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanDayExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plan_day_id')) {
      context.handle(
        _planDayIdMeta,
        planDayId.isAcceptableOrUnknown(data['plan_day_id']!, _planDayIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planDayIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('duration_secs')) {
      context.handle(
        _durationSecsMeta,
        durationSecs.isAcceptableOrUnknown(
          data['duration_secs']!,
          _durationSecsMeta,
        ),
      );
    }
    if (data.containsKey('tempo')) {
      context.handle(
        _tempoMeta,
        tempo.isAcceptableOrUnknown(data['tempo']!, _tempoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanDayExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanDayExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      planDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}plan_day_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      durationSecs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_secs'],
      ),
      tempo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tempo'],
      ),
    );
  }

  @override
  $PlanDayExercisesTable createAlias(String alias) {
    return $PlanDayExercisesTable(attachedDatabase, alias);
  }
}

class PlanDayExercise extends DataClass implements Insertable<PlanDayExercise> {
  final int id;
  final int planDayId;
  final int exerciseId;
  final int orderIndex;
  final int sets;
  final int reps;
  final int? durationSecs;
  final String? tempo;
  const PlanDayExercise({
    required this.id,
    required this.planDayId,
    required this.exerciseId,
    required this.orderIndex,
    required this.sets,
    required this.reps,
    this.durationSecs,
    this.tempo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plan_day_id'] = Variable<int>(planDayId);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['order_index'] = Variable<int>(orderIndex);
    map['sets'] = Variable<int>(sets);
    map['reps'] = Variable<int>(reps);
    if (!nullToAbsent || durationSecs != null) {
      map['duration_secs'] = Variable<int>(durationSecs);
    }
    if (!nullToAbsent || tempo != null) {
      map['tempo'] = Variable<String>(tempo);
    }
    return map;
  }

  PlanDayExercisesCompanion toCompanion(bool nullToAbsent) {
    return PlanDayExercisesCompanion(
      id: Value(id),
      planDayId: Value(planDayId),
      exerciseId: Value(exerciseId),
      orderIndex: Value(orderIndex),
      sets: Value(sets),
      reps: Value(reps),
      durationSecs: durationSecs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSecs),
      tempo: tempo == null && nullToAbsent
          ? const Value.absent()
          : Value(tempo),
    );
  }

  factory PlanDayExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanDayExercise(
      id: serializer.fromJson<int>(json['id']),
      planDayId: serializer.fromJson<int>(json['planDayId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      sets: serializer.fromJson<int>(json['sets']),
      reps: serializer.fromJson<int>(json['reps']),
      durationSecs: serializer.fromJson<int?>(json['durationSecs']),
      tempo: serializer.fromJson<String?>(json['tempo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'planDayId': serializer.toJson<int>(planDayId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'sets': serializer.toJson<int>(sets),
      'reps': serializer.toJson<int>(reps),
      'durationSecs': serializer.toJson<int?>(durationSecs),
      'tempo': serializer.toJson<String?>(tempo),
    };
  }

  PlanDayExercise copyWith({
    int? id,
    int? planDayId,
    int? exerciseId,
    int? orderIndex,
    int? sets,
    int? reps,
    Value<int?> durationSecs = const Value.absent(),
    Value<String?> tempo = const Value.absent(),
  }) => PlanDayExercise(
    id: id ?? this.id,
    planDayId: planDayId ?? this.planDayId,
    exerciseId: exerciseId ?? this.exerciseId,
    orderIndex: orderIndex ?? this.orderIndex,
    sets: sets ?? this.sets,
    reps: reps ?? this.reps,
    durationSecs: durationSecs.present ? durationSecs.value : this.durationSecs,
    tempo: tempo.present ? tempo.value : this.tempo,
  );
  PlanDayExercise copyWithCompanion(PlanDayExercisesCompanion data) {
    return PlanDayExercise(
      id: data.id.present ? data.id.value : this.id,
      planDayId: data.planDayId.present ? data.planDayId.value : this.planDayId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      sets: data.sets.present ? data.sets.value : this.sets,
      reps: data.reps.present ? data.reps.value : this.reps,
      durationSecs: data.durationSecs.present
          ? data.durationSecs.value
          : this.durationSecs,
      tempo: data.tempo.present ? data.tempo.value : this.tempo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanDayExercise(')
          ..write('id: $id, ')
          ..write('planDayId: $planDayId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('durationSecs: $durationSecs, ')
          ..write('tempo: $tempo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planDayId,
    exerciseId,
    orderIndex,
    sets,
    reps,
    durationSecs,
    tempo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanDayExercise &&
          other.id == this.id &&
          other.planDayId == this.planDayId &&
          other.exerciseId == this.exerciseId &&
          other.orderIndex == this.orderIndex &&
          other.sets == this.sets &&
          other.reps == this.reps &&
          other.durationSecs == this.durationSecs &&
          other.tempo == this.tempo);
}

class PlanDayExercisesCompanion extends UpdateCompanion<PlanDayExercise> {
  final Value<int> id;
  final Value<int> planDayId;
  final Value<int> exerciseId;
  final Value<int> orderIndex;
  final Value<int> sets;
  final Value<int> reps;
  final Value<int?> durationSecs;
  final Value<String?> tempo;
  const PlanDayExercisesCompanion({
    this.id = const Value.absent(),
    this.planDayId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.durationSecs = const Value.absent(),
    this.tempo = const Value.absent(),
  });
  PlanDayExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int planDayId,
    required int exerciseId,
    required int orderIndex,
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.durationSecs = const Value.absent(),
    this.tempo = const Value.absent(),
  }) : planDayId = Value(planDayId),
       exerciseId = Value(exerciseId),
       orderIndex = Value(orderIndex);
  static Insertable<PlanDayExercise> custom({
    Expression<int>? id,
    Expression<int>? planDayId,
    Expression<int>? exerciseId,
    Expression<int>? orderIndex,
    Expression<int>? sets,
    Expression<int>? reps,
    Expression<int>? durationSecs,
    Expression<String>? tempo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planDayId != null) 'plan_day_id': planDayId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (sets != null) 'sets': sets,
      if (reps != null) 'reps': reps,
      if (durationSecs != null) 'duration_secs': durationSecs,
      if (tempo != null) 'tempo': tempo,
    });
  }

  PlanDayExercisesCompanion copyWith({
    Value<int>? id,
    Value<int>? planDayId,
    Value<int>? exerciseId,
    Value<int>? orderIndex,
    Value<int>? sets,
    Value<int>? reps,
    Value<int?>? durationSecs,
    Value<String?>? tempo,
  }) {
    return PlanDayExercisesCompanion(
      id: id ?? this.id,
      planDayId: planDayId ?? this.planDayId,
      exerciseId: exerciseId ?? this.exerciseId,
      orderIndex: orderIndex ?? this.orderIndex,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      durationSecs: durationSecs ?? this.durationSecs,
      tempo: tempo ?? this.tempo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (planDayId.present) {
      map['plan_day_id'] = Variable<int>(planDayId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (durationSecs.present) {
      map['duration_secs'] = Variable<int>(durationSecs.value);
    }
    if (tempo.present) {
      map['tempo'] = Variable<String>(tempo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanDayExercisesCompanion(')
          ..write('id: $id, ')
          ..write('planDayId: $planDayId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('durationSecs: $durationSecs, ')
          ..write('tempo: $tempo')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _planDayIdMeta = const VerificationMeta(
    'planDayId',
  );
  @override
  late final GeneratedColumn<int> planDayId = GeneratedColumn<int>(
    'plan_day_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES plan_days (id)',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalXpEarnedMeta = const VerificationMeta(
    'totalXpEarned',
  );
  @override
  late final GeneratedColumn<int> totalXpEarned = GeneratedColumn<int>(
    'total_xp_earned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _allSetsCompletedMeta = const VerificationMeta(
    'allSetsCompleted',
  );
  @override
  late final GeneratedColumn<bool> allSetsCompleted = GeneratedColumn<bool>(
    'all_sets_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("all_sets_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    planDayId,
    startedAt,
    completedAt,
    totalXpEarned,
    allSetsCompleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('plan_day_id')) {
      context.handle(
        _planDayIdMeta,
        planDayId.isAcceptableOrUnknown(data['plan_day_id']!, _planDayIdMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('total_xp_earned')) {
      context.handle(
        _totalXpEarnedMeta,
        totalXpEarned.isAcceptableOrUnknown(
          data['total_xp_earned']!,
          _totalXpEarnedMeta,
        ),
      );
    }
    if (data.containsKey('all_sets_completed')) {
      context.handle(
        _allSetsCompletedMeta,
        allSetsCompleted.isAcceptableOrUnknown(
          data['all_sets_completed']!,
          _allSetsCompletedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      planDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}plan_day_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      totalXpEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_xp_earned'],
      )!,
      allSetsCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}all_sets_completed'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }
}

class WorkoutSession extends DataClass implements Insertable<WorkoutSession> {
  final int id;
  final int userId;
  final int? planDayId;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int totalXpEarned;
  final bool allSetsCompleted;
  const WorkoutSession({
    required this.id,
    required this.userId,
    this.planDayId,
    required this.startedAt,
    this.completedAt,
    required this.totalXpEarned,
    required this.allSetsCompleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || planDayId != null) {
      map['plan_day_id'] = Variable<int>(planDayId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['total_xp_earned'] = Variable<int>(totalXpEarned);
    map['all_sets_completed'] = Variable<bool>(allSetsCompleted);
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      userId: Value(userId),
      planDayId: planDayId == null && nullToAbsent
          ? const Value.absent()
          : Value(planDayId),
      startedAt: Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      totalXpEarned: Value(totalXpEarned),
      allSetsCompleted: Value(allSetsCompleted),
    );
  }

  factory WorkoutSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSession(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      planDayId: serializer.fromJson<int?>(json['planDayId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      totalXpEarned: serializer.fromJson<int>(json['totalXpEarned']),
      allSetsCompleted: serializer.fromJson<bool>(json['allSetsCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'planDayId': serializer.toJson<int?>(planDayId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'totalXpEarned': serializer.toJson<int>(totalXpEarned),
      'allSetsCompleted': serializer.toJson<bool>(allSetsCompleted),
    };
  }

  WorkoutSession copyWith({
    int? id,
    int? userId,
    Value<int?> planDayId = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    int? totalXpEarned,
    bool? allSetsCompleted,
  }) => WorkoutSession(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    planDayId: planDayId.present ? planDayId.value : this.planDayId,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    totalXpEarned: totalXpEarned ?? this.totalXpEarned,
    allSetsCompleted: allSetsCompleted ?? this.allSetsCompleted,
  );
  WorkoutSession copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSession(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      planDayId: data.planDayId.present ? data.planDayId.value : this.planDayId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      totalXpEarned: data.totalXpEarned.present
          ? data.totalXpEarned.value
          : this.totalXpEarned,
      allSetsCompleted: data.allSetsCompleted.present
          ? data.allSetsCompleted.value
          : this.allSetsCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSession(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planDayId: $planDayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('totalXpEarned: $totalXpEarned, ')
          ..write('allSetsCompleted: $allSetsCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    planDayId,
    startedAt,
    completedAt,
    totalXpEarned,
    allSetsCompleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSession &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.planDayId == this.planDayId &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.totalXpEarned == this.totalXpEarned &&
          other.allSetsCompleted == this.allSetsCompleted);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSession> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int?> planDayId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<int> totalXpEarned;
  final Value<bool> allSetsCompleted;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.planDayId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.totalXpEarned = const Value.absent(),
    this.allSetsCompleted = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.planDayId = const Value.absent(),
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    this.totalXpEarned = const Value.absent(),
    this.allSetsCompleted = const Value.absent(),
  }) : userId = Value(userId),
       startedAt = Value(startedAt);
  static Insertable<WorkoutSession> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? planDayId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? totalXpEarned,
    Expression<bool>? allSetsCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (planDayId != null) 'plan_day_id': planDayId,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (totalXpEarned != null) 'total_xp_earned': totalXpEarned,
      if (allSetsCompleted != null) 'all_sets_completed': allSetsCompleted,
    });
  }

  WorkoutSessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int?>? planDayId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<int>? totalXpEarned,
    Value<bool>? allSetsCompleted,
  }) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      planDayId: planDayId ?? this.planDayId,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      totalXpEarned: totalXpEarned ?? this.totalXpEarned,
      allSetsCompleted: allSetsCompleted ?? this.allSetsCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (planDayId.present) {
      map['plan_day_id'] = Variable<int>(planDayId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (totalXpEarned.present) {
      map['total_xp_earned'] = Variable<int>(totalXpEarned.value);
    }
    if (allSetsCompleted.present) {
      map['all_sets_completed'] = Variable<bool>(allSetsCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('planDayId: $planDayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('totalXpEarned: $totalXpEarned, ')
          ..write('allSetsCompleted: $allSetsCompleted')
          ..write(')'))
        .toString();
  }
}

class $SessionSetsTable extends SessionSets
    with TableInfo<$SessionSetsTable, SessionSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_sessions (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsCompletedMeta = const VerificationMeta(
    'repsCompleted',
  );
  @override
  late final GeneratedColumn<int> repsCompleted = GeneratedColumn<int>(
    'reps_completed',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightUsedMeta = const VerificationMeta(
    'weightUsed',
  );
  @override
  late final GeneratedColumn<double> weightUsed = GeneratedColumn<double>(
    'weight_used',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecsMeta = const VerificationMeta(
    'durationSecs',
  );
  @override
  late final GeneratedColumn<int> durationSecs = GeneratedColumn<int>(
    'duration_secs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    exerciseId,
    setNumber,
    repsCompleted,
    weightUsed,
    durationSecs,
    completed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('reps_completed')) {
      context.handle(
        _repsCompletedMeta,
        repsCompleted.isAcceptableOrUnknown(
          data['reps_completed']!,
          _repsCompletedMeta,
        ),
      );
    }
    if (data.containsKey('weight_used')) {
      context.handle(
        _weightUsedMeta,
        weightUsed.isAcceptableOrUnknown(data['weight_used']!, _weightUsedMeta),
      );
    }
    if (data.containsKey('duration_secs')) {
      context.handle(
        _durationSecsMeta,
        durationSecs.isAcceptableOrUnknown(
          data['duration_secs']!,
          _durationSecsMeta,
        ),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionSet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      repsCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps_completed'],
      ),
      weightUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_used'],
      ),
      durationSecs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_secs'],
      ),
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
    );
  }

  @override
  $SessionSetsTable createAlias(String alias) {
    return $SessionSetsTable(attachedDatabase, alias);
  }
}

class SessionSet extends DataClass implements Insertable<SessionSet> {
  final int id;
  final int sessionId;
  final int exerciseId;
  final int setNumber;
  final int? repsCompleted;
  final double? weightUsed;
  final int? durationSecs;
  final bool completed;
  const SessionSet({
    required this.id,
    required this.sessionId,
    required this.exerciseId,
    required this.setNumber,
    this.repsCompleted,
    this.weightUsed,
    this.durationSecs,
    required this.completed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['set_number'] = Variable<int>(setNumber);
    if (!nullToAbsent || repsCompleted != null) {
      map['reps_completed'] = Variable<int>(repsCompleted);
    }
    if (!nullToAbsent || weightUsed != null) {
      map['weight_used'] = Variable<double>(weightUsed);
    }
    if (!nullToAbsent || durationSecs != null) {
      map['duration_secs'] = Variable<int>(durationSecs);
    }
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  SessionSetsCompanion toCompanion(bool nullToAbsent) {
    return SessionSetsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      exerciseId: Value(exerciseId),
      setNumber: Value(setNumber),
      repsCompleted: repsCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(repsCompleted),
      weightUsed: weightUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(weightUsed),
      durationSecs: durationSecs == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSecs),
      completed: Value(completed),
    );
  }

  factory SessionSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionSet(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      repsCompleted: serializer.fromJson<int?>(json['repsCompleted']),
      weightUsed: serializer.fromJson<double?>(json['weightUsed']),
      durationSecs: serializer.fromJson<int?>(json['durationSecs']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'setNumber': serializer.toJson<int>(setNumber),
      'repsCompleted': serializer.toJson<int?>(repsCompleted),
      'weightUsed': serializer.toJson<double?>(weightUsed),
      'durationSecs': serializer.toJson<int?>(durationSecs),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  SessionSet copyWith({
    int? id,
    int? sessionId,
    int? exerciseId,
    int? setNumber,
    Value<int?> repsCompleted = const Value.absent(),
    Value<double?> weightUsed = const Value.absent(),
    Value<int?> durationSecs = const Value.absent(),
    bool? completed,
  }) => SessionSet(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    exerciseId: exerciseId ?? this.exerciseId,
    setNumber: setNumber ?? this.setNumber,
    repsCompleted: repsCompleted.present
        ? repsCompleted.value
        : this.repsCompleted,
    weightUsed: weightUsed.present ? weightUsed.value : this.weightUsed,
    durationSecs: durationSecs.present ? durationSecs.value : this.durationSecs,
    completed: completed ?? this.completed,
  );
  SessionSet copyWithCompanion(SessionSetsCompanion data) {
    return SessionSet(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      repsCompleted: data.repsCompleted.present
          ? data.repsCompleted.value
          : this.repsCompleted,
      weightUsed: data.weightUsed.present
          ? data.weightUsed.value
          : this.weightUsed,
      durationSecs: data.durationSecs.present
          ? data.durationSecs.value
          : this.durationSecs,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionSet(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('repsCompleted: $repsCompleted, ')
          ..write('weightUsed: $weightUsed, ')
          ..write('durationSecs: $durationSecs, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    exerciseId,
    setNumber,
    repsCompleted,
    weightUsed,
    durationSecs,
    completed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionSet &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.setNumber == this.setNumber &&
          other.repsCompleted == this.repsCompleted &&
          other.weightUsed == this.weightUsed &&
          other.durationSecs == this.durationSecs &&
          other.completed == this.completed);
}

class SessionSetsCompanion extends UpdateCompanion<SessionSet> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<int> exerciseId;
  final Value<int> setNumber;
  final Value<int?> repsCompleted;
  final Value<double?> weightUsed;
  final Value<int?> durationSecs;
  final Value<bool> completed;
  const SessionSetsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.repsCompleted = const Value.absent(),
    this.weightUsed = const Value.absent(),
    this.durationSecs = const Value.absent(),
    this.completed = const Value.absent(),
  });
  SessionSetsCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required int exerciseId,
    required int setNumber,
    this.repsCompleted = const Value.absent(),
    this.weightUsed = const Value.absent(),
    this.durationSecs = const Value.absent(),
    this.completed = const Value.absent(),
  }) : sessionId = Value(sessionId),
       exerciseId = Value(exerciseId),
       setNumber = Value(setNumber);
  static Insertable<SessionSet> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<int>? exerciseId,
    Expression<int>? setNumber,
    Expression<int>? repsCompleted,
    Expression<double>? weightUsed,
    Expression<int>? durationSecs,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (setNumber != null) 'set_number': setNumber,
      if (repsCompleted != null) 'reps_completed': repsCompleted,
      if (weightUsed != null) 'weight_used': weightUsed,
      if (durationSecs != null) 'duration_secs': durationSecs,
      if (completed != null) 'completed': completed,
    });
  }

  SessionSetsCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<int>? exerciseId,
    Value<int>? setNumber,
    Value<int?>? repsCompleted,
    Value<double?>? weightUsed,
    Value<int?>? durationSecs,
    Value<bool>? completed,
  }) {
    return SessionSetsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      setNumber: setNumber ?? this.setNumber,
      repsCompleted: repsCompleted ?? this.repsCompleted,
      weightUsed: weightUsed ?? this.weightUsed,
      durationSecs: durationSecs ?? this.durationSecs,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (repsCompleted.present) {
      map['reps_completed'] = Variable<int>(repsCompleted.value);
    }
    if (weightUsed.present) {
      map['weight_used'] = Variable<double>(weightUsed.value);
    }
    if (durationSecs.present) {
      map['duration_secs'] = Variable<int>(durationSecs.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionSetsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('setNumber: $setNumber, ')
          ..write('repsCompleted: $repsCompleted, ')
          ..write('weightUsed: $weightUsed, ')
          ..write('durationSecs: $durationSecs, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $BodyMeasurementsTable extends BodyMeasurements
    with TableInfo<$BodyMeasurementsTable, BodyMeasurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _measuredAtMeta = const VerificationMeta(
    'measuredAt',
  );
  @override
  late final GeneratedColumn<DateTime> measuredAt = GeneratedColumn<DateTime>(
    'measured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bmiMeta = const VerificationMeta('bmi');
  @override
  late final GeneratedColumn<double> bmi = GeneratedColumn<double>(
    'bmi',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chestCmMeta = const VerificationMeta(
    'chestCm',
  );
  @override
  late final GeneratedColumn<double> chestCm = GeneratedColumn<double>(
    'chest_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _waistCmMeta = const VerificationMeta(
    'waistCm',
  );
  @override
  late final GeneratedColumn<double> waistCm = GeneratedColumn<double>(
    'waist_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hipsCmMeta = const VerificationMeta('hipsCm');
  @override
  late final GeneratedColumn<double> hipsCm = GeneratedColumn<double>(
    'hips_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bicepsCmMeta = const VerificationMeta(
    'bicepsCm',
  );
  @override
  late final GeneratedColumn<double> bicepsCm = GeneratedColumn<double>(
    'biceps_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thighsCmMeta = const VerificationMeta(
    'thighsCm',
  );
  @override
  late final GeneratedColumn<double> thighsCm = GeneratedColumn<double>(
    'thighs_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calvesCmMeta = const VerificationMeta(
    'calvesCm',
  );
  @override
  late final GeneratedColumn<double> calvesCm = GeneratedColumn<double>(
    'calves_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neckCmMeta = const VerificationMeta('neckCm');
  @override
  late final GeneratedColumn<double> neckCm = GeneratedColumn<double>(
    'neck_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _forearmCmMeta = const VerificationMeta(
    'forearmCm',
  );
  @override
  late final GeneratedColumn<double> forearmCm = GeneratedColumn<double>(
    'forearm_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    measuredAt,
    weightKg,
    heightCm,
    bmi,
    chestCm,
    waistCm,
    hipsCm,
    bicepsCm,
    thighsCm,
    calvesCm,
    neckCm,
    forearmCm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyMeasurement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('measured_at')) {
      context.handle(
        _measuredAtMeta,
        measuredAt.isAcceptableOrUnknown(data['measured_at']!, _measuredAtMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    }
    if (data.containsKey('bmi')) {
      context.handle(
        _bmiMeta,
        bmi.isAcceptableOrUnknown(data['bmi']!, _bmiMeta),
      );
    }
    if (data.containsKey('chest_cm')) {
      context.handle(
        _chestCmMeta,
        chestCm.isAcceptableOrUnknown(data['chest_cm']!, _chestCmMeta),
      );
    }
    if (data.containsKey('waist_cm')) {
      context.handle(
        _waistCmMeta,
        waistCm.isAcceptableOrUnknown(data['waist_cm']!, _waistCmMeta),
      );
    }
    if (data.containsKey('hips_cm')) {
      context.handle(
        _hipsCmMeta,
        hipsCm.isAcceptableOrUnknown(data['hips_cm']!, _hipsCmMeta),
      );
    }
    if (data.containsKey('biceps_cm')) {
      context.handle(
        _bicepsCmMeta,
        bicepsCm.isAcceptableOrUnknown(data['biceps_cm']!, _bicepsCmMeta),
      );
    }
    if (data.containsKey('thighs_cm')) {
      context.handle(
        _thighsCmMeta,
        thighsCm.isAcceptableOrUnknown(data['thighs_cm']!, _thighsCmMeta),
      );
    }
    if (data.containsKey('calves_cm')) {
      context.handle(
        _calvesCmMeta,
        calvesCm.isAcceptableOrUnknown(data['calves_cm']!, _calvesCmMeta),
      );
    }
    if (data.containsKey('neck_cm')) {
      context.handle(
        _neckCmMeta,
        neckCm.isAcceptableOrUnknown(data['neck_cm']!, _neckCmMeta),
      );
    }
    if (data.containsKey('forearm_cm')) {
      context.handle(
        _forearmCmMeta,
        forearmCm.isAcceptableOrUnknown(data['forearm_cm']!, _forearmCmMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      measuredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}measured_at'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      ),
      bmi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bmi'],
      ),
      chestCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}chest_cm'],
      ),
      waistCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}waist_cm'],
      ),
      hipsCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hips_cm'],
      ),
      bicepsCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}biceps_cm'],
      ),
      thighsCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}thighs_cm'],
      ),
      calvesCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calves_cm'],
      ),
      neckCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}neck_cm'],
      ),
      forearmCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}forearm_cm'],
      ),
    );
  }

  @override
  $BodyMeasurementsTable createAlias(String alias) {
    return $BodyMeasurementsTable(attachedDatabase, alias);
  }
}

class BodyMeasurement extends DataClass implements Insertable<BodyMeasurement> {
  final int id;
  final int userId;
  final DateTime measuredAt;
  final double? weightKg;
  final double? heightCm;
  final double? bmi;
  final double? chestCm;
  final double? waistCm;
  final double? hipsCm;
  final double? bicepsCm;
  final double? thighsCm;
  final double? calvesCm;
  final double? neckCm;
  final double? forearmCm;
  const BodyMeasurement({
    required this.id,
    required this.userId,
    required this.measuredAt,
    this.weightKg,
    this.heightCm,
    this.bmi,
    this.chestCm,
    this.waistCm,
    this.hipsCm,
    this.bicepsCm,
    this.thighsCm,
    this.calvesCm,
    this.neckCm,
    this.forearmCm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['measured_at'] = Variable<DateTime>(measuredAt);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || bmi != null) {
      map['bmi'] = Variable<double>(bmi);
    }
    if (!nullToAbsent || chestCm != null) {
      map['chest_cm'] = Variable<double>(chestCm);
    }
    if (!nullToAbsent || waistCm != null) {
      map['waist_cm'] = Variable<double>(waistCm);
    }
    if (!nullToAbsent || hipsCm != null) {
      map['hips_cm'] = Variable<double>(hipsCm);
    }
    if (!nullToAbsent || bicepsCm != null) {
      map['biceps_cm'] = Variable<double>(bicepsCm);
    }
    if (!nullToAbsent || thighsCm != null) {
      map['thighs_cm'] = Variable<double>(thighsCm);
    }
    if (!nullToAbsent || calvesCm != null) {
      map['calves_cm'] = Variable<double>(calvesCm);
    }
    if (!nullToAbsent || neckCm != null) {
      map['neck_cm'] = Variable<double>(neckCm);
    }
    if (!nullToAbsent || forearmCm != null) {
      map['forearm_cm'] = Variable<double>(forearmCm);
    }
    return map;
  }

  BodyMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsCompanion(
      id: Value(id),
      userId: Value(userId),
      measuredAt: Value(measuredAt),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      bmi: bmi == null && nullToAbsent ? const Value.absent() : Value(bmi),
      chestCm: chestCm == null && nullToAbsent
          ? const Value.absent()
          : Value(chestCm),
      waistCm: waistCm == null && nullToAbsent
          ? const Value.absent()
          : Value(waistCm),
      hipsCm: hipsCm == null && nullToAbsent
          ? const Value.absent()
          : Value(hipsCm),
      bicepsCm: bicepsCm == null && nullToAbsent
          ? const Value.absent()
          : Value(bicepsCm),
      thighsCm: thighsCm == null && nullToAbsent
          ? const Value.absent()
          : Value(thighsCm),
      calvesCm: calvesCm == null && nullToAbsent
          ? const Value.absent()
          : Value(calvesCm),
      neckCm: neckCm == null && nullToAbsent
          ? const Value.absent()
          : Value(neckCm),
      forearmCm: forearmCm == null && nullToAbsent
          ? const Value.absent()
          : Value(forearmCm),
    );
  }

  factory BodyMeasurement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurement(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      measuredAt: serializer.fromJson<DateTime>(json['measuredAt']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      bmi: serializer.fromJson<double?>(json['bmi']),
      chestCm: serializer.fromJson<double?>(json['chestCm']),
      waistCm: serializer.fromJson<double?>(json['waistCm']),
      hipsCm: serializer.fromJson<double?>(json['hipsCm']),
      bicepsCm: serializer.fromJson<double?>(json['bicepsCm']),
      thighsCm: serializer.fromJson<double?>(json['thighsCm']),
      calvesCm: serializer.fromJson<double?>(json['calvesCm']),
      neckCm: serializer.fromJson<double?>(json['neckCm']),
      forearmCm: serializer.fromJson<double?>(json['forearmCm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'measuredAt': serializer.toJson<DateTime>(measuredAt),
      'weightKg': serializer.toJson<double?>(weightKg),
      'heightCm': serializer.toJson<double?>(heightCm),
      'bmi': serializer.toJson<double?>(bmi),
      'chestCm': serializer.toJson<double?>(chestCm),
      'waistCm': serializer.toJson<double?>(waistCm),
      'hipsCm': serializer.toJson<double?>(hipsCm),
      'bicepsCm': serializer.toJson<double?>(bicepsCm),
      'thighsCm': serializer.toJson<double?>(thighsCm),
      'calvesCm': serializer.toJson<double?>(calvesCm),
      'neckCm': serializer.toJson<double?>(neckCm),
      'forearmCm': serializer.toJson<double?>(forearmCm),
    };
  }

  BodyMeasurement copyWith({
    int? id,
    int? userId,
    DateTime? measuredAt,
    Value<double?> weightKg = const Value.absent(),
    Value<double?> heightCm = const Value.absent(),
    Value<double?> bmi = const Value.absent(),
    Value<double?> chestCm = const Value.absent(),
    Value<double?> waistCm = const Value.absent(),
    Value<double?> hipsCm = const Value.absent(),
    Value<double?> bicepsCm = const Value.absent(),
    Value<double?> thighsCm = const Value.absent(),
    Value<double?> calvesCm = const Value.absent(),
    Value<double?> neckCm = const Value.absent(),
    Value<double?> forearmCm = const Value.absent(),
  }) => BodyMeasurement(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    measuredAt: measuredAt ?? this.measuredAt,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    heightCm: heightCm.present ? heightCm.value : this.heightCm,
    bmi: bmi.present ? bmi.value : this.bmi,
    chestCm: chestCm.present ? chestCm.value : this.chestCm,
    waistCm: waistCm.present ? waistCm.value : this.waistCm,
    hipsCm: hipsCm.present ? hipsCm.value : this.hipsCm,
    bicepsCm: bicepsCm.present ? bicepsCm.value : this.bicepsCm,
    thighsCm: thighsCm.present ? thighsCm.value : this.thighsCm,
    calvesCm: calvesCm.present ? calvesCm.value : this.calvesCm,
    neckCm: neckCm.present ? neckCm.value : this.neckCm,
    forearmCm: forearmCm.present ? forearmCm.value : this.forearmCm,
  );
  BodyMeasurement copyWithCompanion(BodyMeasurementsCompanion data) {
    return BodyMeasurement(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      measuredAt: data.measuredAt.present
          ? data.measuredAt.value
          : this.measuredAt,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      bmi: data.bmi.present ? data.bmi.value : this.bmi,
      chestCm: data.chestCm.present ? data.chestCm.value : this.chestCm,
      waistCm: data.waistCm.present ? data.waistCm.value : this.waistCm,
      hipsCm: data.hipsCm.present ? data.hipsCm.value : this.hipsCm,
      bicepsCm: data.bicepsCm.present ? data.bicepsCm.value : this.bicepsCm,
      thighsCm: data.thighsCm.present ? data.thighsCm.value : this.thighsCm,
      calvesCm: data.calvesCm.present ? data.calvesCm.value : this.calvesCm,
      neckCm: data.neckCm.present ? data.neckCm.value : this.neckCm,
      forearmCm: data.forearmCm.present ? data.forearmCm.value : this.forearmCm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurement(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('bmi: $bmi, ')
          ..write('chestCm: $chestCm, ')
          ..write('waistCm: $waistCm, ')
          ..write('hipsCm: $hipsCm, ')
          ..write('bicepsCm: $bicepsCm, ')
          ..write('thighsCm: $thighsCm, ')
          ..write('calvesCm: $calvesCm, ')
          ..write('neckCm: $neckCm, ')
          ..write('forearmCm: $forearmCm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    measuredAt,
    weightKg,
    heightCm,
    bmi,
    chestCm,
    waistCm,
    hipsCm,
    bicepsCm,
    thighsCm,
    calvesCm,
    neckCm,
    forearmCm,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurement &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.measuredAt == this.measuredAt &&
          other.weightKg == this.weightKg &&
          other.heightCm == this.heightCm &&
          other.bmi == this.bmi &&
          other.chestCm == this.chestCm &&
          other.waistCm == this.waistCm &&
          other.hipsCm == this.hipsCm &&
          other.bicepsCm == this.bicepsCm &&
          other.thighsCm == this.thighsCm &&
          other.calvesCm == this.calvesCm &&
          other.neckCm == this.neckCm &&
          other.forearmCm == this.forearmCm);
}

class BodyMeasurementsCompanion extends UpdateCompanion<BodyMeasurement> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> measuredAt;
  final Value<double?> weightKg;
  final Value<double?> heightCm;
  final Value<double?> bmi;
  final Value<double?> chestCm;
  final Value<double?> waistCm;
  final Value<double?> hipsCm;
  final Value<double?> bicepsCm;
  final Value<double?> thighsCm;
  final Value<double?> calvesCm;
  final Value<double?> neckCm;
  final Value<double?> forearmCm;
  const BodyMeasurementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.measuredAt = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.bmi = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.waistCm = const Value.absent(),
    this.hipsCm = const Value.absent(),
    this.bicepsCm = const Value.absent(),
    this.thighsCm = const Value.absent(),
    this.calvesCm = const Value.absent(),
    this.neckCm = const Value.absent(),
    this.forearmCm = const Value.absent(),
  });
  BodyMeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.measuredAt = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.bmi = const Value.absent(),
    this.chestCm = const Value.absent(),
    this.waistCm = const Value.absent(),
    this.hipsCm = const Value.absent(),
    this.bicepsCm = const Value.absent(),
    this.thighsCm = const Value.absent(),
    this.calvesCm = const Value.absent(),
    this.neckCm = const Value.absent(),
    this.forearmCm = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<BodyMeasurement> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<DateTime>? measuredAt,
    Expression<double>? weightKg,
    Expression<double>? heightCm,
    Expression<double>? bmi,
    Expression<double>? chestCm,
    Expression<double>? waistCm,
    Expression<double>? hipsCm,
    Expression<double>? bicepsCm,
    Expression<double>? thighsCm,
    Expression<double>? calvesCm,
    Expression<double>? neckCm,
    Expression<double>? forearmCm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (measuredAt != null) 'measured_at': measuredAt,
      if (weightKg != null) 'weight_kg': weightKg,
      if (heightCm != null) 'height_cm': heightCm,
      if (bmi != null) 'bmi': bmi,
      if (chestCm != null) 'chest_cm': chestCm,
      if (waistCm != null) 'waist_cm': waistCm,
      if (hipsCm != null) 'hips_cm': hipsCm,
      if (bicepsCm != null) 'biceps_cm': bicepsCm,
      if (thighsCm != null) 'thighs_cm': thighsCm,
      if (calvesCm != null) 'calves_cm': calvesCm,
      if (neckCm != null) 'neck_cm': neckCm,
      if (forearmCm != null) 'forearm_cm': forearmCm,
    });
  }

  BodyMeasurementsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<DateTime>? measuredAt,
    Value<double?>? weightKg,
    Value<double?>? heightCm,
    Value<double?>? bmi,
    Value<double?>? chestCm,
    Value<double?>? waistCm,
    Value<double?>? hipsCm,
    Value<double?>? bicepsCm,
    Value<double?>? thighsCm,
    Value<double?>? calvesCm,
    Value<double?>? neckCm,
    Value<double?>? forearmCm,
  }) {
    return BodyMeasurementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      measuredAt: measuredAt ?? this.measuredAt,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      bmi: bmi ?? this.bmi,
      chestCm: chestCm ?? this.chestCm,
      waistCm: waistCm ?? this.waistCm,
      hipsCm: hipsCm ?? this.hipsCm,
      bicepsCm: bicepsCm ?? this.bicepsCm,
      thighsCm: thighsCm ?? this.thighsCm,
      calvesCm: calvesCm ?? this.calvesCm,
      neckCm: neckCm ?? this.neckCm,
      forearmCm: forearmCm ?? this.forearmCm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (measuredAt.present) {
      map['measured_at'] = Variable<DateTime>(measuredAt.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (bmi.present) {
      map['bmi'] = Variable<double>(bmi.value);
    }
    if (chestCm.present) {
      map['chest_cm'] = Variable<double>(chestCm.value);
    }
    if (waistCm.present) {
      map['waist_cm'] = Variable<double>(waistCm.value);
    }
    if (hipsCm.present) {
      map['hips_cm'] = Variable<double>(hipsCm.value);
    }
    if (bicepsCm.present) {
      map['biceps_cm'] = Variable<double>(bicepsCm.value);
    }
    if (thighsCm.present) {
      map['thighs_cm'] = Variable<double>(thighsCm.value);
    }
    if (calvesCm.present) {
      map['calves_cm'] = Variable<double>(calvesCm.value);
    }
    if (neckCm.present) {
      map['neck_cm'] = Variable<double>(neckCm.value);
    }
    if (forearmCm.present) {
      map['forearm_cm'] = Variable<double>(forearmCm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
          ..write('bmi: $bmi, ')
          ..write('chestCm: $chestCm, ')
          ..write('waistCm: $waistCm, ')
          ..write('hipsCm: $hipsCm, ')
          ..write('bicepsCm: $bicepsCm, ')
          ..write('thighsCm: $thighsCm, ')
          ..write('calvesCm: $calvesCm, ')
          ..write('neckCm: $neckCm, ')
          ..write('forearmCm: $forearmCm')
          ..write(')'))
        .toString();
  }
}

class $StreaksTable extends Streaks with TableInfo<$StreaksTable, Streak> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StreaksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastWorkoutDateMeta = const VerificationMeta(
    'lastWorkoutDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastWorkoutDate =
      GeneratedColumn<DateTime>(
        'last_workout_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    currentStreak,
    longestStreak,
    lastWorkoutDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'streaks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Streak> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('last_workout_date')) {
      context.handle(
        _lastWorkoutDateMeta,
        lastWorkoutDate.isAcceptableOrUnknown(
          data['last_workout_date']!,
          _lastWorkoutDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Streak map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Streak(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      lastWorkoutDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_workout_date'],
      ),
    );
  }

  @override
  $StreaksTable createAlias(String alias) {
    return $StreaksTable(attachedDatabase, alias);
  }
}

class Streak extends DataClass implements Insertable<Streak> {
  final int id;
  final int userId;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastWorkoutDate;
  const Streak({
    required this.id,
    required this.userId,
    required this.currentStreak,
    required this.longestStreak,
    this.lastWorkoutDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastWorkoutDate != null) {
      map['last_workout_date'] = Variable<DateTime>(lastWorkoutDate);
    }
    return map;
  }

  StreaksCompanion toCompanion(bool nullToAbsent) {
    return StreaksCompanion(
      id: Value(id),
      userId: Value(userId),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastWorkoutDate: lastWorkoutDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWorkoutDate),
    );
  }

  factory Streak.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Streak(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastWorkoutDate: serializer.fromJson<DateTime?>(json['lastWorkoutDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastWorkoutDate': serializer.toJson<DateTime?>(lastWorkoutDate),
    };
  }

  Streak copyWith({
    int? id,
    int? userId,
    int? currentStreak,
    int? longestStreak,
    Value<DateTime?> lastWorkoutDate = const Value.absent(),
  }) => Streak(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    lastWorkoutDate: lastWorkoutDate.present
        ? lastWorkoutDate.value
        : this.lastWorkoutDate,
  );
  Streak copyWithCompanion(StreaksCompanion data) {
    return Streak(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastWorkoutDate: data.lastWorkoutDate.present
          ? data.lastWorkoutDate.value
          : this.lastWorkoutDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Streak(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastWorkoutDate: $lastWorkoutDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, currentStreak, longestStreak, lastWorkoutDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Streak &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastWorkoutDate == this.lastWorkoutDate);
}

class StreaksCompanion extends UpdateCompanion<Streak> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastWorkoutDate;
  const StreaksCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastWorkoutDate = const Value.absent(),
  });
  StreaksCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastWorkoutDate = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<Streak> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastWorkoutDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastWorkoutDate != null) 'last_workout_date': lastWorkoutDate,
    });
  }

  StreaksCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<DateTime?>? lastWorkoutDate,
  }) {
    return StreaksCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastWorkoutDate: lastWorkoutDate ?? this.lastWorkoutDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastWorkoutDate.present) {
      map['last_workout_date'] = Variable<DateTime>(lastWorkoutDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StreaksCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastWorkoutDate: $lastWorkoutDate')
          ..write(')'))
        .toString();
  }
}

class $XpLogTable extends XpLog with TableInfo<$XpLogTable, XpLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XpLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _earnedAtMeta = const VerificationMeta(
    'earnedAt',
  );
  @override
  late final GeneratedColumn<DateTime> earnedAt = GeneratedColumn<DateTime>(
    'earned_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, amount, reason, earnedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xp_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<XpLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('earned_at')) {
      context.handle(
        _earnedAtMeta,
        earnedAt.isAcceptableOrUnknown(data['earned_at']!, _earnedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XpLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XpLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      earnedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}earned_at'],
      )!,
    );
  }

  @override
  $XpLogTable createAlias(String alias) {
    return $XpLogTable(attachedDatabase, alias);
  }
}

class XpLogData extends DataClass implements Insertable<XpLogData> {
  final int id;
  final int userId;
  final int amount;
  final String reason;
  final DateTime earnedAt;
  const XpLogData({
    required this.id,
    required this.userId,
    required this.amount,
    required this.reason,
    required this.earnedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['amount'] = Variable<int>(amount);
    map['reason'] = Variable<String>(reason);
    map['earned_at'] = Variable<DateTime>(earnedAt);
    return map;
  }

  XpLogCompanion toCompanion(bool nullToAbsent) {
    return XpLogCompanion(
      id: Value(id),
      userId: Value(userId),
      amount: Value(amount),
      reason: Value(reason),
      earnedAt: Value(earnedAt),
    );
  }

  factory XpLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XpLogData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      amount: serializer.fromJson<int>(json['amount']),
      reason: serializer.fromJson<String>(json['reason']),
      earnedAt: serializer.fromJson<DateTime>(json['earnedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'amount': serializer.toJson<int>(amount),
      'reason': serializer.toJson<String>(reason),
      'earnedAt': serializer.toJson<DateTime>(earnedAt),
    };
  }

  XpLogData copyWith({
    int? id,
    int? userId,
    int? amount,
    String? reason,
    DateTime? earnedAt,
  }) => XpLogData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    amount: amount ?? this.amount,
    reason: reason ?? this.reason,
    earnedAt: earnedAt ?? this.earnedAt,
  );
  XpLogData copyWithCompanion(XpLogCompanion data) {
    return XpLogData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      amount: data.amount.present ? data.amount.value : this.amount,
      reason: data.reason.present ? data.reason.value : this.reason,
      earnedAt: data.earnedAt.present ? data.earnedAt.value : this.earnedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XpLogData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('earnedAt: $earnedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, amount, reason, earnedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XpLogData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.amount == this.amount &&
          other.reason == this.reason &&
          other.earnedAt == this.earnedAt);
}

class XpLogCompanion extends UpdateCompanion<XpLogData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> amount;
  final Value<String> reason;
  final Value<DateTime> earnedAt;
  const XpLogCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.reason = const Value.absent(),
    this.earnedAt = const Value.absent(),
  });
  XpLogCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int amount,
    required String reason,
    this.earnedAt = const Value.absent(),
  }) : userId = Value(userId),
       amount = Value(amount),
       reason = Value(reason);
  static Insertable<XpLogData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? amount,
    Expression<String>? reason,
    Expression<DateTime>? earnedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (reason != null) 'reason': reason,
      if (earnedAt != null) 'earned_at': earnedAt,
    });
  }

  XpLogCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? amount,
    Value<String>? reason,
    Value<DateTime>? earnedAt,
  }) {
    return XpLogCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      reason: reason ?? this.reason,
      earnedAt: earnedAt ?? this.earnedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (earnedAt.present) {
      map['earned_at'] = Variable<DateTime>(earnedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XpLogCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('earnedAt: $earnedAt')
          ..write(')'))
        .toString();
  }
}

class $BadgesTable extends Badges with TableInfo<$BadgesTable, Badge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BadgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconAssetMeta = const VerificationMeta(
    'iconAsset',
  );
  @override
  late final GeneratedColumn<String> iconAsset = GeneratedColumn<String>(
    'icon_asset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    key,
    name,
    description,
    iconAsset,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'badges';
  @override
  VerificationContext validateIntegrity(
    Insertable<Badge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_asset')) {
      context.handle(
        _iconAssetMeta,
        iconAsset.isAcceptableOrUnknown(data['icon_asset']!, _iconAssetMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Badge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Badge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_asset'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  $BadgesTable createAlias(String alias) {
    return $BadgesTable(attachedDatabase, alias);
  }
}

class Badge extends DataClass implements Insertable<Badge> {
  final int id;
  final String key;
  final String name;
  final String description;
  final String iconAsset;
  final String category;
  const Badge({
    required this.id,
    required this.key,
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon_asset'] = Variable<String>(iconAsset);
    map['category'] = Variable<String>(category);
    return map;
  }

  BadgesCompanion toCompanion(bool nullToAbsent) {
    return BadgesCompanion(
      id: Value(id),
      key: Value(key),
      name: Value(name),
      description: Value(description),
      iconAsset: Value(iconAsset),
      category: Value(category),
    );
  }

  factory Badge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Badge(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      iconAsset: serializer.fromJson<String>(json['iconAsset']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'iconAsset': serializer.toJson<String>(iconAsset),
      'category': serializer.toJson<String>(category),
    };
  }

  Badge copyWith({
    int? id,
    String? key,
    String? name,
    String? description,
    String? iconAsset,
    String? category,
  }) => Badge(
    id: id ?? this.id,
    key: key ?? this.key,
    name: name ?? this.name,
    description: description ?? this.description,
    iconAsset: iconAsset ?? this.iconAsset,
    category: category ?? this.category,
  );
  Badge copyWithCompanion(BadgesCompanion data) {
    return Badge(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconAsset: data.iconAsset.present ? data.iconAsset.value : this.iconAsset,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Badge(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconAsset: $iconAsset, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, key, name, description, iconAsset, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Badge &&
          other.id == this.id &&
          other.key == this.key &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconAsset == this.iconAsset &&
          other.category == this.category);
}

class BadgesCompanion extends UpdateCompanion<Badge> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> name;
  final Value<String> description;
  final Value<String> iconAsset;
  final Value<String> category;
  const BadgesCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconAsset = const Value.absent(),
    this.category = const Value.absent(),
  });
  BadgesCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String name,
    required String description,
    this.iconAsset = const Value.absent(),
    required String category,
  }) : key = Value(key),
       name = Value(name),
       description = Value(description),
       category = Value(category);
  static Insertable<Badge> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconAsset,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconAsset != null) 'icon_asset': iconAsset,
      if (category != null) 'category': category,
    });
  }

  BadgesCompanion copyWith({
    Value<int>? id,
    Value<String>? key,
    Value<String>? name,
    Value<String>? description,
    Value<String>? iconAsset,
    Value<String>? category,
  }) {
    return BadgesCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      description: description ?? this.description,
      iconAsset: iconAsset ?? this.iconAsset,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconAsset.present) {
      map['icon_asset'] = Variable<String>(iconAsset.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BadgesCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconAsset: $iconAsset, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $UserBadgesTable extends UserBadges
    with TableInfo<$UserBadgesTable, UserBadge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserBadgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _badgeIdMeta = const VerificationMeta(
    'badgeId',
  );
  @override
  late final GeneratedColumn<int> badgeId = GeneratedColumn<int>(
    'badge_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES badges (id)',
    ),
  );
  static const VerificationMeta _earnedAtMeta = const VerificationMeta(
    'earnedAt',
  );
  @override
  late final GeneratedColumn<DateTime> earnedAt = GeneratedColumn<DateTime>(
    'earned_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, badgeId, earnedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_badges';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserBadge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('badge_id')) {
      context.handle(
        _badgeIdMeta,
        badgeId.isAcceptableOrUnknown(data['badge_id']!, _badgeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_badgeIdMeta);
    }
    if (data.containsKey('earned_at')) {
      context.handle(
        _earnedAtMeta,
        earnedAt.isAcceptableOrUnknown(data['earned_at']!, _earnedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserBadge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserBadge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      badgeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}badge_id'],
      )!,
      earnedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}earned_at'],
      )!,
    );
  }

  @override
  $UserBadgesTable createAlias(String alias) {
    return $UserBadgesTable(attachedDatabase, alias);
  }
}

class UserBadge extends DataClass implements Insertable<UserBadge> {
  final int id;
  final int userId;
  final int badgeId;
  final DateTime earnedAt;
  const UserBadge({
    required this.id,
    required this.userId,
    required this.badgeId,
    required this.earnedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['badge_id'] = Variable<int>(badgeId);
    map['earned_at'] = Variable<DateTime>(earnedAt);
    return map;
  }

  UserBadgesCompanion toCompanion(bool nullToAbsent) {
    return UserBadgesCompanion(
      id: Value(id),
      userId: Value(userId),
      badgeId: Value(badgeId),
      earnedAt: Value(earnedAt),
    );
  }

  factory UserBadge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserBadge(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      badgeId: serializer.fromJson<int>(json['badgeId']),
      earnedAt: serializer.fromJson<DateTime>(json['earnedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'badgeId': serializer.toJson<int>(badgeId),
      'earnedAt': serializer.toJson<DateTime>(earnedAt),
    };
  }

  UserBadge copyWith({
    int? id,
    int? userId,
    int? badgeId,
    DateTime? earnedAt,
  }) => UserBadge(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    badgeId: badgeId ?? this.badgeId,
    earnedAt: earnedAt ?? this.earnedAt,
  );
  UserBadge copyWithCompanion(UserBadgesCompanion data) {
    return UserBadge(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      badgeId: data.badgeId.present ? data.badgeId.value : this.badgeId,
      earnedAt: data.earnedAt.present ? data.earnedAt.value : this.earnedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserBadge(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('badgeId: $badgeId, ')
          ..write('earnedAt: $earnedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, badgeId, earnedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserBadge &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.badgeId == this.badgeId &&
          other.earnedAt == this.earnedAt);
}

class UserBadgesCompanion extends UpdateCompanion<UserBadge> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> badgeId;
  final Value<DateTime> earnedAt;
  const UserBadgesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.badgeId = const Value.absent(),
    this.earnedAt = const Value.absent(),
  });
  UserBadgesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int badgeId,
    this.earnedAt = const Value.absent(),
  }) : userId = Value(userId),
       badgeId = Value(badgeId);
  static Insertable<UserBadge> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? badgeId,
    Expression<DateTime>? earnedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (badgeId != null) 'badge_id': badgeId,
      if (earnedAt != null) 'earned_at': earnedAt,
    });
  }

  UserBadgesCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? badgeId,
    Value<DateTime>? earnedAt,
  }) {
    return UserBadgesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      badgeId: badgeId ?? this.badgeId,
      earnedAt: earnedAt ?? this.earnedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (badgeId.present) {
      map['badge_id'] = Variable<int>(badgeId.value);
    }
    if (earnedAt.present) {
      map['earned_at'] = Variable<DateTime>(earnedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserBadgesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('badgeId: $badgeId, ')
          ..write('earnedAt: $earnedAt')
          ..write(')'))
        .toString();
  }
}

class $NotificationWindowsTable extends NotificationWindows
    with TableInfo<$NotificationWindowsTable, NotificationWindow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationWindowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _startHourMeta = const VerificationMeta(
    'startHour',
  );
  @override
  late final GeneratedColumn<int> startHour = GeneratedColumn<int>(
    'start_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinuteMeta = const VerificationMeta(
    'startMinute',
  );
  @override
  late final GeneratedColumn<int> startMinute = GeneratedColumn<int>(
    'start_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endHourMeta = const VerificationMeta(
    'endHour',
  );
  @override
  late final GeneratedColumn<int> endHour = GeneratedColumn<int>(
    'end_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinuteMeta = const VerificationMeta(
    'endMinute',
  );
  @override
  late final GeneratedColumn<int> endMinute = GeneratedColumn<int>(
    'end_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    startHour,
    startMinute,
    endHour,
    endMinute,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_windows';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationWindow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('start_hour')) {
      context.handle(
        _startHourMeta,
        startHour.isAcceptableOrUnknown(data['start_hour']!, _startHourMeta),
      );
    } else if (isInserting) {
      context.missing(_startHourMeta);
    }
    if (data.containsKey('start_minute')) {
      context.handle(
        _startMinuteMeta,
        startMinute.isAcceptableOrUnknown(
          data['start_minute']!,
          _startMinuteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinuteMeta);
    }
    if (data.containsKey('end_hour')) {
      context.handle(
        _endHourMeta,
        endHour.isAcceptableOrUnknown(data['end_hour']!, _endHourMeta),
      );
    } else if (isInserting) {
      context.missing(_endHourMeta);
    }
    if (data.containsKey('end_minute')) {
      context.handle(
        _endMinuteMeta,
        endMinute.isAcceptableOrUnknown(data['end_minute']!, _endMinuteMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinuteMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationWindow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationWindow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      startHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_hour'],
      )!,
      startMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minute'],
      )!,
      endHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_hour'],
      )!,
      endMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minute'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $NotificationWindowsTable createAlias(String alias) {
    return $NotificationWindowsTable(attachedDatabase, alias);
  }
}

class NotificationWindow extends DataClass
    implements Insertable<NotificationWindow> {
  final int id;
  final int userId;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
  final int orderIndex;
  const NotificationWindow({
    required this.id,
    required this.userId,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['start_hour'] = Variable<int>(startHour);
    map['start_minute'] = Variable<int>(startMinute);
    map['end_hour'] = Variable<int>(endHour);
    map['end_minute'] = Variable<int>(endMinute);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  NotificationWindowsCompanion toCompanion(bool nullToAbsent) {
    return NotificationWindowsCompanion(
      id: Value(id),
      userId: Value(userId),
      startHour: Value(startHour),
      startMinute: Value(startMinute),
      endHour: Value(endHour),
      endMinute: Value(endMinute),
      orderIndex: Value(orderIndex),
    );
  }

  factory NotificationWindow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationWindow(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      startHour: serializer.fromJson<int>(json['startHour']),
      startMinute: serializer.fromJson<int>(json['startMinute']),
      endHour: serializer.fromJson<int>(json['endHour']),
      endMinute: serializer.fromJson<int>(json['endMinute']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'startHour': serializer.toJson<int>(startHour),
      'startMinute': serializer.toJson<int>(startMinute),
      'endHour': serializer.toJson<int>(endHour),
      'endMinute': serializer.toJson<int>(endMinute),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  NotificationWindow copyWith({
    int? id,
    int? userId,
    int? startHour,
    int? startMinute,
    int? endHour,
    int? endMinute,
    int? orderIndex,
  }) => NotificationWindow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    startHour: startHour ?? this.startHour,
    startMinute: startMinute ?? this.startMinute,
    endHour: endHour ?? this.endHour,
    endMinute: endMinute ?? this.endMinute,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  NotificationWindow copyWithCompanion(NotificationWindowsCompanion data) {
    return NotificationWindow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      startHour: data.startHour.present ? data.startHour.value : this.startHour,
      startMinute: data.startMinute.present
          ? data.startMinute.value
          : this.startMinute,
      endHour: data.endHour.present ? data.endHour.value : this.endHour,
      endMinute: data.endMinute.present ? data.endMinute.value : this.endMinute,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationWindow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startHour: $startHour, ')
          ..write('startMinute: $startMinute, ')
          ..write('endHour: $endHour, ')
          ..write('endMinute: $endMinute, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    startHour,
    startMinute,
    endHour,
    endMinute,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationWindow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.startHour == this.startHour &&
          other.startMinute == this.startMinute &&
          other.endHour == this.endHour &&
          other.endMinute == this.endMinute &&
          other.orderIndex == this.orderIndex);
}

class NotificationWindowsCompanion extends UpdateCompanion<NotificationWindow> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> startHour;
  final Value<int> startMinute;
  final Value<int> endHour;
  final Value<int> endMinute;
  final Value<int> orderIndex;
  const NotificationWindowsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.startHour = const Value.absent(),
    this.startMinute = const Value.absent(),
    this.endHour = const Value.absent(),
    this.endMinute = const Value.absent(),
    this.orderIndex = const Value.absent(),
  });
  NotificationWindowsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int startHour,
    required int startMinute,
    required int endHour,
    required int endMinute,
    required int orderIndex,
  }) : userId = Value(userId),
       startHour = Value(startHour),
       startMinute = Value(startMinute),
       endHour = Value(endHour),
       endMinute = Value(endMinute),
       orderIndex = Value(orderIndex);
  static Insertable<NotificationWindow> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? startHour,
    Expression<int>? startMinute,
    Expression<int>? endHour,
    Expression<int>? endMinute,
    Expression<int>? orderIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (startHour != null) 'start_hour': startHour,
      if (startMinute != null) 'start_minute': startMinute,
      if (endHour != null) 'end_hour': endHour,
      if (endMinute != null) 'end_minute': endMinute,
      if (orderIndex != null) 'order_index': orderIndex,
    });
  }

  NotificationWindowsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? startHour,
    Value<int>? startMinute,
    Value<int>? endHour,
    Value<int>? endMinute,
    Value<int>? orderIndex,
  }) {
    return NotificationWindowsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startHour: startHour ?? this.startHour,
      startMinute: startMinute ?? this.startMinute,
      endHour: endHour ?? this.endHour,
      endMinute: endMinute ?? this.endMinute,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (startHour.present) {
      map['start_hour'] = Variable<int>(startHour.value);
    }
    if (startMinute.present) {
      map['start_minute'] = Variable<int>(startMinute.value);
    }
    if (endHour.present) {
      map['end_hour'] = Variable<int>(endHour.value);
    }
    if (endMinute.present) {
      map['end_minute'] = Variable<int>(endMinute.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationWindowsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startHour: $startHour, ')
          ..write('startMinute: $startMinute, ')
          ..write('endHour: $endHour, ')
          ..write('endMinute: $endMinute, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }
}

class $NotificationLogTable extends NotificationLog
    with TableInfo<$NotificationLogTable, NotificationLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _nagLevelMeta = const VerificationMeta(
    'nagLevel',
  );
  @override
  late final GeneratedColumn<int> nagLevel = GeneratedColumn<int>(
    'nag_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  @override
  late final GeneratedColumn<DateTime> sentAt = GeneratedColumn<DateTime>(
    'sent_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, nagLevel, message, sentAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('nag_level')) {
      context.handle(
        _nagLevelMeta,
        nagLevel.isAcceptableOrUnknown(data['nag_level']!, _nagLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_nagLevelMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('sent_at')) {
      context.handle(
        _sentAtMeta,
        sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      nagLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}nag_level'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      sentAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sent_at'],
      )!,
    );
  }

  @override
  $NotificationLogTable createAlias(String alias) {
    return $NotificationLogTable(attachedDatabase, alias);
  }
}

class NotificationLogData extends DataClass
    implements Insertable<NotificationLogData> {
  final int id;
  final int userId;
  final int nagLevel;
  final String message;
  final DateTime sentAt;
  const NotificationLogData({
    required this.id,
    required this.userId,
    required this.nagLevel,
    required this.message,
    required this.sentAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['nag_level'] = Variable<int>(nagLevel);
    map['message'] = Variable<String>(message);
    map['sent_at'] = Variable<DateTime>(sentAt);
    return map;
  }

  NotificationLogCompanion toCompanion(bool nullToAbsent) {
    return NotificationLogCompanion(
      id: Value(id),
      userId: Value(userId),
      nagLevel: Value(nagLevel),
      message: Value(message),
      sentAt: Value(sentAt),
    );
  }

  factory NotificationLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationLogData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      nagLevel: serializer.fromJson<int>(json['nagLevel']),
      message: serializer.fromJson<String>(json['message']),
      sentAt: serializer.fromJson<DateTime>(json['sentAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'nagLevel': serializer.toJson<int>(nagLevel),
      'message': serializer.toJson<String>(message),
      'sentAt': serializer.toJson<DateTime>(sentAt),
    };
  }

  NotificationLogData copyWith({
    int? id,
    int? userId,
    int? nagLevel,
    String? message,
    DateTime? sentAt,
  }) => NotificationLogData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    nagLevel: nagLevel ?? this.nagLevel,
    message: message ?? this.message,
    sentAt: sentAt ?? this.sentAt,
  );
  NotificationLogData copyWithCompanion(NotificationLogCompanion data) {
    return NotificationLogData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      nagLevel: data.nagLevel.present ? data.nagLevel.value : this.nagLevel,
      message: data.message.present ? data.message.value : this.message,
      sentAt: data.sentAt.present ? data.sentAt.value : this.sentAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationLogData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('nagLevel: $nagLevel, ')
          ..write('message: $message, ')
          ..write('sentAt: $sentAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, nagLevel, message, sentAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationLogData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.nagLevel == this.nagLevel &&
          other.message == this.message &&
          other.sentAt == this.sentAt);
}

class NotificationLogCompanion extends UpdateCompanion<NotificationLogData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> nagLevel;
  final Value<String> message;
  final Value<DateTime> sentAt;
  const NotificationLogCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.nagLevel = const Value.absent(),
    this.message = const Value.absent(),
    this.sentAt = const Value.absent(),
  });
  NotificationLogCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int nagLevel,
    required String message,
    this.sentAt = const Value.absent(),
  }) : userId = Value(userId),
       nagLevel = Value(nagLevel),
       message = Value(message);
  static Insertable<NotificationLogData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? nagLevel,
    Expression<String>? message,
    Expression<DateTime>? sentAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (nagLevel != null) 'nag_level': nagLevel,
      if (message != null) 'message': message,
      if (sentAt != null) 'sent_at': sentAt,
    });
  }

  NotificationLogCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? nagLevel,
    Value<String>? message,
    Value<DateTime>? sentAt,
  }) {
    return NotificationLogCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      nagLevel: nagLevel ?? this.nagLevel,
      message: message ?? this.message,
      sentAt: sentAt ?? this.sentAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (nagLevel.present) {
      map['nag_level'] = Variable<int>(nagLevel.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationLogCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('nagLevel: $nagLevel, ')
          ..write('message: $message, ')
          ..write('sentAt: $sentAt')
          ..write(')'))
        .toString();
  }
}

class $ExercisePreferencesTable extends ExercisePreferences
    with TableInfo<$ExercisePreferencesTable, ExercisePreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisePreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<int> exerciseId = GeneratedColumn<int>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _preferenceMeta = const VerificationMeta(
    'preference',
  );
  @override
  late final GeneratedColumn<int> preference = GeneratedColumn<int>(
    'preference',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, exerciseId, preference];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExercisePreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('preference')) {
      context.handle(
        _preferenceMeta,
        preference.isAcceptableOrUnknown(data['preference']!, _preferenceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, exerciseId},
  ];
  @override
  ExercisePreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExercisePreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_id'],
      )!,
      preference: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preference'],
      )!,
    );
  }

  @override
  $ExercisePreferencesTable createAlias(String alias) {
    return $ExercisePreferencesTable(attachedDatabase, alias);
  }
}

class ExercisePreference extends DataClass
    implements Insertable<ExercisePreference> {
  final int id;
  final int userId;
  final int exerciseId;
  final int preference;
  const ExercisePreference({
    required this.id,
    required this.userId,
    required this.exerciseId,
    required this.preference,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['exercise_id'] = Variable<int>(exerciseId);
    map['preference'] = Variable<int>(preference);
    return map;
  }

  ExercisePreferencesCompanion toCompanion(bool nullToAbsent) {
    return ExercisePreferencesCompanion(
      id: Value(id),
      userId: Value(userId),
      exerciseId: Value(exerciseId),
      preference: Value(preference),
    );
  }

  factory ExercisePreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExercisePreference(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
      preference: serializer.fromJson<int>(json['preference']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'exerciseId': serializer.toJson<int>(exerciseId),
      'preference': serializer.toJson<int>(preference),
    };
  }

  ExercisePreference copyWith({
    int? id,
    int? userId,
    int? exerciseId,
    int? preference,
  }) => ExercisePreference(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    exerciseId: exerciseId ?? this.exerciseId,
    preference: preference ?? this.preference,
  );
  ExercisePreference copyWithCompanion(ExercisePreferencesCompanion data) {
    return ExercisePreference(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      preference: data.preference.present
          ? data.preference.value
          : this.preference,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExercisePreference(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('preference: $preference')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, exerciseId, preference);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExercisePreference &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.exerciseId == this.exerciseId &&
          other.preference == this.preference);
}

class ExercisePreferencesCompanion extends UpdateCompanion<ExercisePreference> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> exerciseId;
  final Value<int> preference;
  const ExercisePreferencesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.preference = const Value.absent(),
  });
  ExercisePreferencesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int exerciseId,
    this.preference = const Value.absent(),
  }) : userId = Value(userId),
       exerciseId = Value(exerciseId);
  static Insertable<ExercisePreference> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? exerciseId,
    Expression<int>? preference,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (preference != null) 'preference': preference,
    });
  }

  ExercisePreferencesCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? exerciseId,
    Value<int>? preference,
  }) {
    return ExercisePreferencesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      exerciseId: exerciseId ?? this.exerciseId,
      preference: preference ?? this.preference,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    if (preference.present) {
      map['preference'] = Variable<int>(preference.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisePreferencesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('preference: $preference')
          ..write(')'))
        .toString();
  }
}

class $UserLeaguesTable extends UserLeagues
    with TableInfo<$UserLeaguesTable, UserLeague> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLeaguesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _currentTierMeta = const VerificationMeta(
    'currentTier',
  );
  @override
  late final GeneratedColumn<int> currentTier = GeneratedColumn<int>(
    'current_tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _weeksAtCurrentTierMeta =
      const VerificationMeta('weeksAtCurrentTier');
  @override
  late final GeneratedColumn<int> weeksAtCurrentTier = GeneratedColumn<int>(
    'weeks_at_current_tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weeksAboveNextMeta = const VerificationMeta(
    'weeksAboveNext',
  );
  @override
  late final GeneratedColumn<int> weeksAboveNext = GeneratedColumn<int>(
    'weeks_above_next',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weeksBelowCurrentMeta = const VerificationMeta(
    'weeksBelowCurrent',
  );
  @override
  late final GeneratedColumn<int> weeksBelowCurrent = GeneratedColumn<int>(
    'weeks_below_current',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastCalculatedAtMeta = const VerificationMeta(
    'lastCalculatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCalculatedAt =
      GeneratedColumn<DateTime>(
        'last_calculated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    currentTier,
    weeksAtCurrentTier,
    weeksAboveNext,
    weeksBelowCurrent,
    lastCalculatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_leagues';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserLeague> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('current_tier')) {
      context.handle(
        _currentTierMeta,
        currentTier.isAcceptableOrUnknown(
          data['current_tier']!,
          _currentTierMeta,
        ),
      );
    }
    if (data.containsKey('weeks_at_current_tier')) {
      context.handle(
        _weeksAtCurrentTierMeta,
        weeksAtCurrentTier.isAcceptableOrUnknown(
          data['weeks_at_current_tier']!,
          _weeksAtCurrentTierMeta,
        ),
      );
    }
    if (data.containsKey('weeks_above_next')) {
      context.handle(
        _weeksAboveNextMeta,
        weeksAboveNext.isAcceptableOrUnknown(
          data['weeks_above_next']!,
          _weeksAboveNextMeta,
        ),
      );
    }
    if (data.containsKey('weeks_below_current')) {
      context.handle(
        _weeksBelowCurrentMeta,
        weeksBelowCurrent.isAcceptableOrUnknown(
          data['weeks_below_current']!,
          _weeksBelowCurrentMeta,
        ),
      );
    }
    if (data.containsKey('last_calculated_at')) {
      context.handle(
        _lastCalculatedAtMeta,
        lastCalculatedAt.isAcceptableOrUnknown(
          data['last_calculated_at']!,
          _lastCalculatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserLeague map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLeague(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      currentTier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_tier'],
      )!,
      weeksAtCurrentTier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weeks_at_current_tier'],
      )!,
      weeksAboveNext: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weeks_above_next'],
      )!,
      weeksBelowCurrent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weeks_below_current'],
      )!,
      lastCalculatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_calculated_at'],
      ),
    );
  }

  @override
  $UserLeaguesTable createAlias(String alias) {
    return $UserLeaguesTable(attachedDatabase, alias);
  }
}

class UserLeague extends DataClass implements Insertable<UserLeague> {
  final int id;
  final int userId;
  final int currentTier;
  final int weeksAtCurrentTier;
  final int weeksAboveNext;
  final int weeksBelowCurrent;
  final DateTime? lastCalculatedAt;
  const UserLeague({
    required this.id,
    required this.userId,
    required this.currentTier,
    required this.weeksAtCurrentTier,
    required this.weeksAboveNext,
    required this.weeksBelowCurrent,
    this.lastCalculatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['current_tier'] = Variable<int>(currentTier);
    map['weeks_at_current_tier'] = Variable<int>(weeksAtCurrentTier);
    map['weeks_above_next'] = Variable<int>(weeksAboveNext);
    map['weeks_below_current'] = Variable<int>(weeksBelowCurrent);
    if (!nullToAbsent || lastCalculatedAt != null) {
      map['last_calculated_at'] = Variable<DateTime>(lastCalculatedAt);
    }
    return map;
  }

  UserLeaguesCompanion toCompanion(bool nullToAbsent) {
    return UserLeaguesCompanion(
      id: Value(id),
      userId: Value(userId),
      currentTier: Value(currentTier),
      weeksAtCurrentTier: Value(weeksAtCurrentTier),
      weeksAboveNext: Value(weeksAboveNext),
      weeksBelowCurrent: Value(weeksBelowCurrent),
      lastCalculatedAt: lastCalculatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCalculatedAt),
    );
  }

  factory UserLeague.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLeague(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      currentTier: serializer.fromJson<int>(json['currentTier']),
      weeksAtCurrentTier: serializer.fromJson<int>(json['weeksAtCurrentTier']),
      weeksAboveNext: serializer.fromJson<int>(json['weeksAboveNext']),
      weeksBelowCurrent: serializer.fromJson<int>(json['weeksBelowCurrent']),
      lastCalculatedAt: serializer.fromJson<DateTime?>(
        json['lastCalculatedAt'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'currentTier': serializer.toJson<int>(currentTier),
      'weeksAtCurrentTier': serializer.toJson<int>(weeksAtCurrentTier),
      'weeksAboveNext': serializer.toJson<int>(weeksAboveNext),
      'weeksBelowCurrent': serializer.toJson<int>(weeksBelowCurrent),
      'lastCalculatedAt': serializer.toJson<DateTime?>(lastCalculatedAt),
    };
  }

  UserLeague copyWith({
    int? id,
    int? userId,
    int? currentTier,
    int? weeksAtCurrentTier,
    int? weeksAboveNext,
    int? weeksBelowCurrent,
    Value<DateTime?> lastCalculatedAt = const Value.absent(),
  }) => UserLeague(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    currentTier: currentTier ?? this.currentTier,
    weeksAtCurrentTier: weeksAtCurrentTier ?? this.weeksAtCurrentTier,
    weeksAboveNext: weeksAboveNext ?? this.weeksAboveNext,
    weeksBelowCurrent: weeksBelowCurrent ?? this.weeksBelowCurrent,
    lastCalculatedAt: lastCalculatedAt.present
        ? lastCalculatedAt.value
        : this.lastCalculatedAt,
  );
  UserLeague copyWithCompanion(UserLeaguesCompanion data) {
    return UserLeague(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      currentTier: data.currentTier.present
          ? data.currentTier.value
          : this.currentTier,
      weeksAtCurrentTier: data.weeksAtCurrentTier.present
          ? data.weeksAtCurrentTier.value
          : this.weeksAtCurrentTier,
      weeksAboveNext: data.weeksAboveNext.present
          ? data.weeksAboveNext.value
          : this.weeksAboveNext,
      weeksBelowCurrent: data.weeksBelowCurrent.present
          ? data.weeksBelowCurrent.value
          : this.weeksBelowCurrent,
      lastCalculatedAt: data.lastCalculatedAt.present
          ? data.lastCalculatedAt.value
          : this.lastCalculatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserLeague(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentTier: $currentTier, ')
          ..write('weeksAtCurrentTier: $weeksAtCurrentTier, ')
          ..write('weeksAboveNext: $weeksAboveNext, ')
          ..write('weeksBelowCurrent: $weeksBelowCurrent, ')
          ..write('lastCalculatedAt: $lastCalculatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    currentTier,
    weeksAtCurrentTier,
    weeksAboveNext,
    weeksBelowCurrent,
    lastCalculatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLeague &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.currentTier == this.currentTier &&
          other.weeksAtCurrentTier == this.weeksAtCurrentTier &&
          other.weeksAboveNext == this.weeksAboveNext &&
          other.weeksBelowCurrent == this.weeksBelowCurrent &&
          other.lastCalculatedAt == this.lastCalculatedAt);
}

class UserLeaguesCompanion extends UpdateCompanion<UserLeague> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> currentTier;
  final Value<int> weeksAtCurrentTier;
  final Value<int> weeksAboveNext;
  final Value<int> weeksBelowCurrent;
  final Value<DateTime?> lastCalculatedAt;
  const UserLeaguesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.currentTier = const Value.absent(),
    this.weeksAtCurrentTier = const Value.absent(),
    this.weeksAboveNext = const Value.absent(),
    this.weeksBelowCurrent = const Value.absent(),
    this.lastCalculatedAt = const Value.absent(),
  });
  UserLeaguesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.currentTier = const Value.absent(),
    this.weeksAtCurrentTier = const Value.absent(),
    this.weeksAboveNext = const Value.absent(),
    this.weeksBelowCurrent = const Value.absent(),
    this.lastCalculatedAt = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UserLeague> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? currentTier,
    Expression<int>? weeksAtCurrentTier,
    Expression<int>? weeksAboveNext,
    Expression<int>? weeksBelowCurrent,
    Expression<DateTime>? lastCalculatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (currentTier != null) 'current_tier': currentTier,
      if (weeksAtCurrentTier != null)
        'weeks_at_current_tier': weeksAtCurrentTier,
      if (weeksAboveNext != null) 'weeks_above_next': weeksAboveNext,
      if (weeksBelowCurrent != null) 'weeks_below_current': weeksBelowCurrent,
      if (lastCalculatedAt != null) 'last_calculated_at': lastCalculatedAt,
    });
  }

  UserLeaguesCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? currentTier,
    Value<int>? weeksAtCurrentTier,
    Value<int>? weeksAboveNext,
    Value<int>? weeksBelowCurrent,
    Value<DateTime?>? lastCalculatedAt,
  }) {
    return UserLeaguesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      currentTier: currentTier ?? this.currentTier,
      weeksAtCurrentTier: weeksAtCurrentTier ?? this.weeksAtCurrentTier,
      weeksAboveNext: weeksAboveNext ?? this.weeksAboveNext,
      weeksBelowCurrent: weeksBelowCurrent ?? this.weeksBelowCurrent,
      lastCalculatedAt: lastCalculatedAt ?? this.lastCalculatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (currentTier.present) {
      map['current_tier'] = Variable<int>(currentTier.value);
    }
    if (weeksAtCurrentTier.present) {
      map['weeks_at_current_tier'] = Variable<int>(weeksAtCurrentTier.value);
    }
    if (weeksAboveNext.present) {
      map['weeks_above_next'] = Variable<int>(weeksAboveNext.value);
    }
    if (weeksBelowCurrent.present) {
      map['weeks_below_current'] = Variable<int>(weeksBelowCurrent.value);
    }
    if (lastCalculatedAt.present) {
      map['last_calculated_at'] = Variable<DateTime>(lastCalculatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLeaguesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentTier: $currentTier, ')
          ..write('weeksAtCurrentTier: $weeksAtCurrentTier, ')
          ..write('weeksAboveNext: $weeksAboveNext, ')
          ..write('weeksBelowCurrent: $weeksBelowCurrent, ')
          ..write('lastCalculatedAt: $lastCalculatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $UserEquipmentTable userEquipment = $UserEquipmentTable(this);
  late final $UserFocusBodypartsTable userFocusBodyparts =
      $UserFocusBodypartsTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $PlanDaysTable planDays = $PlanDaysTable(this);
  late final $PlanDayExercisesTable planDayExercises = $PlanDayExercisesTable(
    this,
  );
  late final $WorkoutSessionsTable workoutSessions = $WorkoutSessionsTable(
    this,
  );
  late final $SessionSetsTable sessionSets = $SessionSetsTable(this);
  late final $BodyMeasurementsTable bodyMeasurements = $BodyMeasurementsTable(
    this,
  );
  late final $StreaksTable streaks = $StreaksTable(this);
  late final $XpLogTable xpLog = $XpLogTable(this);
  late final $BadgesTable badges = $BadgesTable(this);
  late final $UserBadgesTable userBadges = $UserBadgesTable(this);
  late final $NotificationWindowsTable notificationWindows =
      $NotificationWindowsTable(this);
  late final $NotificationLogTable notificationLog = $NotificationLogTable(
    this,
  );
  late final $ExercisePreferencesTable exercisePreferences =
      $ExercisePreferencesTable(this);
  late final $UserLeaguesTable userLeagues = $UserLeaguesTable(this);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final GamificationDao gamificationDao = GamificationDao(
    this as AppDatabase,
  );
  late final MeasurementDao measurementDao = MeasurementDao(
    this as AppDatabase,
  );
  late final NotificationDao notificationDao = NotificationDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    userEquipment,
    userFocusBodyparts,
    exercises,
    workoutPlans,
    planDays,
    planDayExercises,
    workoutSessions,
    sessionSets,
    bodyMeasurements,
    streaks,
    xpLog,
    badges,
    userBadges,
    notificationWindows,
    notificationLog,
    exercisePreferences,
    userLeagues,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> difficultyIndex,
      Value<int> trainingFocusIndex,
      Value<double?> heightCm,
      Value<double?> weightKg,
      Value<int> workoutDaysPerWeek,
      Value<String> workoutDays,
      Value<int> preferredHour,
      Value<int> preferredMinute,
      Value<bool> notificationsEnabled,
      Value<bool> onboardingComplete,
      Value<int> scheduleMode,
      Value<int> intervalDays,
      Value<DateTime?> intervalStartDate,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> difficultyIndex,
      Value<int> trainingFocusIndex,
      Value<double?> heightCm,
      Value<double?> weightKg,
      Value<int> workoutDaysPerWeek,
      Value<String> workoutDays,
      Value<int> preferredHour,
      Value<int> preferredMinute,
      Value<bool> notificationsEnabled,
      Value<bool> onboardingComplete,
      Value<int> scheduleMode,
      Value<int> intervalDays,
      Value<DateTime?> intervalStartDate,
      Value<DateTime> createdAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserEquipmentTable, List<UserEquipmentData>>
  _userEquipmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userEquipment,
    aliasName: $_aliasNameGenerator(db.users.id, db.userEquipment.userId),
  );

  $$UserEquipmentTableProcessedTableManager get userEquipmentRefs {
    final manager = $$UserEquipmentTableTableManager(
      $_db,
      $_db.userEquipment,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userEquipmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserFocusBodypartsTable, List<UserFocusBodypart>>
  _userFocusBodypartsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.userFocusBodyparts,
        aliasName: $_aliasNameGenerator(
          db.users.id,
          db.userFocusBodyparts.userId,
        ),
      );

  $$UserFocusBodypartsTableProcessedTableManager get userFocusBodypartsRefs {
    final manager = $$UserFocusBodypartsTableTableManager(
      $_db,
      $_db.userFocusBodyparts,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _userFocusBodypartsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutPlansTable, List<WorkoutPlan>>
  _workoutPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutPlans,
    aliasName: $_aliasNameGenerator(db.users.id, db.workoutPlans.userId),
  );

  $$WorkoutPlansTableProcessedTableManager get workoutPlansRefs {
    final manager = $$WorkoutPlansTableTableManager(
      $_db,
      $_db.workoutPlans,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutSessionsTable, List<WorkoutSession>>
  _workoutSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSessions,
    aliasName: $_aliasNameGenerator(db.users.id, db.workoutSessions.userId),
  );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionsRefs {
    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BodyMeasurementsTable, List<BodyMeasurement>>
  _bodyMeasurementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.bodyMeasurements,
    aliasName: $_aliasNameGenerator(db.users.id, db.bodyMeasurements.userId),
  );

  $$BodyMeasurementsTableProcessedTableManager get bodyMeasurementsRefs {
    final manager = $$BodyMeasurementsTableTableManager(
      $_db,
      $_db.bodyMeasurements,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _bodyMeasurementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StreaksTable, List<Streak>> _streaksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.streaks,
    aliasName: $_aliasNameGenerator(db.users.id, db.streaks.userId),
  );

  $$StreaksTableProcessedTableManager get streaksRefs {
    final manager = $$StreaksTableTableManager(
      $_db,
      $_db.streaks,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_streaksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$XpLogTable, List<XpLogData>> _xpLogRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.xpLog,
    aliasName: $_aliasNameGenerator(db.users.id, db.xpLog.userId),
  );

  $$XpLogTableProcessedTableManager get xpLogRefs {
    final manager = $$XpLogTableTableManager(
      $_db,
      $_db.xpLog,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_xpLogRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserBadgesTable, List<UserBadge>>
  _userBadgesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userBadges,
    aliasName: $_aliasNameGenerator(db.users.id, db.userBadges.userId),
  );

  $$UserBadgesTableProcessedTableManager get userBadgesRefs {
    final manager = $$UserBadgesTableTableManager(
      $_db,
      $_db.userBadges,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userBadgesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $NotificationWindowsTable,
    List<NotificationWindow>
  >
  _notificationWindowsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.notificationWindows,
        aliasName: $_aliasNameGenerator(
          db.users.id,
          db.notificationWindows.userId,
        ),
      );

  $$NotificationWindowsTableProcessedTableManager get notificationWindowsRefs {
    final manager = $$NotificationWindowsTableTableManager(
      $_db,
      $_db.notificationWindows,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _notificationWindowsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotificationLogTable, List<NotificationLogData>>
  _notificationLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notificationLog,
    aliasName: $_aliasNameGenerator(db.users.id, db.notificationLog.userId),
  );

  $$NotificationLogTableProcessedTableManager get notificationLogRefs {
    final manager = $$NotificationLogTableTableManager(
      $_db,
      $_db.notificationLog,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _notificationLogRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExercisePreferencesTable,
    List<ExercisePreference>
  >
  _exercisePreferencesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePreferences,
        aliasName: $_aliasNameGenerator(
          db.users.id,
          db.exercisePreferences.userId,
        ),
      );

  $$ExercisePreferencesTableProcessedTableManager get exercisePreferencesRefs {
    final manager = $$ExercisePreferencesTableTableManager(
      $_db,
      $_db.exercisePreferences,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exercisePreferencesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserLeaguesTable, List<UserLeague>>
  _userLeaguesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userLeagues,
    aliasName: $_aliasNameGenerator(db.users.id, db.userLeagues.userId),
  );

  $$UserLeaguesTableProcessedTableManager get userLeaguesRefs {
    final manager = $$UserLeaguesTableTableManager(
      $_db,
      $_db.userLeagues,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userLeaguesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trainingFocusIndex => $composableBuilder(
    column: $table.trainingFocusIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get workoutDaysPerWeek => $composableBuilder(
    column: $table.workoutDaysPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workoutDays => $composableBuilder(
    column: $table.workoutDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preferredHour => $composableBuilder(
    column: $table.preferredHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preferredMinute => $composableBuilder(
    column: $table.preferredMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get scheduleMode => $composableBuilder(
    column: $table.scheduleMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get intervalStartDate => $composableBuilder(
    column: $table.intervalStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userEquipmentRefs(
    Expression<bool> Function($$UserEquipmentTableFilterComposer f) f,
  ) {
    final $$UserEquipmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userEquipment,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserEquipmentTableFilterComposer(
            $db: $db,
            $table: $db.userEquipment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userFocusBodypartsRefs(
    Expression<bool> Function($$UserFocusBodypartsTableFilterComposer f) f,
  ) {
    final $$UserFocusBodypartsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userFocusBodyparts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserFocusBodypartsTableFilterComposer(
            $db: $db,
            $table: $db.userFocusBodyparts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutPlansRefs(
    Expression<bool> Function($$WorkoutPlansTableFilterComposer f) f,
  ) {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableFilterComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutSessionsRefs(
    Expression<bool> Function($$WorkoutSessionsTableFilterComposer f) f,
  ) {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bodyMeasurementsRefs(
    Expression<bool> Function($$BodyMeasurementsTableFilterComposer f) f,
  ) {
    final $$BodyMeasurementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bodyMeasurements,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BodyMeasurementsTableFilterComposer(
            $db: $db,
            $table: $db.bodyMeasurements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> streaksRefs(
    Expression<bool> Function($$StreaksTableFilterComposer f) f,
  ) {
    final $$StreaksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StreaksTableFilterComposer(
            $db: $db,
            $table: $db.streaks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> xpLogRefs(
    Expression<bool> Function($$XpLogTableFilterComposer f) f,
  ) {
    final $$XpLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpLog,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpLogTableFilterComposer(
            $db: $db,
            $table: $db.xpLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userBadgesRefs(
    Expression<bool> Function($$UserBadgesTableFilterComposer f) f,
  ) {
    final $$UserBadgesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userBadges,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserBadgesTableFilterComposer(
            $db: $db,
            $table: $db.userBadges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificationWindowsRefs(
    Expression<bool> Function($$NotificationWindowsTableFilterComposer f) f,
  ) {
    final $$NotificationWindowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notificationWindows,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationWindowsTableFilterComposer(
            $db: $db,
            $table: $db.notificationWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificationLogRefs(
    Expression<bool> Function($$NotificationLogTableFilterComposer f) f,
  ) {
    final $$NotificationLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notificationLog,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationLogTableFilterComposer(
            $db: $db,
            $table: $db.notificationLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exercisePreferencesRefs(
    Expression<bool> Function($$ExercisePreferencesTableFilterComposer f) f,
  ) {
    final $$ExercisePreferencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercisePreferences,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisePreferencesTableFilterComposer(
            $db: $db,
            $table: $db.exercisePreferences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userLeaguesRefs(
    Expression<bool> Function($$UserLeaguesTableFilterComposer f) f,
  ) {
    final $$UserLeaguesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLeagues,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLeaguesTableFilterComposer(
            $db: $db,
            $table: $db.userLeagues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trainingFocusIndex => $composableBuilder(
    column: $table.trainingFocusIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get workoutDaysPerWeek => $composableBuilder(
    column: $table.workoutDaysPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workoutDays => $composableBuilder(
    column: $table.workoutDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preferredHour => $composableBuilder(
    column: $table.preferredHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preferredMinute => $composableBuilder(
    column: $table.preferredMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get scheduleMode => $composableBuilder(
    column: $table.scheduleMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get intervalStartDate => $composableBuilder(
    column: $table.intervalStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get trainingFocusIndex => $composableBuilder(
    column: $table.trainingFocusIndex,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get workoutDaysPerWeek => $composableBuilder(
    column: $table.workoutDaysPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<String> get workoutDays => $composableBuilder(
    column: $table.workoutDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get preferredHour => $composableBuilder(
    column: $table.preferredHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get preferredMinute => $composableBuilder(
    column: $table.preferredMinute,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => column,
  );

  GeneratedColumn<int> get scheduleMode => $composableBuilder(
    column: $table.scheduleMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get intervalStartDate => $composableBuilder(
    column: $table.intervalStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> userEquipmentRefs<T extends Object>(
    Expression<T> Function($$UserEquipmentTableAnnotationComposer a) f,
  ) {
    final $$UserEquipmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userEquipment,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserEquipmentTableAnnotationComposer(
            $db: $db,
            $table: $db.userEquipment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userFocusBodypartsRefs<T extends Object>(
    Expression<T> Function($$UserFocusBodypartsTableAnnotationComposer a) f,
  ) {
    final $$UserFocusBodypartsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.userFocusBodyparts,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UserFocusBodypartsTableAnnotationComposer(
                $db: $db,
                $table: $db.userFocusBodyparts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> workoutPlansRefs<T extends Object>(
    Expression<T> Function($$WorkoutPlansTableAnnotationComposer a) f,
  ) {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutSessionsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSessionsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bodyMeasurementsRefs<T extends Object>(
    Expression<T> Function($$BodyMeasurementsTableAnnotationComposer a) f,
  ) {
    final $$BodyMeasurementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bodyMeasurements,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BodyMeasurementsTableAnnotationComposer(
            $db: $db,
            $table: $db.bodyMeasurements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> streaksRefs<T extends Object>(
    Expression<T> Function($$StreaksTableAnnotationComposer a) f,
  ) {
    final $$StreaksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.streaks,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StreaksTableAnnotationComposer(
            $db: $db,
            $table: $db.streaks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> xpLogRefs<T extends Object>(
    Expression<T> Function($$XpLogTableAnnotationComposer a) f,
  ) {
    final $$XpLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.xpLog,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$XpLogTableAnnotationComposer(
            $db: $db,
            $table: $db.xpLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userBadgesRefs<T extends Object>(
    Expression<T> Function($$UserBadgesTableAnnotationComposer a) f,
  ) {
    final $$UserBadgesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userBadges,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserBadgesTableAnnotationComposer(
            $db: $db,
            $table: $db.userBadges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notificationWindowsRefs<T extends Object>(
    Expression<T> Function($$NotificationWindowsTableAnnotationComposer a) f,
  ) {
    final $$NotificationWindowsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.notificationWindows,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NotificationWindowsTableAnnotationComposer(
                $db: $db,
                $table: $db.notificationWindows,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> notificationLogRefs<T extends Object>(
    Expression<T> Function($$NotificationLogTableAnnotationComposer a) f,
  ) {
    final $$NotificationLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notificationLog,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationLogTableAnnotationComposer(
            $db: $db,
            $table: $db.notificationLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> exercisePreferencesRefs<T extends Object>(
    Expression<T> Function($$ExercisePreferencesTableAnnotationComposer a) f,
  ) {
    final $$ExercisePreferencesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePreferences,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePreferencesTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePreferences,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> userLeaguesRefs<T extends Object>(
    Expression<T> Function($$UserLeaguesTableAnnotationComposer a) f,
  ) {
    final $$UserLeaguesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLeagues,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLeaguesTableAnnotationComposer(
            $db: $db,
            $table: $db.userLeagues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool userEquipmentRefs,
            bool userFocusBodypartsRefs,
            bool workoutPlansRefs,
            bool workoutSessionsRefs,
            bool bodyMeasurementsRefs,
            bool streaksRefs,
            bool xpLogRefs,
            bool userBadgesRefs,
            bool notificationWindowsRefs,
            bool notificationLogRefs,
            bool exercisePreferencesRefs,
            bool userLeaguesRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> difficultyIndex = const Value.absent(),
                Value<int> trainingFocusIndex = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int> workoutDaysPerWeek = const Value.absent(),
                Value<String> workoutDays = const Value.absent(),
                Value<int> preferredHour = const Value.absent(),
                Value<int> preferredMinute = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> scheduleMode = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<DateTime?> intervalStartDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                difficultyIndex: difficultyIndex,
                trainingFocusIndex: trainingFocusIndex,
                heightCm: heightCm,
                weightKg: weightKg,
                workoutDaysPerWeek: workoutDaysPerWeek,
                workoutDays: workoutDays,
                preferredHour: preferredHour,
                preferredMinute: preferredMinute,
                notificationsEnabled: notificationsEnabled,
                onboardingComplete: onboardingComplete,
                scheduleMode: scheduleMode,
                intervalDays: intervalDays,
                intervalStartDate: intervalStartDate,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> difficultyIndex = const Value.absent(),
                Value<int> trainingFocusIndex = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int> workoutDaysPerWeek = const Value.absent(),
                Value<String> workoutDays = const Value.absent(),
                Value<int> preferredHour = const Value.absent(),
                Value<int> preferredMinute = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> scheduleMode = const Value.absent(),
                Value<int> intervalDays = const Value.absent(),
                Value<DateTime?> intervalStartDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                difficultyIndex: difficultyIndex,
                trainingFocusIndex: trainingFocusIndex,
                heightCm: heightCm,
                weightKg: weightKg,
                workoutDaysPerWeek: workoutDaysPerWeek,
                workoutDays: workoutDays,
                preferredHour: preferredHour,
                preferredMinute: preferredMinute,
                notificationsEnabled: notificationsEnabled,
                onboardingComplete: onboardingComplete,
                scheduleMode: scheduleMode,
                intervalDays: intervalDays,
                intervalStartDate: intervalStartDate,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userEquipmentRefs = false,
                userFocusBodypartsRefs = false,
                workoutPlansRefs = false,
                workoutSessionsRefs = false,
                bodyMeasurementsRefs = false,
                streaksRefs = false,
                xpLogRefs = false,
                userBadgesRefs = false,
                notificationWindowsRefs = false,
                notificationLogRefs = false,
                exercisePreferencesRefs = false,
                userLeaguesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userEquipmentRefs) db.userEquipment,
                    if (userFocusBodypartsRefs) db.userFocusBodyparts,
                    if (workoutPlansRefs) db.workoutPlans,
                    if (workoutSessionsRefs) db.workoutSessions,
                    if (bodyMeasurementsRefs) db.bodyMeasurements,
                    if (streaksRefs) db.streaks,
                    if (xpLogRefs) db.xpLog,
                    if (userBadgesRefs) db.userBadges,
                    if (notificationWindowsRefs) db.notificationWindows,
                    if (notificationLogRefs) db.notificationLog,
                    if (exercisePreferencesRefs) db.exercisePreferences,
                    if (userLeaguesRefs) db.userLeagues,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userEquipmentRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserEquipmentData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userEquipmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userEquipmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userFocusBodypartsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserFocusBodypart
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userFocusBodypartsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userFocusBodypartsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutPlansRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          WorkoutPlan
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._workoutPlansRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutPlansRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutSessionsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          WorkoutSession
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._workoutSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (bodyMeasurementsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          BodyMeasurement
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._bodyMeasurementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).bodyMeasurementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (streaksRefs)
                        await $_getPrefetchedData<User, $UsersTable, Streak>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._streaksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).streaksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (xpLogRefs)
                        await $_getPrefetchedData<User, $UsersTable, XpLogData>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._xpLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).xpLogRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userBadgesRefs)
                        await $_getPrefetchedData<User, $UsersTable, UserBadge>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userBadgesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userBadgesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificationWindowsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          NotificationWindow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._notificationWindowsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationWindowsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificationLogRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          NotificationLogData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._notificationLogRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationLogRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exercisePreferencesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ExercisePreference
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._exercisePreferencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePreferencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userLeaguesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserLeague
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userLeaguesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userLeaguesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool userEquipmentRefs,
        bool userFocusBodypartsRefs,
        bool workoutPlansRefs,
        bool workoutSessionsRefs,
        bool bodyMeasurementsRefs,
        bool streaksRefs,
        bool xpLogRefs,
        bool userBadgesRefs,
        bool notificationWindowsRefs,
        bool notificationLogRefs,
        bool exercisePreferencesRefs,
        bool userLeaguesRefs,
      })
    >;
typedef $$UserEquipmentTableCreateCompanionBuilder =
    UserEquipmentCompanion Function({
      Value<int> id,
      required int userId,
      required int equipmentIndex,
    });
typedef $$UserEquipmentTableUpdateCompanionBuilder =
    UserEquipmentCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> equipmentIndex,
    });

final class $$UserEquipmentTableReferences
    extends
        BaseReferences<_$AppDatabase, $UserEquipmentTable, UserEquipmentData> {
  $$UserEquipmentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userEquipment.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserEquipmentTableFilterComposer
    extends Composer<_$AppDatabase, $UserEquipmentTable> {
  $$UserEquipmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserEquipmentTableOrderingComposer
    extends Composer<_$AppDatabase, $UserEquipmentTable> {
  $$UserEquipmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserEquipmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserEquipmentTable> {
  $$UserEquipmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserEquipmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserEquipmentTable,
          UserEquipmentData,
          $$UserEquipmentTableFilterComposer,
          $$UserEquipmentTableOrderingComposer,
          $$UserEquipmentTableAnnotationComposer,
          $$UserEquipmentTableCreateCompanionBuilder,
          $$UserEquipmentTableUpdateCompanionBuilder,
          (UserEquipmentData, $$UserEquipmentTableReferences),
          UserEquipmentData,
          PrefetchHooks Function({bool userId})
        > {
  $$UserEquipmentTableTableManager(_$AppDatabase db, $UserEquipmentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserEquipmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserEquipmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserEquipmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> equipmentIndex = const Value.absent(),
              }) => UserEquipmentCompanion(
                id: id,
                userId: userId,
                equipmentIndex: equipmentIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int equipmentIndex,
              }) => UserEquipmentCompanion.insert(
                id: id,
                userId: userId,
                equipmentIndex: equipmentIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserEquipmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$UserEquipmentTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$UserEquipmentTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserEquipmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserEquipmentTable,
      UserEquipmentData,
      $$UserEquipmentTableFilterComposer,
      $$UserEquipmentTableOrderingComposer,
      $$UserEquipmentTableAnnotationComposer,
      $$UserEquipmentTableCreateCompanionBuilder,
      $$UserEquipmentTableUpdateCompanionBuilder,
      (UserEquipmentData, $$UserEquipmentTableReferences),
      UserEquipmentData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$UserFocusBodypartsTableCreateCompanionBuilder =
    UserFocusBodypartsCompanion Function({
      Value<int> id,
      required int userId,
      required int bodyPartIndex,
    });
typedef $$UserFocusBodypartsTableUpdateCompanionBuilder =
    UserFocusBodypartsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> bodyPartIndex,
    });

final class $$UserFocusBodypartsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UserFocusBodypartsTable,
          UserFocusBodypart
        > {
  $$UserFocusBodypartsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userFocusBodyparts.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserFocusBodypartsTableFilterComposer
    extends Composer<_$AppDatabase, $UserFocusBodypartsTable> {
  $$UserFocusBodypartsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFocusBodypartsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserFocusBodypartsTable> {
  $$UserFocusBodypartsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFocusBodypartsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserFocusBodypartsTable> {
  $$UserFocusBodypartsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserFocusBodypartsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserFocusBodypartsTable,
          UserFocusBodypart,
          $$UserFocusBodypartsTableFilterComposer,
          $$UserFocusBodypartsTableOrderingComposer,
          $$UserFocusBodypartsTableAnnotationComposer,
          $$UserFocusBodypartsTableCreateCompanionBuilder,
          $$UserFocusBodypartsTableUpdateCompanionBuilder,
          (UserFocusBodypart, $$UserFocusBodypartsTableReferences),
          UserFocusBodypart,
          PrefetchHooks Function({bool userId})
        > {
  $$UserFocusBodypartsTableTableManager(
    _$AppDatabase db,
    $UserFocusBodypartsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserFocusBodypartsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserFocusBodypartsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserFocusBodypartsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> bodyPartIndex = const Value.absent(),
              }) => UserFocusBodypartsCompanion(
                id: id,
                userId: userId,
                bodyPartIndex: bodyPartIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int bodyPartIndex,
              }) => UserFocusBodypartsCompanion.insert(
                id: id,
                userId: userId,
                bodyPartIndex: bodyPartIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserFocusBodypartsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$UserFocusBodypartsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$UserFocusBodypartsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserFocusBodypartsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserFocusBodypartsTable,
      UserFocusBodypart,
      $$UserFocusBodypartsTableFilterComposer,
      $$UserFocusBodypartsTableOrderingComposer,
      $$UserFocusBodypartsTableAnnotationComposer,
      $$UserFocusBodypartsTableCreateCompanionBuilder,
      $$UserFocusBodypartsTableUpdateCompanionBuilder,
      (UserFocusBodypart, $$UserFocusBodypartsTableReferences),
      UserFocusBodypart,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      Value<int> id,
      required String name,
      Value<String> description,
      Value<String> instructions,
      required int bodyPartIndex,
      required int equipmentIndex,
      required int difficultyIndex,
      required int muscleActionIndex,
      Value<int> defaultSets,
      Value<int> defaultReps,
      Value<int?> defaultDurationSecs,
      Value<String?> imageAsset,
      Value<String> defaultTempo,
      Value<int?> secondaryEquipmentIndex,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> instructions,
      Value<int> bodyPartIndex,
      Value<int> equipmentIndex,
      Value<int> difficultyIndex,
      Value<int> muscleActionIndex,
      Value<int> defaultSets,
      Value<int> defaultReps,
      Value<int?> defaultDurationSecs,
      Value<String?> imageAsset,
      Value<String> defaultTempo,
      Value<int?> secondaryEquipmentIndex,
    });

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlanDayExercisesTable, List<PlanDayExercise>>
  _planDayExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.planDayExercises,
    aliasName: $_aliasNameGenerator(
      db.exercises.id,
      db.planDayExercises.exerciseId,
    ),
  );

  $$PlanDayExercisesTableProcessedTableManager get planDayExercisesRefs {
    final manager = $$PlanDayExercisesTableTableManager(
      $_db,
      $_db.planDayExercises,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _planDayExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SessionSetsTable, List<SessionSet>>
  _sessionSetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sessionSets,
    aliasName: $_aliasNameGenerator(db.exercises.id, db.sessionSets.exerciseId),
  );

  $$SessionSetsTableProcessedTableManager get sessionSetsRefs {
    final manager = $$SessionSetsTableTableManager(
      $_db,
      $_db.sessionSets,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExercisePreferencesTable,
    List<ExercisePreference>
  >
  _exercisePreferencesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exercisePreferences,
        aliasName: $_aliasNameGenerator(
          db.exercises.id,
          db.exercisePreferences.exerciseId,
        ),
      );

  $$ExercisePreferencesTableProcessedTableManager get exercisePreferencesRefs {
    final manager = $$ExercisePreferencesTableTableManager(
      $_db,
      $_db.exercisePreferences,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exercisePreferencesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get muscleActionIndex => $composableBuilder(
    column: $table.muscleActionIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultSets => $composableBuilder(
    column: $table.defaultSets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultReps => $composableBuilder(
    column: $table.defaultReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultDurationSecs => $composableBuilder(
    column: $table.defaultDurationSecs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultTempo => $composableBuilder(
    column: $table.defaultTempo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get secondaryEquipmentIndex => $composableBuilder(
    column: $table.secondaryEquipmentIndex,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> planDayExercisesRefs(
    Expression<bool> Function($$PlanDayExercisesTableFilterComposer f) f,
  ) {
    final $$PlanDayExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDayExercises,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDayExercisesTableFilterComposer(
            $db: $db,
            $table: $db.planDayExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sessionSetsRefs(
    Expression<bool> Function($$SessionSetsTableFilterComposer f) f,
  ) {
    final $$SessionSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionSets,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionSetsTableFilterComposer(
            $db: $db,
            $table: $db.sessionSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exercisePreferencesRefs(
    Expression<bool> Function($$ExercisePreferencesTableFilterComposer f) f,
  ) {
    final $$ExercisePreferencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercisePreferences,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisePreferencesTableFilterComposer(
            $db: $db,
            $table: $db.exercisePreferences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get muscleActionIndex => $composableBuilder(
    column: $table.muscleActionIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultSets => $composableBuilder(
    column: $table.defaultSets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultReps => $composableBuilder(
    column: $table.defaultReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultDurationSecs => $composableBuilder(
    column: $table.defaultDurationSecs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultTempo => $composableBuilder(
    column: $table.defaultTempo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get secondaryEquipmentIndex => $composableBuilder(
    column: $table.secondaryEquipmentIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bodyPartIndex => $composableBuilder(
    column: $table.bodyPartIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get equipmentIndex => $composableBuilder(
    column: $table.equipmentIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get difficultyIndex => $composableBuilder(
    column: $table.difficultyIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get muscleActionIndex => $composableBuilder(
    column: $table.muscleActionIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultSets => $composableBuilder(
    column: $table.defaultSets,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultReps => $composableBuilder(
    column: $table.defaultReps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultDurationSecs => $composableBuilder(
    column: $table.defaultDurationSecs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultTempo => $composableBuilder(
    column: $table.defaultTempo,
    builder: (column) => column,
  );

  GeneratedColumn<int> get secondaryEquipmentIndex => $composableBuilder(
    column: $table.secondaryEquipmentIndex,
    builder: (column) => column,
  );

  Expression<T> planDayExercisesRefs<T extends Object>(
    Expression<T> Function($$PlanDayExercisesTableAnnotationComposer a) f,
  ) {
    final $$PlanDayExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDayExercises,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDayExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.planDayExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sessionSetsRefs<T extends Object>(
    Expression<T> Function($$SessionSetsTableAnnotationComposer a) f,
  ) {
    final $$SessionSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionSets,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessionSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> exercisePreferencesRefs<T extends Object>(
    Expression<T> Function($$ExercisePreferencesTableAnnotationComposer a) f,
  ) {
    final $$ExercisePreferencesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exercisePreferences,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExercisePreferencesTableAnnotationComposer(
                $db: $db,
                $table: $db.exercisePreferences,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, $$ExercisesTableReferences),
          Exercise,
          PrefetchHooks Function({
            bool planDayExercisesRefs,
            bool sessionSetsRefs,
            bool exercisePreferencesRefs,
          })
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<int> bodyPartIndex = const Value.absent(),
                Value<int> equipmentIndex = const Value.absent(),
                Value<int> difficultyIndex = const Value.absent(),
                Value<int> muscleActionIndex = const Value.absent(),
                Value<int> defaultSets = const Value.absent(),
                Value<int> defaultReps = const Value.absent(),
                Value<int?> defaultDurationSecs = const Value.absent(),
                Value<String?> imageAsset = const Value.absent(),
                Value<String> defaultTempo = const Value.absent(),
                Value<int?> secondaryEquipmentIndex = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                name: name,
                description: description,
                instructions: instructions,
                bodyPartIndex: bodyPartIndex,
                equipmentIndex: equipmentIndex,
                difficultyIndex: difficultyIndex,
                muscleActionIndex: muscleActionIndex,
                defaultSets: defaultSets,
                defaultReps: defaultReps,
                defaultDurationSecs: defaultDurationSecs,
                imageAsset: imageAsset,
                defaultTempo: defaultTempo,
                secondaryEquipmentIndex: secondaryEquipmentIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> description = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                required int bodyPartIndex,
                required int equipmentIndex,
                required int difficultyIndex,
                required int muscleActionIndex,
                Value<int> defaultSets = const Value.absent(),
                Value<int> defaultReps = const Value.absent(),
                Value<int?> defaultDurationSecs = const Value.absent(),
                Value<String?> imageAsset = const Value.absent(),
                Value<String> defaultTempo = const Value.absent(),
                Value<int?> secondaryEquipmentIndex = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                name: name,
                description: description,
                instructions: instructions,
                bodyPartIndex: bodyPartIndex,
                equipmentIndex: equipmentIndex,
                difficultyIndex: difficultyIndex,
                muscleActionIndex: muscleActionIndex,
                defaultSets: defaultSets,
                defaultReps: defaultReps,
                defaultDurationSecs: defaultDurationSecs,
                imageAsset: imageAsset,
                defaultTempo: defaultTempo,
                secondaryEquipmentIndex: secondaryEquipmentIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                planDayExercisesRefs = false,
                sessionSetsRefs = false,
                exercisePreferencesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (planDayExercisesRefs) db.planDayExercises,
                    if (sessionSetsRefs) db.sessionSets,
                    if (exercisePreferencesRefs) db.exercisePreferences,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (planDayExercisesRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          PlanDayExercise
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._planDayExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).planDayExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sessionSetsRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          SessionSet
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._sessionSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionSetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exercisePreferencesRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          ExercisePreference
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._exercisePreferencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisePreferencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, $$ExercisesTableReferences),
      Exercise,
      PrefetchHooks Function({
        bool planDayExercisesRefs,
        bool sessionSetsRefs,
        bool exercisePreferencesRefs,
      })
    >;
typedef $$WorkoutPlansTableCreateCompanionBuilder =
    WorkoutPlansCompanion Function({
      Value<int> id,
      required int userId,
      required String name,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$WorkoutPlansTableUpdateCompanionBuilder =
    WorkoutPlansCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$WorkoutPlansTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlan> {
  $$WorkoutPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.workoutPlans.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlanDaysTable, List<PlanDay>> _planDaysRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.planDays,
    aliasName: $_aliasNameGenerator(db.workoutPlans.id, db.planDays.planId),
  );

  $$PlanDaysTableProcessedTableManager get planDaysRefs {
    final manager = $$PlanDaysTableTableManager(
      $_db,
      $_db.planDays,
    ).filter((f) => f.planId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_planDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutPlansTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> planDaysRefs(
    Expression<bool> Function($$PlanDaysTableFilterComposer f) f,
  ) {
    final $$PlanDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.planId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableFilterComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> planDaysRefs<T extends Object>(
    Expression<T> Function($$PlanDaysTableAnnotationComposer a) f,
  ) {
    final $$PlanDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.planId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutPlansTable,
          WorkoutPlan,
          $$WorkoutPlansTableFilterComposer,
          $$WorkoutPlansTableOrderingComposer,
          $$WorkoutPlansTableAnnotationComposer,
          $$WorkoutPlansTableCreateCompanionBuilder,
          $$WorkoutPlansTableUpdateCompanionBuilder,
          (WorkoutPlan, $$WorkoutPlansTableReferences),
          WorkoutPlan,
          PrefetchHooks Function({bool userId, bool planDaysRefs})
        > {
  $$WorkoutPlansTableTableManager(_$AppDatabase db, $WorkoutPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => WorkoutPlansCompanion(
                id: id,
                userId: userId,
                name: name,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String name,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => WorkoutPlansCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, planDaysRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (planDaysRefs) db.planDays],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$WorkoutPlansTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$WorkoutPlansTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (planDaysRefs)
                    await $_getPrefetchedData<
                      WorkoutPlan,
                      $WorkoutPlansTable,
                      PlanDay
                    >(
                      currentTable: table,
                      referencedTable: $$WorkoutPlansTableReferences
                          ._planDaysRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkoutPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).planDaysRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.planId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutPlansTable,
      WorkoutPlan,
      $$WorkoutPlansTableFilterComposer,
      $$WorkoutPlansTableOrderingComposer,
      $$WorkoutPlansTableAnnotationComposer,
      $$WorkoutPlansTableCreateCompanionBuilder,
      $$WorkoutPlansTableUpdateCompanionBuilder,
      (WorkoutPlan, $$WorkoutPlansTableReferences),
      WorkoutPlan,
      PrefetchHooks Function({bool userId, bool planDaysRefs})
    >;
typedef $$PlanDaysTableCreateCompanionBuilder =
    PlanDaysCompanion Function({
      Value<int> id,
      required int planId,
      required int dayOfWeek,
      Value<String> label,
    });
typedef $$PlanDaysTableUpdateCompanionBuilder =
    PlanDaysCompanion Function({
      Value<int> id,
      Value<int> planId,
      Value<int> dayOfWeek,
      Value<String> label,
    });

final class $$PlanDaysTableReferences
    extends BaseReferences<_$AppDatabase, $PlanDaysTable, PlanDay> {
  $$PlanDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _planIdTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias(
        $_aliasNameGenerator(db.planDays.planId, db.workoutPlans.id),
      );

  $$WorkoutPlansTableProcessedTableManager get planId {
    final $_column = $_itemColumn<int>('plan_id')!;

    final manager = $$WorkoutPlansTableTableManager(
      $_db,
      $_db.workoutPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlanDayExercisesTable, List<PlanDayExercise>>
  _planDayExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.planDayExercises,
    aliasName: $_aliasNameGenerator(
      db.planDays.id,
      db.planDayExercises.planDayId,
    ),
  );

  $$PlanDayExercisesTableProcessedTableManager get planDayExercisesRefs {
    final manager = $$PlanDayExercisesTableTableManager(
      $_db,
      $_db.planDayExercises,
    ).filter((f) => f.planDayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _planDayExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutSessionsTable, List<WorkoutSession>>
  _workoutSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSessions,
    aliasName: $_aliasNameGenerator(
      db.planDays.id,
      db.workoutSessions.planDayId,
    ),
  );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionsRefs {
    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.planDayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlanDaysTableFilterComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutPlansTableFilterComposer get planId {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableFilterComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> planDayExercisesRefs(
    Expression<bool> Function($$PlanDayExercisesTableFilterComposer f) f,
  ) {
    final $$PlanDayExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDayExercises,
      getReferencedColumn: (t) => t.planDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDayExercisesTableFilterComposer(
            $db: $db,
            $table: $db.planDayExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutSessionsRefs(
    Expression<bool> Function($$WorkoutSessionsTableFilterComposer f) f,
  ) {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.planDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlanDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutPlansTableOrderingComposer get planId {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableOrderingComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlanDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  $$WorkoutPlansTableAnnotationComposer get planId {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> planDayExercisesRefs<T extends Object>(
    Expression<T> Function($$PlanDayExercisesTableAnnotationComposer a) f,
  ) {
    final $$PlanDayExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.planDayExercises,
      getReferencedColumn: (t) => t.planDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDayExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.planDayExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutSessionsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSessionsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.planDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlanDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanDaysTable,
          PlanDay,
          $$PlanDaysTableFilterComposer,
          $$PlanDaysTableOrderingComposer,
          $$PlanDaysTableAnnotationComposer,
          $$PlanDaysTableCreateCompanionBuilder,
          $$PlanDaysTableUpdateCompanionBuilder,
          (PlanDay, $$PlanDaysTableReferences),
          PlanDay,
          PrefetchHooks Function({
            bool planId,
            bool planDayExercisesRefs,
            bool workoutSessionsRefs,
          })
        > {
  $$PlanDaysTableTableManager(_$AppDatabase db, $PlanDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> planId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<String> label = const Value.absent(),
              }) => PlanDaysCompanion(
                id: id,
                planId: planId,
                dayOfWeek: dayOfWeek,
                label: label,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int planId,
                required int dayOfWeek,
                Value<String> label = const Value.absent(),
              }) => PlanDaysCompanion.insert(
                id: id,
                planId: planId,
                dayOfWeek: dayOfWeek,
                label: label,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlanDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                planId = false,
                planDayExercisesRefs = false,
                workoutSessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (planDayExercisesRefs) db.planDayExercises,
                    if (workoutSessionsRefs) db.workoutSessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (planId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.planId,
                                    referencedTable: $$PlanDaysTableReferences
                                        ._planIdTable(db),
                                    referencedColumn: $$PlanDaysTableReferences
                                        ._planIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (planDayExercisesRefs)
                        await $_getPrefetchedData<
                          PlanDay,
                          $PlanDaysTable,
                          PlanDayExercise
                        >(
                          currentTable: table,
                          referencedTable: $$PlanDaysTableReferences
                              ._planDayExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlanDaysTableReferences(
                                db,
                                table,
                                p0,
                              ).planDayExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.planDayId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutSessionsRefs)
                        await $_getPrefetchedData<
                          PlanDay,
                          $PlanDaysTable,
                          WorkoutSession
                        >(
                          currentTable: table,
                          referencedTable: $$PlanDaysTableReferences
                              ._workoutSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlanDaysTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.planDayId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlanDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanDaysTable,
      PlanDay,
      $$PlanDaysTableFilterComposer,
      $$PlanDaysTableOrderingComposer,
      $$PlanDaysTableAnnotationComposer,
      $$PlanDaysTableCreateCompanionBuilder,
      $$PlanDaysTableUpdateCompanionBuilder,
      (PlanDay, $$PlanDaysTableReferences),
      PlanDay,
      PrefetchHooks Function({
        bool planId,
        bool planDayExercisesRefs,
        bool workoutSessionsRefs,
      })
    >;
typedef $$PlanDayExercisesTableCreateCompanionBuilder =
    PlanDayExercisesCompanion Function({
      Value<int> id,
      required int planDayId,
      required int exerciseId,
      required int orderIndex,
      Value<int> sets,
      Value<int> reps,
      Value<int?> durationSecs,
      Value<String?> tempo,
    });
typedef $$PlanDayExercisesTableUpdateCompanionBuilder =
    PlanDayExercisesCompanion Function({
      Value<int> id,
      Value<int> planDayId,
      Value<int> exerciseId,
      Value<int> orderIndex,
      Value<int> sets,
      Value<int> reps,
      Value<int?> durationSecs,
      Value<String?> tempo,
    });

final class $$PlanDayExercisesTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlanDayExercisesTable, PlanDayExercise> {
  $$PlanDayExercisesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlanDaysTable _planDayIdTable(_$AppDatabase db) =>
      db.planDays.createAlias(
        $_aliasNameGenerator(db.planDayExercises.planDayId, db.planDays.id),
      );

  $$PlanDaysTableProcessedTableManager get planDayId {
    final $_column = $_itemColumn<int>('plan_day_id')!;

    final manager = $$PlanDaysTableTableManager(
      $_db,
      $_db.planDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planDayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(db.planDayExercises.exerciseId, db.exercises.id),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<int>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlanDayExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $PlanDayExercisesTable> {
  $$PlanDayExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnFilters(column),
  );

  $$PlanDaysTableFilterComposer get planDayId {
    final $$PlanDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableFilterComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlanDayExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanDayExercisesTable> {
  $$PlanDayExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tempo => $composableBuilder(
    column: $table.tempo,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlanDaysTableOrderingComposer get planDayId {
    final $$PlanDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableOrderingComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlanDayExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanDayExercisesTable> {
  $$PlanDayExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tempo =>
      $composableBuilder(column: $table.tempo, builder: (column) => column);

  $$PlanDaysTableAnnotationComposer get planDayId {
    final $$PlanDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlanDayExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanDayExercisesTable,
          PlanDayExercise,
          $$PlanDayExercisesTableFilterComposer,
          $$PlanDayExercisesTableOrderingComposer,
          $$PlanDayExercisesTableAnnotationComposer,
          $$PlanDayExercisesTableCreateCompanionBuilder,
          $$PlanDayExercisesTableUpdateCompanionBuilder,
          (PlanDayExercise, $$PlanDayExercisesTableReferences),
          PlanDayExercise,
          PrefetchHooks Function({bool planDayId, bool exerciseId})
        > {
  $$PlanDayExercisesTableTableManager(
    _$AppDatabase db,
    $PlanDayExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanDayExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanDayExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanDayExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> planDayId = const Value.absent(),
                Value<int> exerciseId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> sets = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int?> durationSecs = const Value.absent(),
                Value<String?> tempo = const Value.absent(),
              }) => PlanDayExercisesCompanion(
                id: id,
                planDayId: planDayId,
                exerciseId: exerciseId,
                orderIndex: orderIndex,
                sets: sets,
                reps: reps,
                durationSecs: durationSecs,
                tempo: tempo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int planDayId,
                required int exerciseId,
                required int orderIndex,
                Value<int> sets = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int?> durationSecs = const Value.absent(),
                Value<String?> tempo = const Value.absent(),
              }) => PlanDayExercisesCompanion.insert(
                id: id,
                planDayId: planDayId,
                exerciseId: exerciseId,
                orderIndex: orderIndex,
                sets: sets,
                reps: reps,
                durationSecs: durationSecs,
                tempo: tempo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlanDayExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({planDayId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (planDayId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.planDayId,
                                referencedTable:
                                    $$PlanDayExercisesTableReferences
                                        ._planDayIdTable(db),
                                referencedColumn:
                                    $$PlanDayExercisesTableReferences
                                        ._planDayIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (exerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseId,
                                referencedTable:
                                    $$PlanDayExercisesTableReferences
                                        ._exerciseIdTable(db),
                                referencedColumn:
                                    $$PlanDayExercisesTableReferences
                                        ._exerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlanDayExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanDayExercisesTable,
      PlanDayExercise,
      $$PlanDayExercisesTableFilterComposer,
      $$PlanDayExercisesTableOrderingComposer,
      $$PlanDayExercisesTableAnnotationComposer,
      $$PlanDayExercisesTableCreateCompanionBuilder,
      $$PlanDayExercisesTableUpdateCompanionBuilder,
      (PlanDayExercise, $$PlanDayExercisesTableReferences),
      PlanDayExercise,
      PrefetchHooks Function({bool planDayId, bool exerciseId})
    >;
typedef $$WorkoutSessionsTableCreateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<int> id,
      required int userId,
      Value<int?> planDayId,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      Value<int> totalXpEarned,
      Value<bool> allSetsCompleted,
    });
typedef $$WorkoutSessionsTableUpdateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int?> planDayId,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<int> totalXpEarned,
      Value<bool> allSetsCompleted,
    });

final class $$WorkoutSessionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession> {
  $$WorkoutSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.workoutSessions.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlanDaysTable _planDayIdTable(_$AppDatabase db) =>
      db.planDays.createAlias(
        $_aliasNameGenerator(db.workoutSessions.planDayId, db.planDays.id),
      );

  $$PlanDaysTableProcessedTableManager? get planDayId {
    final $_column = $_itemColumn<int>('plan_day_id');
    if ($_column == null) return null;
    final manager = $$PlanDaysTableTableManager(
      $_db,
      $_db.planDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planDayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SessionSetsTable, List<SessionSet>>
  _sessionSetsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sessionSets,
    aliasName: $_aliasNameGenerator(
      db.workoutSessions.id,
      db.sessionSets.sessionId,
    ),
  );

  $$SessionSetsTableProcessedTableManager get sessionSetsRefs {
    final manager = $$SessionSetsTableTableManager(
      $_db,
      $_db.sessionSets,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalXpEarned => $composableBuilder(
    column: $table.totalXpEarned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allSetsCompleted => $composableBuilder(
    column: $table.allSetsCompleted,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlanDaysTableFilterComposer get planDayId {
    final $$PlanDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableFilterComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionSetsRefs(
    Expression<bool> Function($$SessionSetsTableFilterComposer f) f,
  ) {
    final $$SessionSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionSets,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionSetsTableFilterComposer(
            $db: $db,
            $table: $db.sessionSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalXpEarned => $composableBuilder(
    column: $table.totalXpEarned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allSetsCompleted => $composableBuilder(
    column: $table.allSetsCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlanDaysTableOrderingComposer get planDayId {
    final $$PlanDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableOrderingComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalXpEarned => $composableBuilder(
    column: $table.totalXpEarned,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get allSetsCompleted => $composableBuilder(
    column: $table.allSetsCompleted,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlanDaysTableAnnotationComposer get planDayId {
    final $$PlanDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.planDayId,
      referencedTable: $db.planDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlanDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.planDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionSetsRefs<T extends Object>(
    Expression<T> Function($$SessionSetsTableAnnotationComposer a) f,
  ) {
    final $$SessionSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionSets,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessionSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTable,
          WorkoutSession,
          $$WorkoutSessionsTableFilterComposer,
          $$WorkoutSessionsTableOrderingComposer,
          $$WorkoutSessionsTableAnnotationComposer,
          $$WorkoutSessionsTableCreateCompanionBuilder,
          $$WorkoutSessionsTableUpdateCompanionBuilder,
          (WorkoutSession, $$WorkoutSessionsTableReferences),
          WorkoutSession,
          PrefetchHooks Function({
            bool userId,
            bool planDayId,
            bool sessionSetsRefs,
          })
        > {
  $$WorkoutSessionsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int?> planDayId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> totalXpEarned = const Value.absent(),
                Value<bool> allSetsCompleted = const Value.absent(),
              }) => WorkoutSessionsCompanion(
                id: id,
                userId: userId,
                planDayId: planDayId,
                startedAt: startedAt,
                completedAt: completedAt,
                totalXpEarned: totalXpEarned,
                allSetsCompleted: allSetsCompleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                Value<int?> planDayId = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> totalXpEarned = const Value.absent(),
                Value<bool> allSetsCompleted = const Value.absent(),
              }) => WorkoutSessionsCompanion.insert(
                id: id,
                userId: userId,
                planDayId: planDayId,
                startedAt: startedAt,
                completedAt: completedAt,
                totalXpEarned: totalXpEarned,
                allSetsCompleted: allSetsCompleted,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userId = false, planDayId = false, sessionSetsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionSetsRefs) db.sessionSets,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$WorkoutSessionsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$WorkoutSessionsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (planDayId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.planDayId,
                                    referencedTable:
                                        $$WorkoutSessionsTableReferences
                                            ._planDayIdTable(db),
                                    referencedColumn:
                                        $$WorkoutSessionsTableReferences
                                            ._planDayIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionSetsRefs)
                        await $_getPrefetchedData<
                          WorkoutSession,
                          $WorkoutSessionsTable,
                          SessionSet
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutSessionsTableReferences
                              ._sessionSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutSessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionSetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTable,
      WorkoutSession,
      $$WorkoutSessionsTableFilterComposer,
      $$WorkoutSessionsTableOrderingComposer,
      $$WorkoutSessionsTableAnnotationComposer,
      $$WorkoutSessionsTableCreateCompanionBuilder,
      $$WorkoutSessionsTableUpdateCompanionBuilder,
      (WorkoutSession, $$WorkoutSessionsTableReferences),
      WorkoutSession,
      PrefetchHooks Function({
        bool userId,
        bool planDayId,
        bool sessionSetsRefs,
      })
    >;
typedef $$SessionSetsTableCreateCompanionBuilder =
    SessionSetsCompanion Function({
      Value<int> id,
      required int sessionId,
      required int exerciseId,
      required int setNumber,
      Value<int?> repsCompleted,
      Value<double?> weightUsed,
      Value<int?> durationSecs,
      Value<bool> completed,
    });
typedef $$SessionSetsTableUpdateCompanionBuilder =
    SessionSetsCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<int> exerciseId,
      Value<int> setNumber,
      Value<int?> repsCompleted,
      Value<double?> weightUsed,
      Value<int?> durationSecs,
      Value<bool> completed,
    });

final class $$SessionSetsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionSetsTable, SessionSet> {
  $$SessionSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutSessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.workoutSessions.createAlias(
        $_aliasNameGenerator(db.sessionSets.sessionId, db.workoutSessions.id),
      );

  $$WorkoutSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(db.sessionSets.exerciseId, db.exercises.id),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<int>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SessionSetsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionSetsTable> {
  $$SessionSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repsCompleted => $composableBuilder(
    column: $table.repsCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightUsed => $composableBuilder(
    column: $table.weightUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutSessionsTableFilterComposer get sessionId {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionSetsTable> {
  $$SessionSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repsCompleted => $composableBuilder(
    column: $table.repsCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightUsed => $composableBuilder(
    column: $table.weightUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutSessionsTableOrderingComposer get sessionId {
    final $$WorkoutSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionSetsTable> {
  $$SessionSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get repsCompleted => $composableBuilder(
    column: $table.repsCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightUsed => $composableBuilder(
    column: $table.weightUsed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSecs => $composableBuilder(
    column: $table.durationSecs,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  $$WorkoutSessionsTableAnnotationComposer get sessionId {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionSetsTable,
          SessionSet,
          $$SessionSetsTableFilterComposer,
          $$SessionSetsTableOrderingComposer,
          $$SessionSetsTableAnnotationComposer,
          $$SessionSetsTableCreateCompanionBuilder,
          $$SessionSetsTableUpdateCompanionBuilder,
          (SessionSet, $$SessionSetsTableReferences),
          SessionSet,
          PrefetchHooks Function({bool sessionId, bool exerciseId})
        > {
  $$SessionSetsTableTableManager(_$AppDatabase db, $SessionSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<int> exerciseId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int?> repsCompleted = const Value.absent(),
                Value<double?> weightUsed = const Value.absent(),
                Value<int?> durationSecs = const Value.absent(),
                Value<bool> completed = const Value.absent(),
              }) => SessionSetsCompanion(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                setNumber: setNumber,
                repsCompleted: repsCompleted,
                weightUsed: weightUsed,
                durationSecs: durationSecs,
                completed: completed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                required int exerciseId,
                required int setNumber,
                Value<int?> repsCompleted = const Value.absent(),
                Value<double?> weightUsed = const Value.absent(),
                Value<int?> durationSecs = const Value.absent(),
                Value<bool> completed = const Value.absent(),
              }) => SessionSetsCompanion.insert(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                setNumber: setNumber,
                repsCompleted: repsCompleted,
                weightUsed: weightUsed,
                durationSecs: durationSecs,
                completed: completed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable: $$SessionSetsTableReferences
                                    ._sessionIdTable(db),
                                referencedColumn: $$SessionSetsTableReferences
                                    ._sessionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (exerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseId,
                                referencedTable: $$SessionSetsTableReferences
                                    ._exerciseIdTable(db),
                                referencedColumn: $$SessionSetsTableReferences
                                    ._exerciseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SessionSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionSetsTable,
      SessionSet,
      $$SessionSetsTableFilterComposer,
      $$SessionSetsTableOrderingComposer,
      $$SessionSetsTableAnnotationComposer,
      $$SessionSetsTableCreateCompanionBuilder,
      $$SessionSetsTableUpdateCompanionBuilder,
      (SessionSet, $$SessionSetsTableReferences),
      SessionSet,
      PrefetchHooks Function({bool sessionId, bool exerciseId})
    >;
typedef $$BodyMeasurementsTableCreateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<int> id,
      required int userId,
      Value<DateTime> measuredAt,
      Value<double?> weightKg,
      Value<double?> heightCm,
      Value<double?> bmi,
      Value<double?> chestCm,
      Value<double?> waistCm,
      Value<double?> hipsCm,
      Value<double?> bicepsCm,
      Value<double?> thighsCm,
      Value<double?> calvesCm,
      Value<double?> neckCm,
      Value<double?> forearmCm,
    });
typedef $$BodyMeasurementsTableUpdateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<DateTime> measuredAt,
      Value<double?> weightKg,
      Value<double?> heightCm,
      Value<double?> bmi,
      Value<double?> chestCm,
      Value<double?> waistCm,
      Value<double?> hipsCm,
      Value<double?> bicepsCm,
      Value<double?> thighsCm,
      Value<double?> calvesCm,
      Value<double?> neckCm,
      Value<double?> forearmCm,
    });

final class $$BodyMeasurementsTableReferences
    extends
        BaseReferences<_$AppDatabase, $BodyMeasurementsTable, BodyMeasurement> {
  $$BodyMeasurementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.bodyMeasurements.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BodyMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get chestCm => $composableBuilder(
    column: $table.chestCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waistCm => $composableBuilder(
    column: $table.waistCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hipsCm => $composableBuilder(
    column: $table.hipsCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bicepsCm => $composableBuilder(
    column: $table.bicepsCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get thighsCm => $composableBuilder(
    column: $table.thighsCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calvesCm => $composableBuilder(
    column: $table.calvesCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get neckCm => $composableBuilder(
    column: $table.neckCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get forearmCm => $composableBuilder(
    column: $table.forearmCm,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BodyMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get chestCm => $composableBuilder(
    column: $table.chestCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waistCm => $composableBuilder(
    column: $table.waistCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hipsCm => $composableBuilder(
    column: $table.hipsCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bicepsCm => $composableBuilder(
    column: $table.bicepsCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get thighsCm => $composableBuilder(
    column: $table.thighsCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calvesCm => $composableBuilder(
    column: $table.calvesCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get neckCm => $composableBuilder(
    column: $table.neckCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get forearmCm => $composableBuilder(
    column: $table.forearmCm,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BodyMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get bmi =>
      $composableBuilder(column: $table.bmi, builder: (column) => column);

  GeneratedColumn<double> get chestCm =>
      $composableBuilder(column: $table.chestCm, builder: (column) => column);

  GeneratedColumn<double> get waistCm =>
      $composableBuilder(column: $table.waistCm, builder: (column) => column);

  GeneratedColumn<double> get hipsCm =>
      $composableBuilder(column: $table.hipsCm, builder: (column) => column);

  GeneratedColumn<double> get bicepsCm =>
      $composableBuilder(column: $table.bicepsCm, builder: (column) => column);

  GeneratedColumn<double> get thighsCm =>
      $composableBuilder(column: $table.thighsCm, builder: (column) => column);

  GeneratedColumn<double> get calvesCm =>
      $composableBuilder(column: $table.calvesCm, builder: (column) => column);

  GeneratedColumn<double> get neckCm =>
      $composableBuilder(column: $table.neckCm, builder: (column) => column);

  GeneratedColumn<double> get forearmCm =>
      $composableBuilder(column: $table.forearmCm, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BodyMeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyMeasurementsTable,
          BodyMeasurement,
          $$BodyMeasurementsTableFilterComposer,
          $$BodyMeasurementsTableOrderingComposer,
          $$BodyMeasurementsTableAnnotationComposer,
          $$BodyMeasurementsTableCreateCompanionBuilder,
          $$BodyMeasurementsTableUpdateCompanionBuilder,
          (BodyMeasurement, $$BodyMeasurementsTableReferences),
          BodyMeasurement,
          PrefetchHooks Function({bool userId})
        > {
  $$BodyMeasurementsTableTableManager(
    _$AppDatabase db,
    $BodyMeasurementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime> measuredAt = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<double?> chestCm = const Value.absent(),
                Value<double?> waistCm = const Value.absent(),
                Value<double?> hipsCm = const Value.absent(),
                Value<double?> bicepsCm = const Value.absent(),
                Value<double?> thighsCm = const Value.absent(),
                Value<double?> calvesCm = const Value.absent(),
                Value<double?> neckCm = const Value.absent(),
                Value<double?> forearmCm = const Value.absent(),
              }) => BodyMeasurementsCompanion(
                id: id,
                userId: userId,
                measuredAt: measuredAt,
                weightKg: weightKg,
                heightCm: heightCm,
                bmi: bmi,
                chestCm: chestCm,
                waistCm: waistCm,
                hipsCm: hipsCm,
                bicepsCm: bicepsCm,
                thighsCm: thighsCm,
                calvesCm: calvesCm,
                neckCm: neckCm,
                forearmCm: forearmCm,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                Value<DateTime> measuredAt = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<double?> chestCm = const Value.absent(),
                Value<double?> waistCm = const Value.absent(),
                Value<double?> hipsCm = const Value.absent(),
                Value<double?> bicepsCm = const Value.absent(),
                Value<double?> thighsCm = const Value.absent(),
                Value<double?> calvesCm = const Value.absent(),
                Value<double?> neckCm = const Value.absent(),
                Value<double?> forearmCm = const Value.absent(),
              }) => BodyMeasurementsCompanion.insert(
                id: id,
                userId: userId,
                measuredAt: measuredAt,
                weightKg: weightKg,
                heightCm: heightCm,
                bmi: bmi,
                chestCm: chestCm,
                waistCm: waistCm,
                hipsCm: hipsCm,
                bicepsCm: bicepsCm,
                thighsCm: thighsCm,
                calvesCm: calvesCm,
                neckCm: neckCm,
                forearmCm: forearmCm,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BodyMeasurementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$BodyMeasurementsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$BodyMeasurementsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BodyMeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyMeasurementsTable,
      BodyMeasurement,
      $$BodyMeasurementsTableFilterComposer,
      $$BodyMeasurementsTableOrderingComposer,
      $$BodyMeasurementsTableAnnotationComposer,
      $$BodyMeasurementsTableCreateCompanionBuilder,
      $$BodyMeasurementsTableUpdateCompanionBuilder,
      (BodyMeasurement, $$BodyMeasurementsTableReferences),
      BodyMeasurement,
      PrefetchHooks Function({bool userId})
    >;
typedef $$StreaksTableCreateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> id,
      required int userId,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastWorkoutDate,
    });
typedef $$StreaksTableUpdateCompanionBuilder =
    StreaksCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastWorkoutDate,
    });

final class $$StreaksTableReferences
    extends BaseReferences<_$AppDatabase, $StreaksTable, Streak> {
  $$StreaksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.streaks.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StreaksTableFilterComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastWorkoutDate => $composableBuilder(
    column: $table.lastWorkoutDate,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StreaksTableOrderingComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastWorkoutDate => $composableBuilder(
    column: $table.lastWorkoutDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StreaksTableAnnotationComposer
    extends Composer<_$AppDatabase, $StreaksTable> {
  $$StreaksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastWorkoutDate => $composableBuilder(
    column: $table.lastWorkoutDate,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StreaksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StreaksTable,
          Streak,
          $$StreaksTableFilterComposer,
          $$StreaksTableOrderingComposer,
          $$StreaksTableAnnotationComposer,
          $$StreaksTableCreateCompanionBuilder,
          $$StreaksTableUpdateCompanionBuilder,
          (Streak, $$StreaksTableReferences),
          Streak,
          PrefetchHooks Function({bool userId})
        > {
  $$StreaksTableTableManager(_$AppDatabase db, $StreaksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StreaksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StreaksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StreaksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastWorkoutDate = const Value.absent(),
              }) => StreaksCompanion(
                id: id,
                userId: userId,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastWorkoutDate: lastWorkoutDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastWorkoutDate = const Value.absent(),
              }) => StreaksCompanion.insert(
                id: id,
                userId: userId,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastWorkoutDate: lastWorkoutDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StreaksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$StreaksTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$StreaksTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StreaksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StreaksTable,
      Streak,
      $$StreaksTableFilterComposer,
      $$StreaksTableOrderingComposer,
      $$StreaksTableAnnotationComposer,
      $$StreaksTableCreateCompanionBuilder,
      $$StreaksTableUpdateCompanionBuilder,
      (Streak, $$StreaksTableReferences),
      Streak,
      PrefetchHooks Function({bool userId})
    >;
typedef $$XpLogTableCreateCompanionBuilder =
    XpLogCompanion Function({
      Value<int> id,
      required int userId,
      required int amount,
      required String reason,
      Value<DateTime> earnedAt,
    });
typedef $$XpLogTableUpdateCompanionBuilder =
    XpLogCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> amount,
      Value<String> reason,
      Value<DateTime> earnedAt,
    });

final class $$XpLogTableReferences
    extends BaseReferences<_$AppDatabase, $XpLogTable, XpLogData> {
  $$XpLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.xpLog.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$XpLogTableFilterComposer extends Composer<_$AppDatabase, $XpLogTable> {
  $$XpLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpLogTableOrderingComposer
    extends Composer<_$AppDatabase, $XpLogTable> {
  $$XpLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $XpLogTable> {
  $$XpLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get earnedAt =>
      $composableBuilder(column: $table.earnedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$XpLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $XpLogTable,
          XpLogData,
          $$XpLogTableFilterComposer,
          $$XpLogTableOrderingComposer,
          $$XpLogTableAnnotationComposer,
          $$XpLogTableCreateCompanionBuilder,
          $$XpLogTableUpdateCompanionBuilder,
          (XpLogData, $$XpLogTableReferences),
          XpLogData,
          PrefetchHooks Function({bool userId})
        > {
  $$XpLogTableTableManager(_$AppDatabase db, $XpLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XpLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XpLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XpLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<DateTime> earnedAt = const Value.absent(),
              }) => XpLogCompanion(
                id: id,
                userId: userId,
                amount: amount,
                reason: reason,
                earnedAt: earnedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int amount,
                required String reason,
                Value<DateTime> earnedAt = const Value.absent(),
              }) => XpLogCompanion.insert(
                id: id,
                userId: userId,
                amount: amount,
                reason: reason,
                earnedAt: earnedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$XpLogTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$XpLogTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$XpLogTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$XpLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $XpLogTable,
      XpLogData,
      $$XpLogTableFilterComposer,
      $$XpLogTableOrderingComposer,
      $$XpLogTableAnnotationComposer,
      $$XpLogTableCreateCompanionBuilder,
      $$XpLogTableUpdateCompanionBuilder,
      (XpLogData, $$XpLogTableReferences),
      XpLogData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$BadgesTableCreateCompanionBuilder =
    BadgesCompanion Function({
      Value<int> id,
      required String key,
      required String name,
      required String description,
      Value<String> iconAsset,
      required String category,
    });
typedef $$BadgesTableUpdateCompanionBuilder =
    BadgesCompanion Function({
      Value<int> id,
      Value<String> key,
      Value<String> name,
      Value<String> description,
      Value<String> iconAsset,
      Value<String> category,
    });

final class $$BadgesTableReferences
    extends BaseReferences<_$AppDatabase, $BadgesTable, Badge> {
  $$BadgesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserBadgesTable, List<UserBadge>>
  _userBadgesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userBadges,
    aliasName: $_aliasNameGenerator(db.badges.id, db.userBadges.badgeId),
  );

  $$UserBadgesTableProcessedTableManager get userBadgesRefs {
    final manager = $$UserBadgesTableTableManager(
      $_db,
      $_db.userBadges,
    ).filter((f) => f.badgeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userBadgesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BadgesTableFilterComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconAsset => $composableBuilder(
    column: $table.iconAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userBadgesRefs(
    Expression<bool> Function($$UserBadgesTableFilterComposer f) f,
  ) {
    final $$UserBadgesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userBadges,
      getReferencedColumn: (t) => t.badgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserBadgesTableFilterComposer(
            $db: $db,
            $table: $db.userBadges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BadgesTableOrderingComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconAsset => $composableBuilder(
    column: $table.iconAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BadgesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BadgesTable> {
  $$BadgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconAsset =>
      $composableBuilder(column: $table.iconAsset, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> userBadgesRefs<T extends Object>(
    Expression<T> Function($$UserBadgesTableAnnotationComposer a) f,
  ) {
    final $$UserBadgesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userBadges,
      getReferencedColumn: (t) => t.badgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserBadgesTableAnnotationComposer(
            $db: $db,
            $table: $db.userBadges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BadgesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BadgesTable,
          Badge,
          $$BadgesTableFilterComposer,
          $$BadgesTableOrderingComposer,
          $$BadgesTableAnnotationComposer,
          $$BadgesTableCreateCompanionBuilder,
          $$BadgesTableUpdateCompanionBuilder,
          (Badge, $$BadgesTableReferences),
          Badge,
          PrefetchHooks Function({bool userBadgesRefs})
        > {
  $$BadgesTableTableManager(_$AppDatabase db, $BadgesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BadgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BadgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BadgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconAsset = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => BadgesCompanion(
                id: id,
                key: key,
                name: name,
                description: description,
                iconAsset: iconAsset,
                category: category,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String key,
                required String name,
                required String description,
                Value<String> iconAsset = const Value.absent(),
                required String category,
              }) => BadgesCompanion.insert(
                id: id,
                key: key,
                name: name,
                description: description,
                iconAsset: iconAsset,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BadgesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userBadgesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (userBadgesRefs) db.userBadges],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userBadgesRefs)
                    await $_getPrefetchedData<Badge, $BadgesTable, UserBadge>(
                      currentTable: table,
                      referencedTable: $$BadgesTableReferences
                          ._userBadgesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BadgesTableReferences(db, table, p0).userBadgesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.badgeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BadgesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BadgesTable,
      Badge,
      $$BadgesTableFilterComposer,
      $$BadgesTableOrderingComposer,
      $$BadgesTableAnnotationComposer,
      $$BadgesTableCreateCompanionBuilder,
      $$BadgesTableUpdateCompanionBuilder,
      (Badge, $$BadgesTableReferences),
      Badge,
      PrefetchHooks Function({bool userBadgesRefs})
    >;
typedef $$UserBadgesTableCreateCompanionBuilder =
    UserBadgesCompanion Function({
      Value<int> id,
      required int userId,
      required int badgeId,
      Value<DateTime> earnedAt,
    });
typedef $$UserBadgesTableUpdateCompanionBuilder =
    UserBadgesCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> badgeId,
      Value<DateTime> earnedAt,
    });

final class $$UserBadgesTableReferences
    extends BaseReferences<_$AppDatabase, $UserBadgesTable, UserBadge> {
  $$UserBadgesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userBadges.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BadgesTable _badgeIdTable(_$AppDatabase db) => db.badges.createAlias(
    $_aliasNameGenerator(db.userBadges.badgeId, db.badges.id),
  );

  $$BadgesTableProcessedTableManager get badgeId {
    final $_column = $_itemColumn<int>('badge_id')!;

    final manager = $$BadgesTableTableManager(
      $_db,
      $_db.badges,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_badgeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserBadgesTableFilterComposer
    extends Composer<_$AppDatabase, $UserBadgesTable> {
  $$UserBadgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BadgesTableFilterComposer get badgeId {
    final $$BadgesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.badgeId,
      referencedTable: $db.badges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BadgesTableFilterComposer(
            $db: $db,
            $table: $db.badges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserBadgesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserBadgesTable> {
  $$UserBadgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BadgesTableOrderingComposer get badgeId {
    final $$BadgesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.badgeId,
      referencedTable: $db.badges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BadgesTableOrderingComposer(
            $db: $db,
            $table: $db.badges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserBadgesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserBadgesTable> {
  $$UserBadgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get earnedAt =>
      $composableBuilder(column: $table.earnedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BadgesTableAnnotationComposer get badgeId {
    final $$BadgesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.badgeId,
      referencedTable: $db.badges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BadgesTableAnnotationComposer(
            $db: $db,
            $table: $db.badges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserBadgesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserBadgesTable,
          UserBadge,
          $$UserBadgesTableFilterComposer,
          $$UserBadgesTableOrderingComposer,
          $$UserBadgesTableAnnotationComposer,
          $$UserBadgesTableCreateCompanionBuilder,
          $$UserBadgesTableUpdateCompanionBuilder,
          (UserBadge, $$UserBadgesTableReferences),
          UserBadge,
          PrefetchHooks Function({bool userId, bool badgeId})
        > {
  $$UserBadgesTableTableManager(_$AppDatabase db, $UserBadgesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserBadgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserBadgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserBadgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> badgeId = const Value.absent(),
                Value<DateTime> earnedAt = const Value.absent(),
              }) => UserBadgesCompanion(
                id: id,
                userId: userId,
                badgeId: badgeId,
                earnedAt: earnedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int badgeId,
                Value<DateTime> earnedAt = const Value.absent(),
              }) => UserBadgesCompanion.insert(
                id: id,
                userId: userId,
                badgeId: badgeId,
                earnedAt: earnedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserBadgesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, badgeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$UserBadgesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$UserBadgesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (badgeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.badgeId,
                                referencedTable: $$UserBadgesTableReferences
                                    ._badgeIdTable(db),
                                referencedColumn: $$UserBadgesTableReferences
                                    ._badgeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserBadgesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserBadgesTable,
      UserBadge,
      $$UserBadgesTableFilterComposer,
      $$UserBadgesTableOrderingComposer,
      $$UserBadgesTableAnnotationComposer,
      $$UserBadgesTableCreateCompanionBuilder,
      $$UserBadgesTableUpdateCompanionBuilder,
      (UserBadge, $$UserBadgesTableReferences),
      UserBadge,
      PrefetchHooks Function({bool userId, bool badgeId})
    >;
typedef $$NotificationWindowsTableCreateCompanionBuilder =
    NotificationWindowsCompanion Function({
      Value<int> id,
      required int userId,
      required int startHour,
      required int startMinute,
      required int endHour,
      required int endMinute,
      required int orderIndex,
    });
typedef $$NotificationWindowsTableUpdateCompanionBuilder =
    NotificationWindowsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> startHour,
      Value<int> startMinute,
      Value<int> endHour,
      Value<int> endMinute,
      Value<int> orderIndex,
    });

final class $$NotificationWindowsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NotificationWindowsTable,
          NotificationWindow
        > {
  $$NotificationWindowsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.notificationWindows.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationWindowsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationWindowsTable> {
  $$NotificationWindowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startHour => $composableBuilder(
    column: $table.startHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endHour => $composableBuilder(
    column: $table.endHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationWindowsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationWindowsTable> {
  $$NotificationWindowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startHour => $composableBuilder(
    column: $table.startHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endHour => $composableBuilder(
    column: $table.endHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinute => $composableBuilder(
    column: $table.endMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationWindowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationWindowsTable> {
  $$NotificationWindowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startHour =>
      $composableBuilder(column: $table.startHour, builder: (column) => column);

  GeneratedColumn<int> get startMinute => $composableBuilder(
    column: $table.startMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endHour =>
      $composableBuilder(column: $table.endHour, builder: (column) => column);

  GeneratedColumn<int> get endMinute =>
      $composableBuilder(column: $table.endMinute, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationWindowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationWindowsTable,
          NotificationWindow,
          $$NotificationWindowsTableFilterComposer,
          $$NotificationWindowsTableOrderingComposer,
          $$NotificationWindowsTableAnnotationComposer,
          $$NotificationWindowsTableCreateCompanionBuilder,
          $$NotificationWindowsTableUpdateCompanionBuilder,
          (NotificationWindow, $$NotificationWindowsTableReferences),
          NotificationWindow,
          PrefetchHooks Function({bool userId})
        > {
  $$NotificationWindowsTableTableManager(
    _$AppDatabase db,
    $NotificationWindowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationWindowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationWindowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationWindowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> startHour = const Value.absent(),
                Value<int> startMinute = const Value.absent(),
                Value<int> endHour = const Value.absent(),
                Value<int> endMinute = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
              }) => NotificationWindowsCompanion(
                id: id,
                userId: userId,
                startHour: startHour,
                startMinute: startMinute,
                endHour: endHour,
                endMinute: endMinute,
                orderIndex: orderIndex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int startHour,
                required int startMinute,
                required int endHour,
                required int endMinute,
                required int orderIndex,
              }) => NotificationWindowsCompanion.insert(
                id: id,
                userId: userId,
                startHour: startHour,
                startMinute: startMinute,
                endHour: endHour,
                endMinute: endMinute,
                orderIndex: orderIndex,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationWindowsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$NotificationWindowsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$NotificationWindowsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificationWindowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationWindowsTable,
      NotificationWindow,
      $$NotificationWindowsTableFilterComposer,
      $$NotificationWindowsTableOrderingComposer,
      $$NotificationWindowsTableAnnotationComposer,
      $$NotificationWindowsTableCreateCompanionBuilder,
      $$NotificationWindowsTableUpdateCompanionBuilder,
      (NotificationWindow, $$NotificationWindowsTableReferences),
      NotificationWindow,
      PrefetchHooks Function({bool userId})
    >;
typedef $$NotificationLogTableCreateCompanionBuilder =
    NotificationLogCompanion Function({
      Value<int> id,
      required int userId,
      required int nagLevel,
      required String message,
      Value<DateTime> sentAt,
    });
typedef $$NotificationLogTableUpdateCompanionBuilder =
    NotificationLogCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> nagLevel,
      Value<String> message,
      Value<DateTime> sentAt,
    });

final class $$NotificationLogTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NotificationLogTable,
          NotificationLogData
        > {
  $$NotificationLogTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.notificationLog.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationLogTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationLogTable> {
  $$NotificationLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nagLevel => $composableBuilder(
    column: $table.nagLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationLogTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationLogTable> {
  $$NotificationLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nagLevel => $composableBuilder(
    column: $table.nagLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sentAt => $composableBuilder(
    column: $table.sentAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationLogTable> {
  $$NotificationLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nagLevel =>
      $composableBuilder(column: $table.nagLevel, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get sentAt =>
      $composableBuilder(column: $table.sentAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationLogTable,
          NotificationLogData,
          $$NotificationLogTableFilterComposer,
          $$NotificationLogTableOrderingComposer,
          $$NotificationLogTableAnnotationComposer,
          $$NotificationLogTableCreateCompanionBuilder,
          $$NotificationLogTableUpdateCompanionBuilder,
          (NotificationLogData, $$NotificationLogTableReferences),
          NotificationLogData,
          PrefetchHooks Function({bool userId})
        > {
  $$NotificationLogTableTableManager(
    _$AppDatabase db,
    $NotificationLogTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> nagLevel = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<DateTime> sentAt = const Value.absent(),
              }) => NotificationLogCompanion(
                id: id,
                userId: userId,
                nagLevel: nagLevel,
                message: message,
                sentAt: sentAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int nagLevel,
                required String message,
                Value<DateTime> sentAt = const Value.absent(),
              }) => NotificationLogCompanion.insert(
                id: id,
                userId: userId,
                nagLevel: nagLevel,
                message: message,
                sentAt: sentAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationLogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$NotificationLogTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$NotificationLogTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificationLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationLogTable,
      NotificationLogData,
      $$NotificationLogTableFilterComposer,
      $$NotificationLogTableOrderingComposer,
      $$NotificationLogTableAnnotationComposer,
      $$NotificationLogTableCreateCompanionBuilder,
      $$NotificationLogTableUpdateCompanionBuilder,
      (NotificationLogData, $$NotificationLogTableReferences),
      NotificationLogData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ExercisePreferencesTableCreateCompanionBuilder =
    ExercisePreferencesCompanion Function({
      Value<int> id,
      required int userId,
      required int exerciseId,
      Value<int> preference,
    });
typedef $$ExercisePreferencesTableUpdateCompanionBuilder =
    ExercisePreferencesCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> exerciseId,
      Value<int> preference,
    });

final class $$ExercisePreferencesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExercisePreferencesTable,
          ExercisePreference
        > {
  $$ExercisePreferencesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.exercisePreferences.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        $_aliasNameGenerator(
          db.exercisePreferences.exerciseId,
          db.exercises.id,
        ),
      );

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<int>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExercisePreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisePreferencesTable> {
  $$ExercisePreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preference => $composableBuilder(
    column: $table.preference,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisePreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisePreferencesTable> {
  $$ExercisePreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preference => $composableBuilder(
    column: $table.preference,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisePreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisePreferencesTable> {
  $$ExercisePreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get preference => $composableBuilder(
    column: $table.preference,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisePreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisePreferencesTable,
          ExercisePreference,
          $$ExercisePreferencesTableFilterComposer,
          $$ExercisePreferencesTableOrderingComposer,
          $$ExercisePreferencesTableAnnotationComposer,
          $$ExercisePreferencesTableCreateCompanionBuilder,
          $$ExercisePreferencesTableUpdateCompanionBuilder,
          (ExercisePreference, $$ExercisePreferencesTableReferences),
          ExercisePreference,
          PrefetchHooks Function({bool userId, bool exerciseId})
        > {
  $$ExercisePreferencesTableTableManager(
    _$AppDatabase db,
    $ExercisePreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisePreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisePreferencesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExercisePreferencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> exerciseId = const Value.absent(),
                Value<int> preference = const Value.absent(),
              }) => ExercisePreferencesCompanion(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                preference: preference,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int exerciseId,
                Value<int> preference = const Value.absent(),
              }) => ExercisePreferencesCompanion.insert(
                id: id,
                userId: userId,
                exerciseId: exerciseId,
                preference: preference,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisePreferencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$ExercisePreferencesTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$ExercisePreferencesTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (exerciseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseId,
                                referencedTable:
                                    $$ExercisePreferencesTableReferences
                                        ._exerciseIdTable(db),
                                referencedColumn:
                                    $$ExercisePreferencesTableReferences
                                        ._exerciseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExercisePreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisePreferencesTable,
      ExercisePreference,
      $$ExercisePreferencesTableFilterComposer,
      $$ExercisePreferencesTableOrderingComposer,
      $$ExercisePreferencesTableAnnotationComposer,
      $$ExercisePreferencesTableCreateCompanionBuilder,
      $$ExercisePreferencesTableUpdateCompanionBuilder,
      (ExercisePreference, $$ExercisePreferencesTableReferences),
      ExercisePreference,
      PrefetchHooks Function({bool userId, bool exerciseId})
    >;
typedef $$UserLeaguesTableCreateCompanionBuilder =
    UserLeaguesCompanion Function({
      Value<int> id,
      required int userId,
      Value<int> currentTier,
      Value<int> weeksAtCurrentTier,
      Value<int> weeksAboveNext,
      Value<int> weeksBelowCurrent,
      Value<DateTime?> lastCalculatedAt,
    });
typedef $$UserLeaguesTableUpdateCompanionBuilder =
    UserLeaguesCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> currentTier,
      Value<int> weeksAtCurrentTier,
      Value<int> weeksAboveNext,
      Value<int> weeksBelowCurrent,
      Value<DateTime?> lastCalculatedAt,
    });

final class $$UserLeaguesTableReferences
    extends BaseReferences<_$AppDatabase, $UserLeaguesTable, UserLeague> {
  $$UserLeaguesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userLeagues.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserLeaguesTableFilterComposer
    extends Composer<_$AppDatabase, $UserLeaguesTable> {
  $$UserLeaguesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentTier => $composableBuilder(
    column: $table.currentTier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeksAtCurrentTier => $composableBuilder(
    column: $table.weeksAtCurrentTier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeksAboveNext => $composableBuilder(
    column: $table.weeksAboveNext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeksBelowCurrent => $composableBuilder(
    column: $table.weeksBelowCurrent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCalculatedAt => $composableBuilder(
    column: $table.lastCalculatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLeaguesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserLeaguesTable> {
  $$UserLeaguesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentTier => $composableBuilder(
    column: $table.currentTier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeksAtCurrentTier => $composableBuilder(
    column: $table.weeksAtCurrentTier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeksAboveNext => $composableBuilder(
    column: $table.weeksAboveNext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeksBelowCurrent => $composableBuilder(
    column: $table.weeksBelowCurrent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCalculatedAt => $composableBuilder(
    column: $table.lastCalculatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLeaguesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserLeaguesTable> {
  $$UserLeaguesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get currentTier => $composableBuilder(
    column: $table.currentTier,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weeksAtCurrentTier => $composableBuilder(
    column: $table.weeksAtCurrentTier,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weeksAboveNext => $composableBuilder(
    column: $table.weeksAboveNext,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weeksBelowCurrent => $composableBuilder(
    column: $table.weeksBelowCurrent,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastCalculatedAt => $composableBuilder(
    column: $table.lastCalculatedAt,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLeaguesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserLeaguesTable,
          UserLeague,
          $$UserLeaguesTableFilterComposer,
          $$UserLeaguesTableOrderingComposer,
          $$UserLeaguesTableAnnotationComposer,
          $$UserLeaguesTableCreateCompanionBuilder,
          $$UserLeaguesTableUpdateCompanionBuilder,
          (UserLeague, $$UserLeaguesTableReferences),
          UserLeague,
          PrefetchHooks Function({bool userId})
        > {
  $$UserLeaguesTableTableManager(_$AppDatabase db, $UserLeaguesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserLeaguesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserLeaguesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserLeaguesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> currentTier = const Value.absent(),
                Value<int> weeksAtCurrentTier = const Value.absent(),
                Value<int> weeksAboveNext = const Value.absent(),
                Value<int> weeksBelowCurrent = const Value.absent(),
                Value<DateTime?> lastCalculatedAt = const Value.absent(),
              }) => UserLeaguesCompanion(
                id: id,
                userId: userId,
                currentTier: currentTier,
                weeksAtCurrentTier: weeksAtCurrentTier,
                weeksAboveNext: weeksAboveNext,
                weeksBelowCurrent: weeksBelowCurrent,
                lastCalculatedAt: lastCalculatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                Value<int> currentTier = const Value.absent(),
                Value<int> weeksAtCurrentTier = const Value.absent(),
                Value<int> weeksAboveNext = const Value.absent(),
                Value<int> weeksBelowCurrent = const Value.absent(),
                Value<DateTime?> lastCalculatedAt = const Value.absent(),
              }) => UserLeaguesCompanion.insert(
                id: id,
                userId: userId,
                currentTier: currentTier,
                weeksAtCurrentTier: weeksAtCurrentTier,
                weeksAboveNext: weeksAboveNext,
                weeksBelowCurrent: weeksBelowCurrent,
                lastCalculatedAt: lastCalculatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserLeaguesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$UserLeaguesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$UserLeaguesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserLeaguesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserLeaguesTable,
      UserLeague,
      $$UserLeaguesTableFilterComposer,
      $$UserLeaguesTableOrderingComposer,
      $$UserLeaguesTableAnnotationComposer,
      $$UserLeaguesTableCreateCompanionBuilder,
      $$UserLeaguesTableUpdateCompanionBuilder,
      (UserLeague, $$UserLeaguesTableReferences),
      UserLeague,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$UserEquipmentTableTableManager get userEquipment =>
      $$UserEquipmentTableTableManager(_db, _db.userEquipment);
  $$UserFocusBodypartsTableTableManager get userFocusBodyparts =>
      $$UserFocusBodypartsTableTableManager(_db, _db.userFocusBodyparts);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db, _db.workoutPlans);
  $$PlanDaysTableTableManager get planDays =>
      $$PlanDaysTableTableManager(_db, _db.planDays);
  $$PlanDayExercisesTableTableManager get planDayExercises =>
      $$PlanDayExercisesTableTableManager(_db, _db.planDayExercises);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$SessionSetsTableTableManager get sessionSets =>
      $$SessionSetsTableTableManager(_db, _db.sessionSets);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(_db, _db.bodyMeasurements);
  $$StreaksTableTableManager get streaks =>
      $$StreaksTableTableManager(_db, _db.streaks);
  $$XpLogTableTableManager get xpLog =>
      $$XpLogTableTableManager(_db, _db.xpLog);
  $$BadgesTableTableManager get badges =>
      $$BadgesTableTableManager(_db, _db.badges);
  $$UserBadgesTableTableManager get userBadges =>
      $$UserBadgesTableTableManager(_db, _db.userBadges);
  $$NotificationWindowsTableTableManager get notificationWindows =>
      $$NotificationWindowsTableTableManager(_db, _db.notificationWindows);
  $$NotificationLogTableTableManager get notificationLog =>
      $$NotificationLogTableTableManager(_db, _db.notificationLog);
  $$ExercisePreferencesTableTableManager get exercisePreferences =>
      $$ExercisePreferencesTableTableManager(_db, _db.exercisePreferences);
  $$UserLeaguesTableTableManager get userLeagues =>
      $$UserLeaguesTableTableManager(_db, _db.userLeagues);
}
