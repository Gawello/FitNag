/// Maps exercise names to image URL lists from free-exercise-db
/// (github.com/yuhonas/free-exercise-db) — Public Domain / Unlicense
///
/// Each exercise has 2 images: starting position (0.jpg) and end position (1.jpg).
const _base =
    'https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises';

List<String> _imgs(String id) => ['$_base/$id/0.jpg', '$_base/$id/1.jpg'];

final exerciseImageMap = <String, List<String>>{
  // ─── CHEST ───
  'Push-Up': _imgs('Pushups'),
  'Wide Push-Up': _imgs('Push-Up_Wide'),
  'Diamond Push-Up': _imgs('Push-Ups_-_Close_Triceps_Position'),
  'Dumbbell Bench Press': _imgs('Dumbbell_Bench_Press'),
  'Dumbbell Fly': _imgs('Dumbbell_Flyes'),
  'Barbell Bench Press': _imgs('Barbell_Bench_Press_-_Medium_Grip'),
  'Cable Crossover': _imgs('Cable_Crossover'),

  // ─── BACK ───
  'Superman': _imgs('Superman'),
  'Pull-Up': _imgs('Pullups'),
  'Dumbbell Row': _imgs('One-Arm_Dumbbell_Row'),
  'Barbell Bent-Over Row': _imgs('Bent_Over_Barbell_Row'),
  'Resistance Band Lat Pulldown': _imgs('Band_Pull_Apart'),

  // ─── SHOULDERS ───
  'Pike Push-Up': _imgs('Decline_Push-Up'),
  'Dumbbell Lateral Raise': _imgs('Alternating_Deltoid_Raise'),
  'Dumbbell Overhead Press': _imgs('Dumbbell_Shoulder_Press'),
  'Barbell Overhead Press': _imgs('Barbell_Shoulder_Press'),
  'Dumbbell Front Raise': _imgs('Front_Dumbbell_Raise'),
  'Face Pull': _imgs('Face_Pull'),

  // ─── BICEPS ───
  'Dumbbell Curl': _imgs('Dumbbell_Bicep_Curl'),
  'Barbell Curl': _imgs('Barbell_Curl'),
  'Hammer Curl': _imgs('Hammer_Curls'),
  'EZ Bar Curl': _imgs('EZ-Bar_Curl'),
  'Resistance Band Curl': _imgs('Concentration_Curls'),

  // ─── TRICEPS ───
  'Chair Dips': _imgs('Bench_Dips'),
  'Dumbbell Kickback': _imgs('Tricep_Dumbbell_Kickback'),
  'Overhead Tricep Extension':
      _imgs('Cable_Rope_Overhead_Triceps_Extension'),
  'Skull Crusher': _imgs('EZ-Bar_Skullcrusher'),
  'Dip Station Dips': _imgs('Dips_-_Triceps_Version'),

  // ─── ABS / CORE ───
  'Plank': _imgs('Plank'),
  'Crunch': _imgs('Crunches'),
  'Leg Raise': _imgs('Flat_Bench_Lying_Leg_Raise'),
  'Mountain Climber': _imgs('Mountain_Climbers'),
  'Russian Twist': _imgs('Russian_Twist'),
  'Dead Bug': _imgs('Dead_Bug'),
  'Ab Wheel Rollout': _imgs('Ab_Roller'),

  // ─── GLUTES ───
  'Glute Bridge': _imgs('Butt_Lift_Bridge'),
  'Hip Thrust': _imgs('Barbell_Hip_Thrust'),
  'Donkey Kick': _imgs('Glute_Kickback'),
  'Bulgarian Split Squat': _imgs('Barbell_Lunge'),

  // ─── QUADS ───
  'Bodyweight Squat': _imgs('Bodyweight_Squat'),
  'Goblet Squat': _imgs('Goblet_Squat'),
  'Lunge': _imgs('Dumbbell_Lunges'),
  'Wall Sit': _imgs('Chair_Squat'),
  'Barbell Back Squat': _imgs('Barbell_Squat'),
  'Leg Press': _imgs('Leg_Press'),

  // ─── HAMSTRINGS ───
  'Romanian Deadlift': _imgs('Romanian_Deadlift'),
  'Good Morning': _imgs('Good_Morning'),
  'Nordic Curl': _imgs('Natural_Glute_Ham_Raise'),

  // ─── CALVES ───
  'Standing Calf Raise': _imgs('Standing_Calf_Raises'),
  'Seated Calf Raise': _imgs('Seated_Calf_Raise'),

  // ─── FULL BODY / CARDIO ───
  'Jumping Jacks': _imgs('Freehand_Jump_Squat'),
  'Burpees': _imgs('Freehand_Jump_Squat'),
  'High Knees': _imgs('Double_Leg_Butt_Kick'),
  'Kettlebell Swing': _imgs('One-Arm_Kettlebell_Swings'),
};
