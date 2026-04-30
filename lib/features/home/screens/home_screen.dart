import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/league_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';
import '../../gamification/widgets/league_badge_widget.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);

    return homeState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (state) => _HomeContent(state: state, ref: ref),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.state, required this.ref});
  final HomeState state;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey${state.user?.name.isNotEmpty == true ? ', ${state.user!.name}' : ''}!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.workedOutToday
                            ? "Great job today!"
                            : "Ready to crush it?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => context.push('/settings'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Level & XP Card
            _XpCard(state: state),
            const SizedBox(height: 16),

            // League Card
            _LeagueCard(state: state),
            const SizedBox(height: 16),

            // Streak Card
            _StreakCard(state: state),
            const SizedBox(height: 16),

            // Resume Incomplete Workout Card (replaces Today's Workout)
            if (state.incompleteSession != null) ...[
              _ResumeWorkoutCard(session: state.incompleteSession!),
              const SizedBox(height: 16),
            ] else ...[
              // Today's Workout Card (only when no active session)
              _TodayWorkoutCard(state: state),
              const SizedBox(height: 16),
            ],

            // Quick Stats
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.fitness_center,
                    label: 'Workouts',
                    value: '${state.completedWorkouts}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.star,
                    label: 'Total XP',
                    value: '${state.totalXp}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // History button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.push('/workout/history'),
                icon: const Icon(Icons.history),
                label: const Text('History'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _XpCard extends StatelessWidget {
  const _XpCard({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final progress = state.xpForNextLevel > 0
        ? (state.xpInCurrentLevel / state.xpForNextLevel).clamp(0.0, 1.0)
        : 1.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Lv.${state.currentLevel}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    state.levelTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppTheme.darkCharcoal,
                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryOrange),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${state.xpInCurrentLevel} / ${state.xpForNextLevel} XP',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _LeagueCard extends StatelessWidget {
  const _LeagueCard({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final tier = LeagueConstants.getTier(state.currentLeagueTier);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/league'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              LeagueBadgeWidget(tier: state.currentLeagueTier, size: 48, showName: false),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tier.name} League',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      tier.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/calendar'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.local_fire_department,
                size: 48,
                color: state.currentStreak > 0 ? AppTheme.primaryOrange : AppTheme.textSecondary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${state.currentStreak} day streak',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Best: ${state.longestStreak} days',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              if (state.workedOutToday)
                const Icon(Icons.check_circle, color: AppTheme.accentGreen, size: 32),
              const SizedBox(width: 4),
              const Icon(Icons.calendar_month, size: 20, color: AppTheme.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodayWorkoutCard extends StatelessWidget {
  const _TodayWorkoutCard({required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final hasWorkout = state.todaysPlanDay != null;
    final isRestDay = !hasWorkout;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRestDay ? 'Rest Day' : "Today's Workout",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (isRestDay)
              Text(
                "No workout scheduled. Enjoy your rest! (But I'm watching...)",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            else if (state.workedOutToday)
              Row(
                children: [
                  const Icon(Icons.check_circle, color: AppTheme.accentGreen),
                  const SizedBox(width: 8),
                  Text(
                    'Completed! Great work!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.accentGreen,
                    ),
                  ),
                ],
              )
            else ...[
              Text(
                state.todaysPlanDay!.label,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.push(
                    '/workout/active',
                    extra: state.todaysPlanDay!.id,
                  ),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Workout'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResumeWorkoutCard extends StatelessWidget {
  const _ResumeWorkoutCard({required this.session});
  final WorkoutSession session;

  @override
  Widget build(BuildContext context) {
    final elapsed = DateTime.now().difference(session.startedAt);
    final elapsedText = elapsed.inMinutes > 0
        ? '${elapsed.inMinutes}min ago'
        : 'just now';

    return Card(
      color: AppTheme.primaryOrange.withAlpha(25),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.pause_circle_filled,
                    color: AppTheme.primaryOrange, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Unfinished Workout',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Started $elapsedText — pick up where you left off!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/workout/resume/${session.id}'),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Resume Workout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primaryOrange, size: 28),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
