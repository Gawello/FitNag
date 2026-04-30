import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/notification_dao.dart';

final onboardingCompleteProvider = FutureProvider<bool>((ref) async {
  final db = AppDatabase.instance;
  final userDao = UserDao(db);
  final user = await userDao.getOrCreateUser();
  return user.onboardingComplete;
});

class TimeWindow {
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  const TimeWindow({
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
  });
}

class OnboardingState {
  final Difficulty difficulty;
  final TrainingFocus trainingFocus;
  final Set<Equipment> selectedEquipment;
  final Set<BodyPart> targetBodyParts;
  final List<int> workoutDays; // 1=Mon, 7=Sun
  final int preferredHour;
  final int preferredMinute;
  final List<TimeWindow> notificationWindows;
  final String name;
  final double? heightCm;
  final double? weightKg;
  final int currentStep;

  const OnboardingState({
    this.difficulty = Difficulty.beginner,
    this.trainingFocus = TrainingFocus.generalFitness,
    this.selectedEquipment = const {Equipment.bodyweightFloor},
    this.targetBodyParts = const {},
    this.workoutDays = const [1, 3, 5],
    this.preferredHour = 9,
    this.preferredMinute = 0,
    this.notificationWindows = const [TimeWindow(startHour: 9, startMinute: 0, endHour: 11, endMinute: 0)],
    this.name = '',
    this.heightCm,
    this.weightKg,
    this.currentStep = 0,
  });

  OnboardingState copyWith({
    Difficulty? difficulty,
    TrainingFocus? trainingFocus,
    Set<Equipment>? selectedEquipment,
    Set<BodyPart>? targetBodyParts,
    List<int>? workoutDays,
    int? preferredHour,
    int? preferredMinute,
    List<TimeWindow>? notificationWindows,
    String? name,
    double? heightCm,
    double? weightKg,
    int? currentStep,
  }) {
    return OnboardingState(
      difficulty: difficulty ?? this.difficulty,
      trainingFocus: trainingFocus ?? this.trainingFocus,
      selectedEquipment: selectedEquipment ?? this.selectedEquipment,
      targetBodyParts: targetBodyParts ?? this.targetBodyParts,
      workoutDays: workoutDays ?? this.workoutDays,
      preferredHour: preferredHour ?? this.preferredHour,
      preferredMinute: preferredMinute ?? this.preferredMinute,
      notificationWindows: notificationWindows ?? this.notificationWindows,
      name: name ?? this.name,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState());

  void setDifficulty(Difficulty d) => state = state.copyWith(difficulty: d);
  void setTrainingFocus(TrainingFocus f) => state = state.copyWith(trainingFocus: f);

  void toggleEquipment(Equipment e) {
    final set = Set<Equipment>.from(state.selectedEquipment);
    if (set.contains(e)) {
      if (e != Equipment.bodyweightFloor) set.remove(e);
    } else {
      set.add(e);
    }
    state = state.copyWith(selectedEquipment: set);
  }

  void toggleBodyPart(BodyPart bp) {
    final set = Set<BodyPart>.from(state.targetBodyParts);
    if (set.contains(bp)) {
      set.remove(bp);
    } else {
      set.add(bp);
    }
    state = state.copyWith(targetBodyParts: set);
  }

  void setWorkoutDays(List<int> days) => state = state.copyWith(workoutDays: days);
  void setPreferredTime(int hour, int minute) =>
      state = state.copyWith(preferredHour: hour, preferredMinute: minute);

  void addNotificationWindow(TimeWindow window) {
    if (state.notificationWindows.length >= 5) return;
    state = state.copyWith(
      notificationWindows: [...state.notificationWindows, window],
    );
  }

  void removeNotificationWindow(int index) {
    if (state.notificationWindows.length <= 1) return;
    final windows = List<TimeWindow>.from(state.notificationWindows);
    windows.removeAt(index);
    state = state.copyWith(notificationWindows: windows);
  }

  void updateNotificationWindow(int index, TimeWindow window) {
    final windows = List<TimeWindow>.from(state.notificationWindows);
    windows[index] = window;
    state = state.copyWith(notificationWindows: windows);
  }

  void setName(String name) => state = state.copyWith(name: name);
  void setHeight(double h) => state = state.copyWith(heightCm: h);
  void setWeight(double w) => state = state.copyWith(weightKg: w);
  void nextStep() => state = state.copyWith(currentStep: state.currentStep + 1);
  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  int get totalSteps {
    if (state.trainingFocus == TrainingFocus.specificBodyPart) return 7;
    return 6; // skip target body parts screen
  }

  Future<void> completeOnboarding() async {
    final db = AppDatabase.instance;
    final userDao = UserDao(db);
    final notificationDao = NotificationDao(db);
    final user = await userDao.getOrCreateUser();

    await userDao.updateUser(UsersCompanion(
      name: Value(state.name),
      difficultyIndex: Value(state.difficulty.index),
      trainingFocusIndex: Value(state.trainingFocus.index),
      heightCm: Value(state.heightCm),
      weightKg: Value(state.weightKg),
      workoutDaysPerWeek: Value(state.workoutDays.length),
      workoutDays: Value(state.workoutDays.join(',')),
      preferredHour: Value(state.preferredHour),
      preferredMinute: Value(state.preferredMinute),
      onboardingComplete: const Value(true),
    ));

    await userDao.setEquipment(
      user.id,
      state.selectedEquipment.map((e) => e.index).toList(),
    );

    if (state.trainingFocus == TrainingFocus.specificBodyPart) {
      await userDao.setFocusBodyparts(
        user.id,
        state.targetBodyParts.map((bp) => bp.index).toList(),
      );
    }

    // Save notification windows
    final windowCompanions = state.notificationWindows.asMap().entries.map((entry) {
      final i = entry.key;
      final w = entry.value;
      return NotificationWindowsCompanion.insert(
        userId: user.id,
        startHour: w.startHour,
        startMinute: w.startMinute,
        endHour: w.endHour,
        endMinute: w.endMinute,
        orderIndex: i,
      );
    }).toList();
    await notificationDao.replaceWindows(user.id, windowCompanions);
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(),
);
