import 'package:flutter/material.dart';

class LeagueTier {
  final int tier;
  final String name;
  final int minMinutes;
  final int minDays;
  final String description;
  final String whoContext;
  final Color color;
  final bool isWhoMinimum;
  final bool isWhoOptimal;
  final bool isOvertrainingRisk;

  const LeagueTier({
    required this.tier,
    required this.name,
    required this.minMinutes,
    required this.minDays,
    required this.description,
    required this.whoContext,
    required this.color,
    this.isWhoMinimum = false,
    this.isWhoOptimal = false,
    this.isOvertrainingRisk = false,
  });
}

class LeagueConstants {
  LeagueConstants._();

  static const List<LeagueTier> tiers = [
    LeagueTier(
      tier: 1, name: 'Dormant', minMinutes: 0, minDays: 0,
      description: 'Every journey starts somewhere',
      whoContext: 'Far below WHO recommendations',
      color: Color(0xFF616161),
    ),
    LeagueTier(
      tier: 2, name: 'Awakening', minMinutes: 30, minDays: 1,
      description: 'The first steps matter most',
      whoContext: 'Building towards activity',
      color: Color(0xFF795548),
    ),
    LeagueTier(
      tier: 3, name: 'Spark', minMinutes: 60, minDays: 2,
      description: 'A habit is forming',
      whoContext: 'Some health benefits emerging',
      color: Color(0xFFFF9800),
    ),
    LeagueTier(
      tier: 4, name: 'Ember', minMinutes: 100, minDays: 2,
      description: 'Almost at the WHO baseline',
      whoContext: 'Approaching minimum guidelines',
      color: Color(0xFFFF7043),
    ),
    LeagueTier(
      tier: 5, name: 'Bronze', minMinutes: 150, minDays: 3,
      description: 'WHO minimum achieved!',
      whoContext: 'Meeting WHO minimum of 150 min/week',
      color: Color(0xFFCD7F32),
      isWhoMinimum: true,
    ),
    LeagueTier(
      tier: 6, name: 'Silver', minMinutes: 200, minDays: 3,
      description: 'Exceeding the baseline',
      whoContext: 'Above WHO minimum',
      color: Color(0xFFC0C0C0),
    ),
    LeagueTier(
      tier: 7, name: 'Gold', minMinutes: 250, minDays: 4,
      description: 'In the optimal health zone',
      whoContext: 'Optimal activity range',
      color: Color(0xFFFFD700),
    ),
    LeagueTier(
      tier: 8, name: 'Platinum', minMinutes: 300, minDays: 4,
      description: 'Maximum WHO health benefits',
      whoContext: 'WHO maximum benefit threshold (300 min/week)',
      color: Color(0xFFE0E0E0),
      isWhoOptimal: true,
    ),
    LeagueTier(
      tier: 9, name: 'Diamond', minMinutes: 360, minDays: 5,
      description: 'Fitness enthusiast level',
      whoContext: 'Beyond standard guidelines',
      color: Color(0xFF64B5F6),
    ),
    LeagueTier(
      tier: 10, name: 'Master', minMinutes: 420, minDays: 5,
      description: 'Recovery becomes critical',
      whoContext: 'High volume — prioritize recovery',
      color: Color(0xFF7E57C2),
    ),
    LeagueTier(
      tier: 11, name: 'Grandmaster', minMinutes: 480, minDays: 6,
      description: 'Approaching elite territory',
      whoContext: 'Overtraining risk — monitor fatigue',
      color: Color(0xFFE040FB),
      isOvertrainingRisk: true,
    ),
    LeagueTier(
      tier: 12, name: 'Legend', minMinutes: 540, minDays: 6,
      description: 'Professional-level dedication',
      whoContext: 'Professional athlete territory',
      color: Color(0xFFFF1744),
      isOvertrainingRisk: true,
    ),
    LeagueTier(
      tier: 13, name: 'Titan', minMinutes: 600, minDays: 6,
      description: 'Competition-ready fitness',
      whoContext: 'Competitive athlete levels',
      color: Color(0xFFD50000),
      isOvertrainingRisk: true,
    ),
    LeagueTier(
      tier: 14, name: 'Olympian', minMinutes: 720, minDays: 7,
      description: 'Elite athlete commitment',
      whoContext: 'Elite / Olympic training volume',
      color: Color(0xFFFF6F00),
      isOvertrainingRisk: true,
    ),
    LeagueTier(
      tier: 15, name: 'Absolute Unit', minMinutes: 900, minDays: 7,
      description: 'Legendary — know your limits',
      whoContext: 'Extreme volume — overtraining warning',
      color: Color(0xFF212121),
      isOvertrainingRisk: true,
    ),
  ];

  /// Returns the tier (1-15) based on weekly minutes and days.
  static int calculateTier(double weeklyMinutes, double weeklyDays) {
    int result = 1;
    for (final tier in tiers) {
      if (weeklyMinutes >= tier.minMinutes && weeklyDays >= tier.minDays) {
        result = tier.tier;
      } else {
        break;
      }
    }
    return result;
  }

  static LeagueTier getTier(int tierNumber) {
    return tiers[(tierNumber - 1).clamp(0, tiers.length - 1)];
  }
}
