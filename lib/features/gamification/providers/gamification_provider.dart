import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/gamification_dao.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/workout_dao.dart';

class ProfileStats {
  final int totalXp;
  final int currentLevel;
  final String levelTitle;
  final double levelProgress;
  final int currentStreak;
  final int longestStreak;
  final int totalWorkouts;
  final List<Badge> allBadges;
  final Set<int> earnedBadgeIds;
  final List<XpLogData> recentXp;

  const ProfileStats({
    this.totalXp = 0,
    this.currentLevel = 1,
    this.levelTitle = 'Couch Potato',
    this.levelProgress = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.totalWorkouts = 0,
    this.allBadges = const [],
    this.earnedBadgeIds = const {},
    this.recentXp = const [],
  });
}

final profileStatsProvider = FutureProvider<ProfileStats>((ref) async {
  final db = AppDatabase.instance;
  final userDao = UserDao(db);
  final gamificationDao = GamificationDao(db);
  final workoutDao = WorkoutDao(db);

  final user = await userDao.getOrCreateUser();
  final totalXp = await gamificationDao.getTotalXp(user.id);
  final streak = await gamificationDao.getOrCreateStreak(user.id);
  final totalWorkouts = await workoutDao.getCompletedSessionCount(user.id);
  final allBadges = await gamificationDao.getAllBadges();
  final userBadges = await gamificationDao.getUserBadges(user.id);
  final recentXp = await gamificationDao.getRecentXpLog(user.id);

  int level = 1;
  String title = AppConstants.levels[0].title;
  double progress = 0;

  for (int i = AppConstants.levels.length - 1; i >= 0; i--) {
    if (totalXp >= AppConstants.levels[i].xp) {
      level = i + 1;
      title = AppConstants.levels[i].title;
      final currentLevelXp = AppConstants.levels[i].xp;
      final nextLevelXp = i < AppConstants.levels.length - 1
          ? AppConstants.levels[i + 1].xp
          : AppConstants.levels[i].xp;
      final range = nextLevelXp - currentLevelXp;
      progress = range > 0 ? (totalXp - currentLevelXp) / range : 1.0;
      break;
    }
  }

  return ProfileStats(
    totalXp: totalXp,
    currentLevel: level,
    levelTitle: title,
    levelProgress: progress.clamp(0.0, 1.0),
    currentStreak: streak.currentStreak,
    longestStreak: streak.longestStreak,
    totalWorkouts: totalWorkouts,
    allBadges: allBadges,
    earnedBadgeIds: userBadges.map((b) => b.badgeId).toSet(),
    recentXp: recentXp,
  );
});
