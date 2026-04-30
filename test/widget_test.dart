import 'package:flutter_test/flutter_test.dart';

import 'package:fitnag/core/utils/bmi_calculator.dart';

void main() {
  group('BmiCalculator', () {
    test('calculates BMI correctly', () {
      // 70kg, 175cm -> BMI ≈ 22.86
      final bmi = BmiCalculator.calculate(70, 175);
      expect(bmi, closeTo(22.86, 0.01));
    });

    test('returns 0 for invalid input', () {
      expect(BmiCalculator.calculate(0, 175), 0);
      expect(BmiCalculator.calculate(70, 0), 0);
    });

    test('categorizes BMI correctly', () {
      expect(BmiCalculator.category(17), 'Underweight');
      expect(BmiCalculator.category(22), 'Normal');
      expect(BmiCalculator.category(27), 'Overweight');
      expect(BmiCalculator.category(32), 'Obese');
    });
  });
}
