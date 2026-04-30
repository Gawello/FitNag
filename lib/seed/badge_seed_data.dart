import '../database/app_database.dart';

class BadgeSeedData {
  BadgeSeedData._();

  static List<BadgesCompanion> get all => [
    // Streak badges
    _b('streak_3', 'Hot Start', 'Maintain a 3-day workout streak', 'streak'),
    _b('streak_7', 'Week Warrior', 'Maintain a 7-day workout streak', 'streak'),
    _b('streak_14', 'Fortnight Force', 'Maintain a 14-day workout streak', 'streak'),
    _b('streak_30', 'Monthly Machine', 'Maintain a 30-day workout streak', 'streak'),
    _b('streak_90', 'Quarter Beast', 'Maintain a 90-day workout streak', 'streak'),

    // Volume badges
    _b('workout_1', 'First Rep', 'Complete your first workout', 'volume'),
    _b('workout_10', 'Getting Serious', 'Complete 10 workouts', 'volume'),
    _b('workout_50', 'Half Century', 'Complete 50 workouts', 'volume'),
    _b('workout_100', 'Centurion', 'Complete 100 workouts', 'volume'),

    // Body part focus
    _b('chest_20', 'Chest Champion', 'Complete 20 chest workouts', 'bodypart'),
    _b('back_20', 'Back Boss', 'Complete 20 back workouts', 'bodypart'),
    _b('legs_20', 'Leg Legend', 'Complete 20 leg workouts', 'bodypart'),
    _b('arms_20', 'Arm Army', 'Complete 20 arm workouts', 'bodypart'),
    _b('core_20', 'Core Commander', 'Complete 20 core workouts', 'bodypart'),

    // Measurements
    _b('first_measurement', 'Measured Up', 'Log your first body measurement', 'measurement'),
    _b('measurement_4weeks', 'Tracking Pro', 'Log measurements for 4 consecutive weeks', 'measurement'),

    // Special
    _b('early_bird', 'Early Bird', 'Complete a workout before 7 AM', 'special'),
    _b('night_owl', 'Night Owl', 'Complete a workout after 9 PM', 'special'),
    _b('weekend_warrior', 'Weekend Warrior', 'Complete workouts on both Saturday and Sunday', 'special'),
    _b('perfect_week', 'Perfect Week', 'Complete all scheduled workouts in a week', 'special'),
  ];

  static BadgesCompanion _b(String key, String name, String description, String category) {
    return BadgesCompanion.insert(
      key: key,
      name: name,
      description: description,
      category: category,
    );
  }
}
