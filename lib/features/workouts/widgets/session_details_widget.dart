import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';

class SessionDetailsWidget extends StatelessWidget {
  const SessionDetailsWidget({super.key, required this.details});
  final List<({SessionSet sessionSet, Exercise exercise})> details;

  @override
  Widget build(BuildContext context) {
    if (details.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('No exercise data recorded.'),
      );
    }

    // Group sets by exercise
    final Map<int, _ExerciseGroup> groups = {};
    final List<int> order = [];

    for (final item in details) {
      final exerciseId = item.exercise.id;
      if (!groups.containsKey(exerciseId)) {
        order.add(exerciseId);
        groups[exerciseId] = _ExerciseGroup(
          name: item.exercise.name,
          sets: [],
        );
      }
      groups[exerciseId]?.sets.add(item.sessionSet);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: order.map((exerciseId) {
          final group = groups[exerciseId];
          if (group == null) return const SizedBox.shrink();
          final completedSets = group.sets.where((s) => s.completed).length;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.fitness_center, size: 16, color: AppTheme.primaryOrange),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        group.name,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '$completedSets/${group.sets.length} sets',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: completedSets == group.sets.length
                            ? AppTheme.accentGreen
                            : AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ...group.sets.map((set) {
                  final reps = set.repsCompleted;
                  final weight = set.weightUsed;
                  return Padding(
                    padding: const EdgeInsets.only(left: 22, top: 2),
                    child: Row(
                      children: [
                        Icon(
                          set.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                          size: 14,
                          color: set.completed ? AppTheme.accentGreen : AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Set ${set.setNumber}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        if (set.completed) ...[
                          const SizedBox(width: 8),
                          Text(
                            '${reps ?? '-'} reps',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (weight != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              '@ ${weight % 1 == 0 ? weight.toInt() : weight}kg',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.primaryOrange,
                              ),
                            ),
                          ],
                        ] else
                          Text(
                            '  skipped',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ExerciseGroup {
  final String name;
  final List<SessionSet> sets;

  _ExerciseGroup({required this.name, required this.sets});
}
