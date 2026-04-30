import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/bmi_calculator.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/measurement_dao.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/gamification_dao.dart';
import '../providers/measurement_provider.dart';

class AddMeasurementScreen extends ConsumerStatefulWidget {
  const AddMeasurementScreen({super.key});

  @override
  ConsumerState<AddMeasurementScreen> createState() => _AddMeasurementScreenState();
}

class _AddMeasurementScreenState extends ConsumerState<AddMeasurementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  bool _saving = false;

  static const _fields = [
    ('weight', 'Weight (kg)', Icons.monitor_weight),
    ('height', 'Height (cm)', Icons.height),
    ('chest', 'Chest (cm)', Icons.accessibility),
    ('waist', 'Waist (cm)', Icons.accessibility),
    ('hips', 'Hips (cm)', Icons.accessibility),
    ('biceps', 'Biceps (cm)', Icons.accessibility),
    ('thighs', 'Thighs (cm)', Icons.accessibility),
    ('calves', 'Calves (cm)', Icons.accessibility),
    ('neck', 'Neck (cm)', Icons.accessibility),
    ('forearm', 'Forearm (cm)', Icons.accessibility),
  ];

  @override
  void initState() {
    super.initState();
    for (final field in _fields) {
      _controllers[field.$1] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  double? _val(String key) => double.tryParse(_controllers[key]!.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Measurement')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Log your measurements',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Fill in at least weight or height. All other fields are optional.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ..._fields.map((field) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                controller: _controllers[field.$1],
                decoration: InputDecoration(
                  labelText: field.$2,
                  prefixIcon: Icon(field.$3),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            )),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                child: _saving
                    ? const SizedBox(
                        height: 20, width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save Measurement'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final weight = _val('weight');
    final height = _val('height');

    if (weight == null && height == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter at least weight or height')),
      );
      return;
    }

    setState(() => _saving = true);

    try {
      final db = AppDatabase.instance;
      final user = await UserDao(db).getOrCreateUser();
      final bmi = (weight != null && height != null)
          ? BmiCalculator.calculate(weight, height)
          : null;

      await MeasurementDao(db).addMeasurement(
        BodyMeasurementsCompanion.insert(
          userId: user.id,
          weightKg: Value(weight),
          heightCm: Value(height),
          bmi: Value(bmi),
          chestCm: Value(_val('chest')),
          waistCm: Value(_val('waist')),
          hipsCm: Value(_val('hips')),
          bicepsCm: Value(_val('biceps')),
          thighsCm: Value(_val('thighs')),
          calvesCm: Value(_val('calves')),
          neckCm: Value(_val('neck')),
          forearmCm: Value(_val('forearm')),
        ),
      );

      // Award XP for logging measurements
      await GamificationDao(db).addXp(
        user.id,
        AppConstants.xpLogMeasurements,
        'Logged body measurements',
      );

      if (mounted) {
        ref.invalidate(measurementsProvider);
        ref.invalidate(latestMeasurementProvider);
        context.pop();
      }
    } catch (e, st) {
      AppLogger.error(
        'Failed to save measurement',
        tag: 'AddMeasurementScreen',
        error: e,
        stackTrace: st,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
        setState(() => _saving = false);
      }
    }
  }
}
