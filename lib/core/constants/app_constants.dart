class AppConstants {
  AppConstants._();

  // XP Rewards
  static const int xpWorkoutBase = 50;
  static const int xpPerExercise = 5;
  static const int xpAllSetsBonus = 20;
  static const int xpStreakMultiplier = 2;
  static const int xpStreakCap = 50;
  static const int xpFirstWorkoutOfWeek = 15;
  static const int xpLogMeasurements = 10;
  static const int xpPersonalBest = 25;

  // Levels
  static const List<({int xp, String title})> levels = [
    (xp: 0, title: 'Couch Potato'),
    (xp: 100, title: 'First Steps'),
    (xp: 300, title: 'Getting There'),
    (xp: 600, title: 'Warming Up'),
    (xp: 1000, title: 'On a Roll'),
    (xp: 1500, title: 'Dedicated'),
    (xp: 2200, title: 'Beast Mode'),
    (xp: 3000, title: 'Iron Will'),
    (xp: 4000, title: 'Unstoppable'),
    (xp: 5500, title: 'FitNag Legend'),
  ];

  // Workout generation
  static const int exercisesPerDayBeginner = 5;
  static const int exercisesPerDayIntermediate = 6;
  static const int exercisesPerDayAdvanced = 8;

  // Nag escalation delays (in hours from preferred workout time)
  static const List<int> nagDelayHours = [0, 2, 4, 6, -2]; // -2 means 2h before midnight
}
