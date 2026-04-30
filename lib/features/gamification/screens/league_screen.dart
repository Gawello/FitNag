import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/league_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../logic/league_manager.dart';
import '../widgets/league_badge_widget.dart';

final _leagueDataProvider = FutureProvider<({int storedTier, double avgMinutes, double avgDays, int calcTier})>((ref) async {
  final db = AppDatabase.instance;
  final user = await UserDao(db).getOrCreateUser();
  final stats = await LeagueManager.calculateCurrentLeague(user.id);
  final storedTier = await LeagueManager.getStoredTier(user.id);
  return (
    storedTier: storedTier,
    avgMinutes: stats.avgMinutes,
    avgDays: stats.avgDays,
    calcTier: stats.tier,
  );
});

class LeagueScreen extends ConsumerWidget {
  const LeagueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(_leagueDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Active League')),
      body: dataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (data) => _LeagueContent(
          currentTier: data.storedTier,
          avgMinutes: data.avgMinutes,
          avgDays: data.avgDays,
        ),
      ),
    );
  }
}

class _LeagueContent extends StatelessWidget {
  const _LeagueContent({
    required this.currentTier,
    required this.avgMinutes,
    required this.avgDays,
  });
  final int currentTier;
  final double avgMinutes;
  final double avgDays;

  @override
  Widget build(BuildContext context) {
    final tier = LeagueConstants.getTier(currentTier);
    final nextTier = currentTier < 15 ? LeagueConstants.getTier(currentTier + 1) : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Current league badge
          LeagueBadgeWidget(tier: currentTier, size: 100),
          const SizedBox(height: 8),
          Text(
            tier.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // WHO context card
          _WhoContextCard(tier: tier),
          const SizedBox(height: 16),

          // Progress section
          _ProgressCard(
            avgMinutes: avgMinutes,
            avgDays: avgDays,
            currentTier: tier,
            nextTier: nextTier,
          ),
          const SizedBox(height: 16),

          // Next tier preview
          if (nextTier != null) ...[
            _NextTierCard(nextTier: nextTier, avgMinutes: avgMinutes, avgDays: avgDays),
            const SizedBox(height: 16),
          ],

          // Full tier list
          Text('All Tiers', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...LeagueConstants.tiers.map((t) => _TierListItem(
            tier: t,
            isCurrent: t.tier == currentTier,
          )),
        ],
      ),
    );
  }
}

class _WhoContextCard extends StatelessWidget {
  const _WhoContextCard({required this.tier});
  final LeagueTier tier;

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    IconData icon;
    if (tier.isOvertrainingRisk) {
      cardColor = AppTheme.accentRed.withAlpha(30);
      icon = Icons.warning_amber;
    } else if (tier.tier >= 5) {
      cardColor = AppTheme.accentGreen.withAlpha(30);
      icon = Icons.check_circle;
    } else {
      cardColor = AppTheme.accentYellow.withAlpha(30);
      icon = Icons.info;
    }

    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 28, color: tier.isOvertrainingRisk
                ? AppTheme.accentRed
                : tier.tier >= 5
                    ? AppTheme.accentGreen
                    : AppTheme.accentYellow),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WHO Context',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(tier.whoContext,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.avgMinutes,
    required this.avgDays,
    required this.currentTier,
    required this.nextTier,
  });
  final double avgMinutes;
  final double avgDays;
  final LeagueTier currentTier;
  final LeagueTier? nextTier;

  @override
  Widget build(BuildContext context) {
    final targetMinutes = nextTier?.minMinutes.toDouble() ?? currentTier.minMinutes.toDouble();
    final targetDays = nextTier?.minDays.toDouble() ?? currentTier.minDays.toDouble();

    final minutesProgress = targetMinutes > 0
        ? (avgMinutes / targetMinutes).clamp(0.0, 1.0)
        : 1.0;
    final daysProgress = targetDays > 0
        ? (avgDays / targetDays).clamp(0.0, 1.0)
        : 1.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weekly Progress', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _ProgressBar(
              label: 'Minutes/week',
              value: avgMinutes,
              target: targetMinutes,
              progress: minutesProgress,
              suffix: 'min',
            ),
            const SizedBox(height: 12),
            _ProgressBar(
              label: 'Days/week',
              value: avgDays,
              target: targetDays,
              progress: daysProgress,
              suffix: 'days',
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    required this.label,
    required this.value,
    required this.target,
    required this.progress,
    required this.suffix,
  });
  final String label;
  final double value;
  final double target;
  final double progress;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${value.toStringAsFixed(0)} / ${target.toStringAsFixed(0)} $suffix',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppTheme.darkCharcoal,
            valueColor: AlwaysStoppedAnimation<Color>(
              progress >= 1.0 ? AppTheme.accentGreen : AppTheme.primaryOrange,
            ),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}

class _NextTierCard extends StatelessWidget {
  const _NextTierCard({
    required this.nextTier,
    required this.avgMinutes,
    required this.avgDays,
  });
  final LeagueTier nextTier;
  final double avgMinutes;
  final double avgDays;

  @override
  Widget build(BuildContext context) {
    final needsMinutes = (nextTier.minMinutes - avgMinutes).clamp(0, double.infinity);
    final needsDays = (nextTier.minDays - avgDays).clamp(0, double.infinity);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            LeagueBadgeWidget(tier: nextTier.tier, size: 48, showName: false),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Next: ${nextTier.name}',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  if (needsMinutes > 0)
                    Text('+${needsMinutes.toStringAsFixed(0)} min/week needed',
                        style: Theme.of(context).textTheme.bodySmall),
                  if (needsDays > 0)
                    Text('+${needsDays.toStringAsFixed(1)} days/week needed',
                        style: Theme.of(context).textTheme.bodySmall),
                  if (needsMinutes <= 0 && needsDays <= 0)
                    Text('Keep it up for 2 weeks to promote!',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.accentGreen,
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TierListItem extends StatelessWidget {
  const _TierListItem({required this.tier, required this.isCurrent});
  final LeagueTier tier;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCurrent ? tier.color.withAlpha(30) : null,
      child: ListTile(
        leading: LeagueBadgeWidget(tier: tier.tier, size: 36, showName: false),
        title: Row(
          children: [
            Text(tier.name,
                style: TextStyle(
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                )),
            if (isCurrent) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primaryOrange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('YOU', style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
            if (tier.isWhoMinimum) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.accentGreen.withAlpha(50),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('WHO MIN', style: TextStyle(fontSize: 9, color: AppTheme.accentGreen, fontWeight: FontWeight.bold)),
              ),
            ],
            if (tier.isWhoOptimal) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.accentGreen.withAlpha(50),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('WHO OPTIMAL', style: TextStyle(fontSize: 9, color: AppTheme.accentGreen, fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
        subtitle: Text(
          '${tier.minMinutes}+ min/wk • ${tier.minDays}+ days/wk',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        dense: true,
      ),
    );
  }
}
