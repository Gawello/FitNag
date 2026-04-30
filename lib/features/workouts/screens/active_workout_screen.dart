import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/tempo.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/exercise_dao.dart';
import '../../exercises/widgets/exercise_image_widget.dart';
import '../providers/workout_provider.dart';
import '../services/tempo_metronome.dart';

class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  const ActiveWorkoutScreen({super.key, this.planDayId, this.adHocExerciseIds, this.resumeSessionId});
  final int? planDayId;
  final List<int>? adHocExerciseIds;
  final int? resumeSessionId;

  @override
  ConsumerState<ActiveWorkoutScreen> createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  bool _initialized = false;
  bool _metronomeRunning = false;
  TempoPhase _currentPhase = TempoPhase.eccentric;
  int _secondsRemaining = 0;
  int _repCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_initialized) {
        _initialized = true;
        if (widget.resumeSessionId != null) {
          await ref.read(activeWorkoutProvider.notifier).resumeSession(widget.resumeSessionId!);
        } else if (widget.adHocExerciseIds != null) {
          await ref.read(activeWorkoutProvider.notifier).initializeAdHoc(widget.adHocExerciseIds!);
        } else {
          await ref.read(activeWorkoutProvider.notifier).initialize(widget.planDayId);
        }
      }
    });
  }

  @override
  void dispose() {
    TempoMetronome.stop();
    TempoMetronome.onTick = null;
    super.dispose();
  }

  void _toggleMetronome(Tempo tempo) {
    if (_metronomeRunning) {
      TempoMetronome.stop();
      setState(() => _metronomeRunning = false);
    } else {
      TempoMetronome.onTick = (phase, seconds, rep) {
        if (mounted) {
          setState(() {
            _currentPhase = phase;
            _secondsRemaining = seconds;
            _repCount = rep;
          });
        }
      };
      TempoMetronome.start(tempo);
      setState(() => _metronomeRunning = true);
    }
  }

  void _stopMetronome() {
    if (_metronomeRunning) {
      TempoMetronome.stop();
      setState(() => _metronomeRunning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeWorkoutProvider);

    if (state.exerciseGroups.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Workout')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final currentGroup = state.exerciseGroups[state.currentExerciseIndex];
    final tempo = Tempo.parse(currentGroup.exercise.defaultTempo);

    return Scaffold(
      appBar: AppBar(
        title: Text('${state.currentExerciseIndex + 1}/${state.exerciseGroups.length}'),
        actions: [
          IconButton(
            onPressed: () => _showAddExerciseDialog(),
            icon: const Icon(Icons.add),
            tooltip: 'Add Exercise',
          ),
          IconButton(
            onPressed: () => _showMetronomeSettings(),
            icon: const Icon(Icons.music_note),
            tooltip: 'Sound Settings',
          ),
          TextButton(
            onPressed: () => _finishWorkout(),
            child: const Text('Finish'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: state.totalSets > 0 ? state.completedSets / state.totalSets : 0,
            backgroundColor: AppTheme.darkSurface,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentGreen),
          ),

          // Rest timer overlay
          if (state.isResting)
            Container(
              color: AppTheme.darkCharcoal.withAlpha(200),
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Rest', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 8),
                  Text(
                    '${state.restSecondsRemaining}s',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryOrange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => ref.read(activeWorkoutProvider.notifier).skipRest(),
                    child: const Text('Skip Rest'),
                  ),
                ],
              ),
            ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exercise image - full width
                  ExerciseImageGallery(
                    exerciseName: currentGroup.exercise.name,
                    bodyPartIndex: currentGroup.exercise.bodyPartIndex,
                    height: 200,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    currentGroup.exercise.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    currentGroup.exercise.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  // Tempo display + metronome control
                  if (tempo.isApplicable) ...[
                    const SizedBox(height: 12),
                    _TempoMetronomeBar(
                      tempo: tempo,
                      isRunning: _metronomeRunning,
                      currentPhase: _currentPhase,
                      secondsRemaining: _secondsRemaining,
                      repCount: _repCount,
                      onToggle: () => _toggleMetronome(tempo),
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Sets list
                  ...List.generate(currentGroup.sets.length, (i) {
                    final set = currentGroup.sets[i];
                    return _SetRow(
                      setNumber: set.setNumber,
                      targetReps: set.targetReps,
                      completed: set.completed,
                      repsCompleted: set.repsCompleted,
                      weightUsed: set.weightUsed,
                      onComplete: () => _completeSet(i, set),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Navigation
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  if (state.currentExerciseIndex > 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _stopMetronome();
                          ref.read(activeWorkoutProvider.notifier).previousExercise();
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                    ),
                  if (state.currentExerciseIndex > 0) const SizedBox(width: 12),
                  if (state.currentExerciseIndex < state.exerciseGroups.length - 1)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _stopMetronome();
                          ref.read(activeWorkoutProvider.notifier).nextExercise();
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                      ),
                    )
                  else
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _finishWorkout,
                        icon: const Icon(Icons.check),
                        label: const Text('Finish Workout'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _completeSet(int setIndex, SetData set) {
    _stopMetronome();
    showDialog(
      context: context,
      builder: (ctx) => _CompleteSetDialog(
        targetReps: set.targetReps,
        onComplete: (reps, weight) async {
          await ref.read(activeWorkoutProvider.notifier).completeSet(
            ref.read(activeWorkoutProvider).currentExerciseIndex,
            setIndex,
            reps: reps,
            weight: weight,
          );
          ref.read(activeWorkoutProvider.notifier).startRest();
          if (ctx.mounted) Navigator.pop(ctx);
        },
      ),
    );
  }

  Future<void> _showAddExerciseDialog() async {
    final db = AppDatabase.instance;
    final exercises = await ExerciseDao(db).getAllExercises();
    final currentIds = ref.read(activeWorkoutProvider).exerciseGroups
        .map((g) => g.exercise.id)
        .toSet();

    if (!mounted) return;

    final selected = await showDialog<Exercise>(
      context: context,
      builder: (ctx) => _AddExerciseDialog(
        exercises: exercises.where((e) => !currentIds.contains(e.id)).toList(),
      ),
    );

    if (selected != null) {
      await ref.read(activeWorkoutProvider.notifier).addExercise(selected);
    }
  }

  void _showMetronomeSettings() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => _MetronomeSettingsSheet(
        onChanged: () {
          if (mounted) setState(() {});
        },
      ),
    );
  }

  Future<void> _finishWorkout() async {
    _stopMetronome();
    await ref.read(activeWorkoutProvider.notifier).finishWorkout();
    if (mounted) {
      final sessionId = ref.read(activeWorkoutProvider).sessionId;
      context.go('/workout/summary/$sessionId');
    }
  }
}

// ─── Tempo Metronome Bar ───

class _TempoMetronomeBar extends StatelessWidget {
  const _TempoMetronomeBar({
    required this.tempo,
    required this.isRunning,
    required this.currentPhase,
    required this.secondsRemaining,
    required this.repCount,
    required this.onToggle,
  });

  final Tempo tempo;
  final bool isRunning;
  final TempoPhase currentPhase;
  final int secondsRemaining;
  final int repCount;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isRunning ? AppTheme.primaryOrange.withAlpha(25) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            // Play/Stop button
            IconButton(
              onPressed: onToggle,
              icon: Icon(
                isRunning ? Icons.stop_circle : Icons.play_circle,
                color: AppTheme.primaryOrange,
                size: 36,
              ),
              tooltip: isRunning ? 'Stop tempo' : 'Start tempo guide',
            ),
            const SizedBox(width: 8),

            if (isRunning) ...[
              // Phase indicators
              Expanded(
                child: Row(
                  children: [
                    _PhaseChip('DOWN', tempo.eccentric, currentPhase == TempoPhase.eccentric),
                    const SizedBox(width: 4),
                    _PhaseChip('HOLD', tempo.pause, currentPhase == TempoPhase.pause),
                    const SizedBox(width: 4),
                    _PhaseChip('UP', tempo.concentric, currentPhase == TempoPhase.concentric),
                    const SizedBox(width: 4),
                    _PhaseChip('TOP', tempo.top, currentPhase == TempoPhase.top),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Countdown + rep
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$secondsRemaining',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryOrange,
                    ),
                  ),
                  Text('Rep $repCount',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ] else ...[
              // Static tempo display
              const Icon(Icons.timer, size: 16, color: AppTheme.primaryOrange),
              const SizedBox(width: 4),
              Text('Tempo: ${tempo.display}',
                  style: const TextStyle(color: AppTheme.primaryOrange, fontSize: 14)),
              const SizedBox(width: 8),
              Expanded(
                child: Text('(${tempo.phaseDescription})',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PhaseChip extends StatelessWidget {
  const _PhaseChip(this.label, this.seconds, this.active);
  final String label;
  final int seconds;
  final bool active;

  @override
  Widget build(BuildContext context) {
    if (seconds == 0) return const SizedBox.shrink();
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: active ? AppTheme.primaryOrange : AppTheme.darkSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            color: active ? Colors.white : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ─── Metronome Settings Sheet ───

class _MetronomeSettingsSheet extends StatefulWidget {
  const _MetronomeSettingsSheet({required this.onChanged});
  final VoidCallback onChanged;

  @override
  State<_MetronomeSettingsSheet> createState() => _MetronomeSettingsSheetState();
}

class _MetronomeSettingsSheetState extends State<_MetronomeSettingsSheet> {
  late MetronomeSoundSet _selectedSet;
  late bool _vibration;

  @override
  void initState() {
    super.initState();
    _selectedSet = TempoMetronome.soundSet;
    _vibration = TempoMetronome.vibrationEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tempo Sound Settings',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            Text('Sound Type', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: MetronomeSoundSet.values.map((set) {
                return ChoiceChip(
                  label: Text(set.label),
                  selected: _selectedSet == set,
                  selectedColor: AppTheme.primaryOrange.withAlpha(60),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedSet = set);
                      TempoMetronome.setSoundSet(set);
                      widget.onChanged();
                    }
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Vibration'),
              subtitle: const Text('Vibrate on each beat'),
              value: _vibration,
              activeTrackColor: AppTheme.primaryOrange,
              contentPadding: EdgeInsets.zero,
              onChanged: (enabled) {
                setState(() => _vibration = enabled);
                TempoMetronome.setVibrationEnabled(enabled);
                widget.onChanged();
              },
            ),

            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Set Row ───

class _SetRow extends StatelessWidget {
  const _SetRow({
    required this.setNumber,
    required this.targetReps,
    required this.completed,
    this.repsCompleted,
    this.weightUsed,
    required this.onComplete,
  });
  final int setNumber;
  final int targetReps;
  final bool completed;
  final int? repsCompleted;
  final double? weightUsed;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: completed ? AppTheme.accentGreen.withAlpha(30) : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: completed ? AppTheme.accentGreen : AppTheme.darkSurface,
          child: completed
              ? const Icon(Icons.check, color: Colors.white, size: 20)
              : Text('$setNumber'),
        ),
        title: Text(completed
            ? '${repsCompleted ?? targetReps} reps${weightUsed != null ? ' @ ${weightUsed}kg' : ''}'
            : 'Set $setNumber - $targetReps reps'),
        trailing: completed
            ? null
            : ElevatedButton(
                onPressed: onComplete,
                child: const Text('Done'),
              ),
      ),
    );
  }
}

// ─── Complete Set Dialog ───

class _CompleteSetDialog extends StatefulWidget {
  const _CompleteSetDialog({
    required this.targetReps,
    required this.onComplete,
  });
  final int targetReps;
  final Future<void> Function(int reps, double? weight) onComplete;

  @override
  State<_CompleteSetDialog> createState() => _CompleteSetDialogState();
}

class _CompleteSetDialogState extends State<_CompleteSetDialog> {
  late int _reps;
  double? _weight;

  @override
  void initState() {
    super.initState();
    _reps = widget.targetReps;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log Set'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _reps > 0 ? () => setState(() => _reps--) : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$_reps reps',
                  style: Theme.of(context).textTheme.headlineMedium),
              IconButton(
                onPressed: () => setState(() => _reps++),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Weight (kg) - optional',
              prefixIcon: Icon(Icons.fitness_center),
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) => _weight = double.tryParse(v),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => widget.onComplete(_reps, _weight),
          child: const Text('Save'),
        ),
      ],
    );
  }
}

// ─── Add Exercise Dialog ───

class _AddExerciseDialog extends StatefulWidget {
  const _AddExerciseDialog({required this.exercises});
  final List<Exercise> exercises;

  @override
  State<_AddExerciseDialog> createState() => _AddExerciseDialogState();
}

class _AddExerciseDialogState extends State<_AddExerciseDialog> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _search.isEmpty
        ? widget.exercises
        : widget.exercises
            .where((e) => e.name.toLowerCase().contains(_search.toLowerCase()))
            .toList();

    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          maxWidth: 400,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Add Exercise',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search exercises...',
                      prefixIcon: Icon(Icons.search),
                      isDense: true,
                    ),
                    onChanged: (v) => setState(() => _search = v),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final exercise = filtered[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text(exercise.description),
                    dense: true,
                    onTap: () => Navigator.pop(context, exercise),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
