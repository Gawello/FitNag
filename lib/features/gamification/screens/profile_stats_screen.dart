import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart' show Badge;
import '../providers/gamification_provider.dart';

class ProfileStatsScreen extends ConsumerWidget {
  const ProfileStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(profileStatsProvider);

    return SafeArea(
      child: statsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (stats) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile & Stats',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),

              // Level card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppTheme.primaryOrange,
                        child: Text(
                          'Lv.${stats.currentLevel}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(stats.levelTitle,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text('${stats.totalXp} XP',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: stats.levelProgress,
                          backgroundColor: AppTheme.darkCharcoal,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryOrange),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Stats row
              Row(
                children: [
                  _StatTile(
                    icon: Icons.local_fire_department,
                    value: '${stats.currentStreak}',
                    label: 'Streak',
                    color: AppTheme.primaryOrange,
                  ),
                  _StatTile(
                    icon: Icons.emoji_events,
                    value: '${stats.longestStreak}',
                    label: 'Best Streak',
                    color: AppTheme.accentYellow,
                  ),
                  _StatTile(
                    icon: Icons.fitness_center,
                    value: '${stats.totalWorkouts}',
                    label: 'Workouts',
                    color: AppTheme.accentGreen,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Badges
              Text('Badges', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                '${stats.earnedBadgeIds.length}/${stats.allBadges.length} earned',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: stats.allBadges.map((badge) {
                  final earned = stats.earnedBadgeIds.contains(badge.id);
                  return _BadgeChip(badge: badge, earned: earned);
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Recent XP
              if (stats.recentXp.isNotEmpty) ...[
                Text('Recent XP', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                ...stats.recentXp.map((xp) => Card(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundColor: AppTheme.accentGreen.withAlpha(50),
                          radius: 16,
                          child: Text(
                            '+${xp.amount}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppTheme.accentGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(xp.reason, style: const TextStyle(fontSize: 14)),
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(value, style: Theme.of(context).textTheme.titleLarge),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.badge, required this.earned});
  final Badge badge;
  final bool earned;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: badge.description,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: earned ? AppTheme.primaryOrange.withAlpha(30) : AppTheme.darkSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: earned ? AppTheme.primaryOrange : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              earned ? Icons.emoji_events : Icons.lock_outline,
              size: 16,
              color: earned ? AppTheme.accentYellow : AppTheme.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              badge.name,
              style: TextStyle(
                fontSize: 13,
                color: earned ? AppTheme.textPrimary : AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
