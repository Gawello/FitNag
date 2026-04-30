import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/workout_dao.dart';
import '../providers/calendar_provider.dart';
import '../widgets/session_details_widget.dart';

class WorkoutCalendarScreen extends ConsumerStatefulWidget {
  const WorkoutCalendarScreen({super.key});

  @override
  ConsumerState<WorkoutCalendarScreen> createState() =>
      _WorkoutCalendarScreenState();
}

class _WorkoutCalendarScreenState
    extends ConsumerState<WorkoutCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(calendarProvider.notifier)
          .loadMonth(_focusedDay.year, _focusedDay.month);
    });
  }

  @override
  Widget build(BuildContext context) {
    final calState = ref.watch(calendarProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workout Calendar')),
      body: Column(
        children: [
          TableCalendar<WorkoutSession>(
            firstDay: DateTime(2024, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
              ref
                  .read(calendarProvider.notifier)
                  .loadMonth(focusedDay.year, focusedDay.month);
            },
            eventLoader: (day) {
              final key = DateTime(day.year, day.month, day.day);
              return calState.completedSessions[key] ?? [];
            },
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                color: AppTheme.accentGreen,
                shape: BoxShape.circle,
              ),
              markerSize: 7,
              markersMaxCount: 1,
              todayDecoration: BoxDecoration(
                color: AppTheme.primaryOrange.withAlpha(80),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: AppTheme.primaryOrange,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final key = DateTime(day.year, day.month, day.day);
                final isScheduled = calState.scheduledDays.contains(key);
                final hasCompleted =
                    calState.completedSessions.containsKey(key);

                if (isScheduled && !hasCompleted) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppTheme.primaryOrange.withAlpha(120),
                          width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text('${day.day}'),
                  );
                }
                return null;
              },
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          const Divider(),
          Expanded(
            child: _buildDaySummary(calState),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySummary(CalendarState calState) {
    if (_selectedDay == null) {
      return const Center(child: Text('Select a day to see details'));
    }

    final key = DateTime(
        _selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
    final sessions = calState.completedSessions[key] ?? [];

    if (sessions.isEmpty) {
      final isScheduled = calState.scheduledDays.contains(key);
      return Center(
        child: Text(isScheduled
            ? 'Scheduled workout day - not completed'
            : 'Rest day'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return _ExpandableSessionCard(session: session, index: index);
      },
    );
  }

}

class _ExpandableSessionCard extends StatefulWidget {
  const _ExpandableSessionCard({required this.session, required this.index});
  final WorkoutSession session;
  final int index;

  @override
  State<_ExpandableSessionCard> createState() => _ExpandableSessionCardState();
}

class _ExpandableSessionCardState extends State<_ExpandableSessionCard> {
  bool _expanded = false;
  List<({SessionSet sessionSet, Exercise exercise})>? _details;
  bool _loading = false;

  Future<void> _loadDetails() async {
    if (_details != null) return;
    setState(() => _loading = true);
    final db = AppDatabase.instance;
    final workoutDao = WorkoutDao(db);
    final sets = await workoutDao.getSessionSetsWithExercises(widget.session.id);
    if (mounted) {
      setState(() {
        _details = sets;
        _loading = false;
      });
    }
  }

  String _formatTime(DateTime? dt) {
    if (dt == null) return '';
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final duration = session.completedAt != null
        ? session.completedAt!.difference(session.startedAt)
        : Duration.zero;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.check_circle, color: AppTheme.accentGreen),
            title: Text(
              'Workout ${widget.index + 1}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${duration.inMinutes}min • ${session.totalXpEarned} XP'
              '${session.allSetsCompleted ? ' • All sets!' : ''}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTime(session.completedAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 4),
                Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
            onTap: () {
              setState(() => _expanded = !_expanded);
              if (_expanded) _loadDetails();
            },
          ),
          if (_expanded) ...[
            const Divider(height: 1),
            if (_loading)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              )
            else if (_details != null)
              SessionDetailsWidget(details: _details!),
          ],
        ],
      ),
    );
  }
}
