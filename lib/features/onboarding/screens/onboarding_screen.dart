import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/onboarding_provider.dart';
import '../../../core/utils/app_logger.dart';
import '../../../features/workouts/logic/plan_generator.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    final screens = [
      _WelcomeStep(onNext: notifier.nextStep),
      _DifficultyStep(state: state, notifier: notifier),
      _TrainingFocusStep(state: state, notifier: notifier),
      _EquipmentStep(state: state, notifier: notifier),
      if (state.trainingFocus == TrainingFocus.specificBodyPart)
        _BodyPartStep(state: state, notifier: notifier),
      _ScheduleStep(state: state, notifier: notifier),
      _ProfileStep(state: state, notifier: notifier, ref: ref),
    ];

    final currentIndex = state.currentStep.clamp(0, screens.length - 1);

    return Scaffold(
      backgroundColor: AppTheme.darkCharcoal,
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Padding(
              padding: const EdgeInsets.all(16),
              child: LinearProgressIndicator(
                value: (currentIndex + 1) / screens.length,
                backgroundColor: AppTheme.darkSurface,
                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryOrange),
                minHeight: 6,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Expanded(child: screens[currentIndex]),
          ],
        ),
      ),
    );
  }
}

// ─── Step 1: Welcome ───

class _WelcomeStep extends StatelessWidget {
  const _WelcomeStep({required this.onNext});
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.fitness_center, size: 80, color: AppTheme.primaryOrange),
          const SizedBox(height: 24),
          Text('Welcome to FitNag!',
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 16),
          Text(
            "I'm your new fitness buddy. Fair warning: I'm a bit... persistent. "
            "But hey, that's what you need, right?",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Let's set up your workout plan in just a few steps!",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              child: const Text("Let's Go!"),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Step 2: Difficulty ───

class _DifficultyStep extends StatelessWidget {
  const _DifficultyStep({required this.state, required this.notifier});
  final OnboardingState state;
  final OnboardingNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: "What's your fitness level?",
      subtitle: "Be honest - no judgment here!",
      onBack: notifier.prevStep,
      onNext: notifier.nextStep,
      child: Column(
        children: Difficulty.values.map((d) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SelectionCard(
              label: d.label,
              subtitle: _difficultyDesc(d),
              selected: state.difficulty == d,
              onTap: () => notifier.setDifficulty(d),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _difficultyDesc(Difficulty d) {
    switch (d) {
      case Difficulty.beginner:
        return "New to working out or getting back into it";
      case Difficulty.intermediate:
        return "Consistent training for 6+ months";
      case Difficulty.advanced:
        return "Experienced lifter, 2+ years training";
    }
  }
}

// ─── Step 3: Training Focus ───

class _TrainingFocusStep extends StatelessWidget {
  const _TrainingFocusStep({required this.state, required this.notifier});
  final OnboardingState state;
  final OnboardingNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: "What's your main goal?",
      subtitle: "This shapes your workout plans",
      onBack: notifier.prevStep,
      onNext: notifier.nextStep,
      child: Column(
        children: TrainingFocus.values.map((f) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SelectionCard(
              label: f.label,
              selected: state.trainingFocus == f,
              onTap: () => notifier.setTrainingFocus(f),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Step 4: Equipment ───

class _EquipmentStep extends StatelessWidget {
  const _EquipmentStep({required this.state, required this.notifier});
  final OnboardingState state;
  final OnboardingNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: 'What equipment do you have?',
      subtitle: 'Select all that apply. Bodyweight is always included.',
      onBack: notifier.prevStep,
      onNext: notifier.nextStep,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: Equipment.values.map((e) {
          final selected = state.selectedEquipment.contains(e);
          return FilterChip(
            label: Text(e.label),
            selected: selected,
            onSelected: (_) => notifier.toggleEquipment(e),
            selectedColor: AppTheme.primaryOrange.withAlpha(50),
            checkmarkColor: AppTheme.primaryOrange,
          );
        }).toList(),
      ),
    );
  }
}

// ─── Step 5: Target Body Parts (conditional) ───

class _BodyPartStep extends StatelessWidget {
  const _BodyPartStep({required this.state, required this.notifier});
  final OnboardingState state;
  final OnboardingNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: 'Which body parts to focus on?',
      subtitle: 'Select the areas you want to prioritize',
      onBack: notifier.prevStep,
      onNext: state.targetBodyParts.isNotEmpty ? notifier.nextStep : null,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: BodyPart.values.where((bp) => bp != BodyPart.fullBody).map((bp) {
          final selected = state.targetBodyParts.contains(bp);
          return FilterChip(
            label: Text(bp.label),
            selected: selected,
            onSelected: (_) => notifier.toggleBodyPart(bp),
            selectedColor: AppTheme.primaryOrange.withAlpha(50),
            checkmarkColor: AppTheme.primaryOrange,
          );
        }).toList(),
      ),
    );
  }
}

// ─── Step 6: Schedule ───

class _ScheduleStep extends StatefulWidget {
  const _ScheduleStep({required this.state, required this.notifier});
  final OnboardingState state;
  final OnboardingNotifier notifier;

  @override
  State<_ScheduleStep> createState() => _ScheduleStepState();
}

class _ScheduleStepState extends State<_ScheduleStep> {
  static const _dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: 'Set your workout schedule',
      subtitle: 'Pick your workout days and notification windows',
      onBack: widget.notifier.prevStep,
      onNext: widget.state.workoutDays.isNotEmpty ? widget.notifier.nextStep : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Workout days:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: List.generate(7, (i) {
              final day = i + 1;
              final selected = widget.state.workoutDays.contains(day);
              return FilterChip(
                label: Text(_dayLabels[i]),
                selected: selected,
                onSelected: (_) {
                  final days = List<int>.from(widget.state.workoutDays);
                  if (days.contains(day)) {
                    days.remove(day);
                  } else {
                    days.add(day);
                  }
                  days.sort();
                  widget.notifier.setWorkoutDays(days);
                },
                selectedColor: AppTheme.primaryOrange.withAlpha(50),
                checkmarkColor: AppTheme.primaryOrange,
              );
            }),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text('Nag time windows:', style: Theme.of(context).textTheme.titleMedium),
              ),
              if (widget.state.notificationWindows.length < 5)
                IconButton(
                  onPressed: () {
                    widget.notifier.addNotificationWindow(
                      const TimeWindow(startHour: 18, startMinute: 0, endHour: 20, endMinute: 0),
                    );
                  },
                  icon: const Icon(Icons.add_circle, color: AppTheme.primaryOrange),
                  tooltip: 'Add window',
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'I\'ll nag you once per window, getting more dramatic each time.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          ...widget.state.notificationWindows.asMap().entries.map((entry) {
            final i = entry.key;
            final w = entry.value;
            return _NotificationWindowTile(
              index: i,
              window: w,
              canRemove: widget.state.notificationWindows.length > 1,
              onTapStart: () => _pickTime(context, TimeOfDay(hour: w.startHour, minute: w.startMinute), (t) {
                widget.notifier.updateNotificationWindow(i, TimeWindow(
                  startHour: t.hour, startMinute: t.minute,
                  endHour: w.endHour, endMinute: w.endMinute,
                ));
              }),
              onTapEnd: () => _pickTime(context, TimeOfDay(hour: w.endHour, minute: w.endMinute), (t) {
                widget.notifier.updateNotificationWindow(i, TimeWindow(
                  startHour: w.startHour, startMinute: w.startMinute,
                  endHour: t.hour, endMinute: t.minute,
                ));
              }),
              onRemove: () => widget.notifier.removeNotificationWindow(i),
            );
          }),
        ],
      ),
    );
  }

  Future<void> _pickTime(BuildContext context, TimeOfDay initial, void Function(TimeOfDay) onPicked) async {
    final time = await showTimePicker(context: context, initialTime: initial);
    if (time != null) onPicked(time);
  }
}

