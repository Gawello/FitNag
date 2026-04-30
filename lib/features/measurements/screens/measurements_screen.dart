import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/bmi_calculator.dart';
import '../../../database/app_database.dart';
import '../providers/measurement_provider.dart';

class MeasurementsScreen extends ConsumerWidget {
  const MeasurementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurementsAsync = ref.watch(measurementsProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Body Measurements',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                ElevatedButton.icon(
                  onPressed: () => context.push('/measurements/add'),
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            measurementsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
              data: (measurements) {
                if (measurements.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          const Icon(Icons.straighten, size: 64, color: AppTheme.textSecondary),
                          const SizedBox(height: 16),
                          Text('No measurements yet',
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          const Text('Track your progress by logging measurements'),
                        ],
                      ),
                    ),
                  );
                }

                final latest = measurements.first;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BMI Card
                    if (latest.weightKg != null && latest.heightCm != null) ...[
                      _BmiCard(
                        bmi: BmiCalculator.calculate(latest.weightKg!, latest.heightCm!),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Weight chart
                    if (measurements.length >= 2)
                      _WeightChart(measurements: measurements),

                    const SizedBox(height: 16),

                    // Latest measurements
                    Text('Latest Measurements',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    _MeasurementCard(measurement: latest),

                    const SizedBox(height: 16),

                    // History
                    Text('History', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    ...measurements.map((m) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(DateFormat('MMM d, yyyy').format(m.measuredAt)),
                            subtitle: Text(
                              [
                                if (m.weightKg != null) '${m.weightKg}kg',
                                if (m.bmi != null) 'BMI: ${m.bmi!.toStringAsFixed(1)}',
                              ].join(' • '),
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BmiCard extends StatelessWidget {
  const _BmiCard({required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final category = BmiCalculator.category(bmi);
    final color = switch (category) {
      'Normal' => AppTheme.accentGreen,
      'Underweight' => AppTheme.accentYellow,
      _ => AppTheme.accentRed,
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withAlpha(50),
              child: Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BMI', style: Theme.of(context).textTheme.titleMedium),
                  Text(category, style: TextStyle(color: color, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeightChart extends StatelessWidget {
  const _WeightChart({required this.measurements});
  final List<BodyMeasurement> measurements;

  @override
  Widget build(BuildContext context) {
    final weightData = measurements
        .where((m) => m.weightKg != null)
        .toList()
        .reversed
        .toList();

    if (weightData.length < 2) return const SizedBox.shrink();

    final spots = weightData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.weightKg!);
    }).toList();

    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b) - 2;
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b) + 2;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weight Trend', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minY: minY,
                  maxY: maxY,
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: AppTheme.textSecondary.withAlpha(30),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: AppTheme.primaryOrange,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                          radius: 4,
                          color: AppTheme.primaryOrange,
                          strokeWidth: 0,
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppTheme.primaryOrange.withAlpha(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasurementCard extends StatelessWidget {
  const _MeasurementCard({required this.measurement});
  final BodyMeasurement measurement;

  @override
  Widget build(BuildContext context) {
    final items = <(String, String)>[
      if (measurement.weightKg != null) ('Weight', '${measurement.weightKg} kg'),
      if (measurement.heightCm != null) ('Height', '${measurement.heightCm} cm'),
      if (measurement.chestCm != null) ('Chest', '${measurement.chestCm} cm'),
      if (measurement.waistCm != null) ('Waist', '${measurement.waistCm} cm'),
      if (measurement.hipsCm != null) ('Hips', '${measurement.hipsCm} cm'),
      if (measurement.bicepsCm != null) ('Biceps', '${measurement.bicepsCm} cm'),
      if (measurement.thighsCm != null) ('Thighs', '${measurement.thighsCm} cm'),
      if (measurement.calvesCm != null) ('Calves', '${measurement.calvesCm} cm'),
      if (measurement.neckCm != null) ('Neck', '${measurement.neckCm} cm'),
      if (measurement.forearmCm != null) ('Forearm', '${measurement.forearmCm} cm'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.$1, style: Theme.of(context).textTheme.bodyMedium),
                Text(item.$2, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}
