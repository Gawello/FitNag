enum BodyPart {
  chest('Chest'),
  back('Back'),
  shoulders('Shoulders'),
  biceps('Biceps'),
  triceps('Triceps'),
  forearms('Forearms'),
  absCore('Abs & Core'),
  glutes('Glutes'),
  quads('Quads'),
  hamstrings('Hamstrings'),
  calves('Calves'),
  fullBody('Full Body');

  const BodyPart(this.label);
  final String label;
}

enum Equipment {
  bodyweightFloor('Bodyweight / Floor'),
  chair('Chair'),
  pullUpBar('Pull-Up Bar'),
  straightBarbell('Straight Barbell'),
  ezCurlBar('EZ Curl Bar'),
  dumbbells('Dumbbells'),
  kettlebells('Kettlebells'),
  medicineBall('Medicine Ball'),
  stabilityBall('Stability Ball'),
  resistanceBands('Resistance Bands'),
  stationaryBike('Stationary Bike'),
  treadmill('Treadmill'),
  cablesMachine('Cables / Machine'),
  smithMachine('Smith Machine'),
  legPressMachine('Leg Press Machine'),
  dipStation('Dip Station'),
  bench('Bench'),
  abWheel('Ab Wheel'),
  trx('TRX / Suspension'),
  foamRoller('Foam Roller');

  const Equipment(this.label);
  final String label;
}

enum Difficulty {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced');

  const Difficulty(this.label);
  final String label;
}

enum TrainingFocus {
  specificBodyPart('Specific Body Part'),
  mobilityImprovement('Mobility Improvement'),
  strengthBuilding('Strength Building'),
  generalFitness('General Fitness'),
  cardioConditioning('Cardio Conditioning'),
  flexibility('Flexibility');

  const TrainingFocus(this.label);
  final String label;
}

enum MuscleAction {
  push('Push'),
  pull('Pull'),
  isolation('Isolation'),
  compound('Compound'),
  isometric('Isometric'),
  cardio('Cardio');

  const MuscleAction(this.label);
  final String label;
}
