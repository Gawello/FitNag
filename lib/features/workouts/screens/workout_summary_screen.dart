import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:confetti/confetti.dart';

import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/workout_dao.dart';

final workoutSummaryProvider = FutureProvider.family<WorkoutSession?, int>((ref, sessionId) async {
  final db = AppDatabase.instance;
  return WorkoutDao(db).getSession(sessionId);
});

class WorkoutSummaryScreen extends ConsumerStatefulWidget {
  const WorkoutSummaryScreen({super.key, required this.sessionId});
  final int sessionId;

  @override
  ConsumerState<WorkoutSummaryScreen> createState() => _WorkoutSummaryScreenState();
}

class _WorkoutSummaryScreenState extends ConsumerState<WorkoutSummaryScreen> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(workoutSummaryProvider(widget.sessionId));

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: sessionAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
              data: (session) {
                if (session == null) return const Text('Session not found');
                final duration = session.completedAt != null
                    ? session.completedAt!.difference(session.startedAt)
                    : Duration.zero;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      const Icon(
                        Icons.emoji_events,
                        size: 80,
                        color: AppTheme.accentYellow,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Workout Complete!',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Great job! Keep it up!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 32),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              _SummaryRow(
                                icon: Icons.star,
                                label: 'XP Earned',
                                value: '+${session.totalXpEarned}',
                                valueColor: AppTheme.accentYellow,
                              ),
                              const Divider(height: 24),
                              _SummaryRow(
                                icon: Icons.timer,
                                label: 'Duration',
                                value: _formatDuration(duration),
                              ),
                              const Divider(height: 24),
                              _SummaryRow(
                                icon: Icons.check_circle,
                                label: 'All Sets Completed',
                                value: session.allSetsCompleted ? 'Yes!' : 'No',
                                valueColor: session.allSetsCompleted
                                    ? AppTheme.accentGreen
                                    : AppTheme.textSecondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go('/'),
                          child: const Text('Back to Home'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 20,
              minBlastForce: 5,
              gravity: 0.1,
              colors: const [
                AppTheme.primaryOrange,
                AppTheme.accentGreen,
                AppTheme.accentYellow,
                AppTheme.darkCard,
                AppTheme.textSecondary,
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    if (minutes > 0) return '${minutes}m ${seconds}s';
    return '${seconds}s';
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryOrange),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
