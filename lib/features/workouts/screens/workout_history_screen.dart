import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/workout_dao.dart';
import '../providers/workout_provider.dart';
import '../widgets/session_details_widget.dart';

class WorkoutHistoryScreen extends ConsumerWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(workoutHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workout History')),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (sessions) {
          if (sessions.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center, size: 64, color: AppTheme.textSecondary),
                  SizedBox(height: 16),
                  Text('No workouts yet!'),
                  Text('Complete your first workout to see it here.'),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              return _SessionCard(session: sessions[index]);
            },
          );
        },
      ),
    );
  }
}

class _SessionCard extends StatefulWidget {
  const _SessionCard({required this.session});
  final WorkoutSession session;

  @override
  State<_SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<_SessionCard> {
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

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final date = session.completedAt ?? session.startedAt;
    final duration = session.completedAt != null
        ? session.completedAt!.difference(session.startedAt)
        : Duration.zero;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.primaryOrange,
              child: Text(
                '+${session.totalXpEarned}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(DateFormat('EEEE, MMM d').format(date)),
            subtitle: Text(
              '${duration.inMinutes}min • '
              '${session.allSetsCompleted ? "All sets completed" : "Partial"}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (session.allSetsCompleted)
                  const Icon(Icons.check_circle, color: AppTheme.accentGreen, size: 20),
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