class _NotificationWindowTile extends StatelessWidget {
  const _NotificationWindowTile({
    required this.index,
    required this.window,
    required this.canRemove,
    required this.onTapStart,
    required this.onTapEnd,
    required this.onRemove,
  });
  final int index;
  final TimeWindow window;
  final bool canRemove;
  final VoidCallback onTapStart;
  final VoidCallback onTapEnd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final urgencyLabels = ['Friendly', 'Gentle', 'Snarky', 'Dramatic', 'Emergency'];
    final label = index < urgencyLabels.length ? urgencyLabels[index] : 'Extra';

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange.withAlpha(40),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.primaryOrange)),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: onTapStart,
              child: Text(
                TimeOfDay(hour: window.startHour, minute: window.startMinute).format(context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text('–'),
            ),
            InkWell(
              onTap: onTapEnd,
              child: Text(
                TimeOfDay(hour: window.endHour, minute: window.endMinute).format(context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            if (canRemove)
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.remove_circle_outline, size: 20),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Step 7: Profile ───

class _ProfileStep extends StatefulWidget {
  const _ProfileStep({required this.state, required this.notifier, required this.ref});
  final OnboardingState state;
  final OnboardingNotifier notifier;
  final WidgetRef ref;

  @override
  State<_ProfileStep> createState() => _ProfileStepState();
}

class _ProfileStepState extends State<_ProfileStep> {
  late final TextEditingController _nameController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.state.name);
    _heightController = TextEditingController(
      text: widget.state.heightCm?.toString() ?? '',
    );
    _weightController = TextEditingController(
      text: widget.state.weightKg?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _StepWrapper(
      title: 'Almost there!',
      subtitle: 'Tell us a bit about yourself',
      onBack: widget.notifier.prevStep,
      onNext: null,
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name (optional)',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: widget.notifier.setName,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _heightController,
            decoration: const InputDecoration(
              labelText: 'Height (cm)',
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) {
              final h = double.tryParse(v);
              if (h != null) widget.notifier.setHeight(h);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _weightController,
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
              prefixIcon: Icon(Icons.monitor_weight),
            ),
            keyboardType: TextInputType.number,
            onChanged: (v) {
              final w = double.tryParse(v);
              if (w != null) widget.notifier.setWeight(w);
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saving ? null : _finish,
              child: _saving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Generate My Workout Plan'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _finish() async {
    setState(() => _saving = true);
    try {
      await widget.notifier.completeOnboarding();
      await PlanGenerator.generateAndSavePlan();
      if (mounted) {
        widget.ref.invalidate(onboardingCompleteProvider);
        context.go('/');
      }
    } catch (e, st) {
      AppLogger.error(
        'Failed to complete onboarding',
        tag: 'OnboardingScreen',
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

// ─── Shared Widgets ───

class _StepWrapper extends StatelessWidget {
  const _StepWrapper({
    required this.title,
    this.subtitle,
    required this.onBack,
    required this.onNext,
    required this.child,
  });
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium),
          ],
          const SizedBox(height: 24),
          Expanded(child: SingleChildScrollView(child: child)),
          const SizedBox(height: 16),
          Row(
            children: [
              if (onBack != null)
                OutlinedButton(onPressed: onBack, child: const Text('Back')),
              const Spacer(),
              if (onNext != null)
                ElevatedButton(onPressed: onNext, child: const Text('Next')),
            ],
          ),
        ],
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  const _SelectionCard({
    required this.label,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryOrange.withAlpha(30) : AppTheme.darkSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppTheme.primaryOrange : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ],
        ),
      ),
    );
  }
}
