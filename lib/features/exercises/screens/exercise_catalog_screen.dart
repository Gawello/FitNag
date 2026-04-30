import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/exercise_provider.dart';

class ExerciseCatalogScreen extends ConsumerWidget {
  const ExerciseCatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(filteredExercisesProvider);
    final filter = ref.watch(exerciseFilterProvider);
    final prefsAsync = ref.watch(exercisePreferencesProvider);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Exercise Catalog',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 12),
                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _FilterDropdown<BodyPart>(
                        label: 'Body Part',
                        value: filter.bodyPart,
                        items: BodyPart.values,
                        getName: (bp) => bp.label,
                        onChanged: (bp) => ref.read(exerciseFilterProvider.notifier).state =
                            bp != null
                                ? filter.copyWith(bodyPart: bp)
                                : filter.copyWith(clearBodyPart: true),
                      ),
                      const SizedBox(width: 8),
                      _FilterDropdown<Equipment>(
                        label: 'Equipment',
                        value: filter.equipment,
                        items: Equipment.values,
                        getName: (e) => e.label,
                        onChanged: (e) => ref.read(exerciseFilterProvider.notifier).state =
                            e != null
                                ? filter.copyWith(equipment: e)
                                : filter.copyWith(clearEquipment: true),
                      ),
                      const SizedBox(width: 8),
                      _FilterDropdown<Difficulty>(
                        label: 'Difficulty',
                        value: filter.difficulty,
                        items: Difficulty.values,
                        getName: (d) => d.label,
                        onChanged: (d) => ref.read(exerciseFilterProvider.notifier).state =
                            d != null
                                ? filter.copyWith(difficulty: d)
                                : filter.copyWith(clearDifficulty: true),
                      ),
                      const SizedBox(width: 8),
                      _PreferenceFilterChips(filter: filter, ref: ref),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: exercisesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (exercises) {
                if (exercises.isEmpty) {
                  return const Center(child: Text('No exercises match your filters'));
                }
                final prefs = prefsAsync.valueOrNull ?? {};
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    final pref = prefs[exercise.id] ?? 0;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: pref == 1
                            ? const Icon(Icons.favorite, color: AppTheme.accentRed, size: 20)
                            : pref == 2
                                ? const Icon(Icons.block, color: AppTheme.textSecondary, size: 20)
                                : null,
                        title: Text(exercise.name),
                        subtitle: Text(
                          '${BodyPart.values[exercise.bodyPartIndex].label} • '
                          '${Equipment.values[exercise.equipmentIndex].label}',
                        ),
                        trailing: _DifficultyDots(exercise.difficultyIndex),
                        onTap: () => context.push('/exercises/${exercise.id}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceFilterChips extends StatelessWidget {
  const _PreferenceFilterChips({required this.filter, required this.ref});
  final ExerciseFilter filter;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<PreferenceFilter>(
      segments: const [
        ButtonSegment(value: PreferenceFilter.all, label: Text('All')),
        ButtonSegment(value: PreferenceFilter.favorites, icon: Icon(Icons.favorite, size: 16)),
        ButtonSegment(value: PreferenceFilter.blacklisted, icon: Icon(Icons.block, size: 16)),
      ],
      selected: {filter.preferenceFilter},
      onSelectionChanged: (selected) {
        ref.read(exerciseFilterProvider.notifier).state =
            filter.copyWith(preferenceFilter: selected.first);
      },
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class _FilterDropdown<T> extends StatelessWidget {
  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.getName,
    required this.onChanged,
  });
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) getName;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: value != null ? AppTheme.primaryOrange.withAlpha(30) : AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: value != null ? AppTheme.primaryOrange : Colors.transparent,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T?>(
          value: value,
          hint: Text(label, style: const TextStyle(fontSize: 13)),
          isDense: true,
          items: [
            DropdownMenuItem<T?>(value: null, child: Text('All $label')),
            ...items.map((item) => DropdownMenuItem<T?>(
                  value: item,
                  child: Text(getName(item), style: const TextStyle(fontSize: 13)),
                )),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _DifficultyDots extends StatelessWidget {
  const _DifficultyDots(this.level);
  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Icon(
            Icons.circle,
            size: 8,
            color: i <= level ? AppTheme.primaryOrange : AppTheme.textSecondary.withAlpha(80),
          ),
        );
      }),
    );
  }
}
