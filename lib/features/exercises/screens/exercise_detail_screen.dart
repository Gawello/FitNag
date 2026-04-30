import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/tempo.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/exercise_dao.dart';
import '../../../database/daos/user_dao.dart';
import '../providers/exercise_provider.dart';
import '../widgets/exercise_image_widget.dart';

class ExerciseDetailScreen extends ConsumerWidget {
  const ExerciseDetailScreen({super.key, required this.exerciseId});
  final int exerciseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseAsync = ref.watch(exerciseByIdProvider(exerciseId));
    final prefAsync = ref.watch(exercisePreferenceProvider(exerciseId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Details'),
        actions: [
          prefAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (pref) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    pref == 1 ? Icons.favorite : Icons.favorite_border,
                    color: pref == 1 ? AppTheme.accentRed : null,
                  ),
                  tooltip: pref == 1 ? 'Remove from favorites' : 'Add to favorites',
                  onPressed: () => _togglePreference(context, ref, pref == 1 ? 0 : 1),
                ),
                IconButton(
                  icon: Icon(
                    pref == 2 ? Icons.block : Icons.block_outlined,
                    color: pref == 2 ? AppTheme.accentRed : null,
                  ),
                  tooltip: pref == 2 ? 'Remove from blacklist' : 'Blacklist',
                  onPressed: () => _togglePreference(context, ref, pref == 2 ? 0 : 2),
                ),
              ],
            ),
          ),
        ],
      ),
      body: exerciseAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (exercise) {
          if (exercise == null) {
            return const Center(child: Text('Exercise not found'));
          }
          final tempo = Tempo.parse(exercise.defaultTempo);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Exercise images (start + end position)
                ExerciseImageGallery(
                  exerciseName: exercise.name,
                  bodyPartIndex: exercise.bodyPartIndex,
                  height: 200,
                ),
                const SizedBox(height: 24),
                Text(exercise.name,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                if (exercise.description.isNotEmpty) ...[
                  Text(exercise.description,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                ],
                // Info chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _InfoChip(
                      icon: Icons.accessibility,
                      label: BodyPart.values[exercise.bodyPartIndex].label,
                    ),
                    _InfoChip(
                      icon: Icons.fitness_center,
                      label: Equipment.values[exercise.equipmentIndex].label,
                    ),
                    _InfoChip(
                      icon: Icons.speed,
                      label: Difficulty.values[exercise.difficultyIndex].label,
                    ),
                    _InfoChip(
                      icon: Icons.category,
                      label: MuscleAction.values[exercise.muscleActionIndex].label,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Default sets/reps
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatColumn(label: 'Sets', value: '${exercise.defaultSets}'),
                        if (exercise.defaultDurationSecs != null)
                          _StatColumn(
                            label: 'Duration',
                            value: '${exercise.defaultDurationSecs}s',
                          )
                        else
                          _StatColumn(label: 'Reps', value: '${exercise.defaultReps}'),
                      ],
                    ),
                  ),
                ),
                // Tempo info
                if (tempo.isApplicable) ...[
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 18, color: AppTheme.primaryOrange),
                              const SizedBox(width: 8),
                              Text('Tempo: ${tempo.display}',
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(tempo.phaseDescription,
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 4),
                          Text('${tempo.totalSeconds}s per rep',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                ],
                if (exercise.instructions.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text('Instructions',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(exercise.instructions,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => context.push(
                      '/workout/adhoc/${exercise.id}',
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start Workout with this Exercise'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _togglePreference(BuildContext context, WidgetRef ref, int newPref) async {
    final db = AppDatabase.instance;
    final user = await UserDao(db).getOrCreateUser();
    await ExerciseDao(db).setExercisePreference(user.id, exerciseId, newPref);
    ref.invalidate(exercisePreferencesProvider);
    ref.invalidate(exercisePreferenceProvider(exerciseId));
    if (context.mounted) {
      final message = switch (newPref) {
        1 => 'Added to favorites',
        2 => "Blacklisted — won't appear in plans",
        _ => 'Preference cleared',
      };
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.primaryOrange),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.headlineMedium),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
