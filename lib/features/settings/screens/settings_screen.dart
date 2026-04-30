import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/exercise_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/schedule_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/notification_dao.dart';
import '../../notifications/services/nag_scheduler.dart';
import '../../workouts/logic/plan_generator.dart';

final settingsUserProvider = StreamProvider<User>((ref) {
  return UserDao(AppDatabase.instance).watchUser();
});

final settingsWindowsProvider = FutureProvider<List<NotificationWindow>>((ref) async {
  final db = AppDatabase.instance;
  final user = await UserDao(db).getOrCreateUser();
  return NotificationDao(db).getWindows(user.id);
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(settingsUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (user) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Notifications
            Card(
              child: SwitchListTile(
                title: const Text('Notifications'),
                subtitle: const Text('Enable workout reminders & nags'),
                value: user.notificationsEnabled,
                activeTrackColor: AppTheme.primaryOrange,
                onChanged: (enabled) async {
                  if (enabled) {
                    final granted = await NagScheduler.requestPermission();
                    if (!granted) return;
                  }
                  await UserDao(AppDatabase.instance).updateUser(
                    UsersCompanion(notificationsEnabled: Value(enabled)),
                  );
                  if (enabled) {
                    await NagScheduler.scheduleNags();
                  } else {
                    await NagScheduler.cancelAllNags();
                  }
                },
              ),
            ),
            const SizedBox(height: 8),

            // Notification windows
            _NotificationWindowsCard(ref: ref, user: user),
            const SizedBox(height: 8),

            // Equipment
            _EquipmentCard(user: user),
            const SizedBox(height: 8),

            // Workout schedule
            _WorkoutScheduleCard(user: user),
            const SizedBox(height: 8),

            // Regenerate plan
            Card(
              child: ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Regenerate Workout Plan'),
                subtitle: const Text('Create a new randomized plan'),
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Regenerate Plan?'),
                      content: const Text(
                        'This will replace your current workout plan with a new one.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: const Text('Regenerate'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    await PlanGenerator.generateAndSavePlan();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('New workout plan generated!')),
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Health disclaimer
            Card(
              color: AppTheme.primaryOrange.withAlpha(20),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.health_and_safety, size: 20, color: AppTheme.primaryOrange),
                        const SizedBox(width: 8),
                        const Text('Health Disclaimer',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.primaryOrange,
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'FitNag is a fitness tracking tool, not medical advice. '
                      'Consult a qualified healthcare professional before starting '
                      'any exercise program, especially if you have pre-existing '
                      'health conditions. Listen to your body and stop exercising '
                      'if you feel pain, dizziness, or discomfort. '
                      'You use this app at your own risk.',
                      style: TextStyle(fontSize: 13, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // App info
            Text('FitNag v1.0.0',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _NotificationWindowsCard extends StatefulWidget {
  const _NotificationWindowsCard({required this.ref, required this.user});
  final WidgetRef ref;
  final User user;

  @override
  State<_NotificationWindowsCard> createState() => _NotificationWindowsCardState();
}

class _NotificationWindowsCardState extends State<_NotificationWindowsCard> {
  List<NotificationWindow>? _windows;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadWindows();
  }

  Future<void> _loadWindows() async {
    final db = AppDatabase.instance;
    final windows = await NotificationDao(db).getWindows(widget.user.id);
    if (mounted) setState(() { _windows = windows; _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const SizedBox.shrink();

    final windows = _windows ?? [];
    final urgencyLabels = ['Friendly', 'Gentle', 'Snarky', 'Dramatic', 'Emergency'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.notifications_active, size: 20),
                const SizedBox(width: 8),
                const Expanded(child: Text('Nag Time Windows', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                if (windows.length < 5)
                  IconButton(
                    onPressed: _addWindow,
                    icon: const Icon(Icons.add_circle, color: AppTheme.primaryOrange, size: 22),
                    tooltip: 'Add window',
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'One nag per window, escalating urgency.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            if (windows.isEmpty)
              const Text('No windows set. Using preferred time fallback.'),
            ...windows.asMap().entries.map((entry) {
              final i = entry.key;
              final w = entry.value;
              final label = i < urgencyLabels.length ? urgencyLabels[i] : 'Extra';
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryOrange.withAlpha(40),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.primaryOrange)),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => _editWindowStart(i, w),
                      child: Text(
                        TimeOfDay(hour: w.startHour, minute: w.startMinute).format(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text('–'),
                    ),
                    InkWell(
                      onTap: () => _editWindowEnd(i, w),
                      child: Text(
                        TimeOfDay(hour: w.endHour, minute: w.endMinute).format(context),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Spacer(),
                    if (windows.length > 1)
                      IconButton(
                        onPressed: () => _removeWindow(w.id),
                        icon: const Icon(Icons.remove_circle_outline, size: 18),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _addWindow() async {
    final db = AppDatabase.instance;
    final dao = NotificationDao(db);
    await dao.addWindow(
      NotificationWindowsCompanion.insert(
        userId: widget.user.id,
        startHour: 18,
        startMinute: 0,
        endHour: 20,
        endMinute: 0,
        orderIndex: (_windows?.length ?? 0),
      ),
    );
    await _loadWindows();
    await NagScheduler.scheduleNags();
  }

  Future<void> _removeWindow(int windowId) async {
    final db = AppDatabase.instance;
    await NotificationDao(db).deleteWindow(windowId);
    await _loadWindows();
    await NagScheduler.scheduleNags();
  }

  Future<void> _editWindowStart(int index, NotificationWindow w) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: w.startHour, minute: w.startMinute),
    );
    if (time == null) return;
    await _replaceWindow(w, startHour: time.hour, startMinute: time.minute);
  }

  Future<void> _editWindowEnd(int index, NotificationWindow w) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: w.endHour, minute: w.endMinute),
    );
    if (time == null) return;
    await _replaceWindow(w, endHour: time.hour, endMinute: time.minute);
  }

  Future<void> _replaceWindow(NotificationWindow w, {int? startHour, int? startMinute, int? endHour, int? endMinute}) async {
    final db = AppDatabase.instance;
    final dao = NotificationDao(db);
    await dao.deleteWindow(w.id);
    await dao.addWindow(
      NotificationWindowsCompanion.insert(
        userId: widget.user.id,
        startHour: startHour ?? w.startHour,
        startMinute: startMinute ?? w.startMinute,
        endHour: endHour ?? w.endHour,
        endMinute: endMinute ?? w.endMinute,
        orderIndex: w.orderIndex,
      ),
    );
    await _loadWindows();
    await NagScheduler.scheduleNags();
  }
}

class _WorkoutScheduleCard extends StatefulWidget {
  const _WorkoutScheduleCard({required this.user});
  final User user;

  @override
  State<_WorkoutScheduleCard> createState() => _WorkoutScheduleCardState();
}

class _WorkoutScheduleCardState extends State<_WorkoutScheduleCard> {
  late int _scheduleMode;
  late List<int> _selectedDays;
  late int _intervalDays;
  String? _nextWorkoutInfo;

  static const _dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    _scheduleMode = widget.user.scheduleMode;
    _selectedDays = widget.user.workoutDays
        .split(',')
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .toList();
    _intervalDays = widget.user.intervalDays;
    _loadNextWorkout();
  }

  Future<void> _loadNextWorkout() async {
    if (_scheduleMode == 2) {
      final next = await ScheduleHelper.nextWorkoutDay(widget.user);
      if (mounted && next != null) {
        setState(() {
          _nextWorkoutInfo =
              '${next.day}/${next.month}/${next.year}';
        });
      }
    }
  }

  Future<void> _save() async {
    final dao = UserDao(AppDatabase.instance);
    await dao.updateUser(UsersCompanion(
      scheduleMode: Value(_scheduleMode),
      workoutDays: Value(_selectedDays.join(',')),
      workoutDaysPerWeek: Value(_selectedDays.length),
      intervalDays: Value(_intervalDays),
      intervalStartDate: _scheduleMode == 1
          ? Value(widget.user.intervalStartDate ?? DateTime.now())
          : const Value.absent(),
    ));

    // Regenerate plan with new schedule
    await PlanGenerator.generateAndSavePlan();
    await NagScheduler.scheduleNags();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Schedule updated & plan regenerated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20),
                const SizedBox(width: 8),
                const Text('Workout Schedule',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 12),

            // Schedule mode selector
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Weekdays')),
                ButtonSegment(value: 1, label: Text('Every X days')),
                ButtonSegment(value: 2, label: Text('Adaptive')),
              ],
              selected: {_scheduleMode},
              onSelectionChanged: (selected) {
                setState(() => _scheduleMode = selected.first);
              },
              style: SegmentedButton.styleFrom(
                selectedBackgroundColor:
                    AppTheme.primaryOrange.withAlpha(40),
              ),
            ),
            const SizedBox(height: 12),

            // Mode-specific controls
            if (_scheduleMode == 0) ...[
              Wrap(
                spacing: 6,
                children: List.generate(7, (i) {
                  final day = i + 1; // ISO weekday 1-7
                  final selected = _selectedDays.contains(day);
                  return FilterChip(
                    label: Text(_dayLabels[i]),
                    selected: selected,
                    selectedColor: AppTheme.primaryOrange.withAlpha(60),
                    checkmarkColor: AppTheme.primaryOrange,
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          _selectedDays.add(day);
                        } else if (_selectedDays.length > 1) {
                          _selectedDays.remove(day);
                        }
                        _selectedDays.sort();
                      });
                    },
                  );
                }),
              ),
            ] else if (_scheduleMode == 1) ...[
              Row(
                children: [
                  const Text('Train every'),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    value: _intervalDays,
                    items: List.generate(7, (i) => i + 1)
                        .map((d) => DropdownMenuItem(
                            value: d, child: Text('$d')))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _intervalDays = v);
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('day${_intervalDays > 1 ? 's' : ''}'),
                ],
              ),
              const SizedBox(height: 4),
              Text('Starting from ${_scheduleMode == 1 ? 'today' : 'last workout'}',
                  style: Theme.of(context).textTheme.bodySmall),
            ] else ...[
              Row(
                children: [
                  const Text('Rest at least'),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    value: _intervalDays,
                    items: List.generate(7, (i) => i + 1)
                        .map((d) => DropdownMenuItem(
                            value: d, child: Text('$d')))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _intervalDays = v);
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('day${_intervalDays > 1 ? 's' : ''} between workouts'),
                ],
              ),
              if (_nextWorkoutInfo != null) ...[
                const SizedBox(height: 4),
                Text('Next workout: $_nextWorkoutInfo',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppTheme.primaryOrange)),
              ],
            ],

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                child: const Text('Apply & Regenerate Plan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EquipmentCard extends StatefulWidget {
  const _EquipmentCard({required this.user});
  final User user;

  @override
  State<_EquipmentCard> createState() => _EquipmentCardState();
}

class _EquipmentCardState extends State<_EquipmentCard> {
  late Set<int> _selectedIndices;
  bool _loading = true;
  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    _loadEquipment();
  }

  Future<void> _loadEquipment() async {
    final dao = UserDao(AppDatabase.instance);
    final indices = await dao.getEquipment(widget.user.id);
    if (mounted) {
      setState(() {
        _selectedIndices = indices.toSet();
        _loading = false;
      });
    }
  }

  Future<void> _save() async {
    final dao = UserDao(AppDatabase.instance);
    await dao.setEquipment(widget.user.id, _selectedIndices.toList()..sort());
    await PlanGenerator.generateAndSavePlan();
    setState(() => _dirty = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Equipment updated & plan regenerated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.fitness_center, size: 20),
                SizedBox(width: 8),
                Text('My Equipment',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Select the equipment you have access to. Your plan will adapt automatically.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: Equipment.values.map((eq) {
                final selected = _selectedIndices.contains(eq.index);
                final isBodyweight = eq == Equipment.bodyweightFloor;
                return FilterChip(
                  label: Text(eq.label),
                  selected: selected,
                  selectedColor: AppTheme.primaryOrange.withAlpha(60),
                  checkmarkColor: AppTheme.primaryOrange,
                  onSelected: isBodyweight
                      ? null // Bodyweight always selected
                      : (value) {
                          setState(() {
                            if (value) {
                              _selectedIndices.add(eq.index);
                            } else {
                              _selectedIndices.remove(eq.index);
                            }
                            _dirty = true;
                          });
                        },
                );
              }).toList(),
            ),
            if (_dirty) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Apply & Regenerate Plan'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
