import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/exercises/screens/exercise_catalog_screen.dart';
import '../../features/exercises/screens/exercise_detail_screen.dart';
import '../../features/workouts/screens/active_workout_screen.dart';
import '../../features/workouts/screens/workout_summary_screen.dart';
import '../../features/workouts/screens/workout_history_screen.dart';
import '../../features/measurements/screens/measurements_screen.dart';
import '../../features/measurements/screens/add_measurement_screen.dart';
import '../../features/gamification/screens/league_screen.dart';
import '../../features/gamification/screens/profile_stats_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/workouts/screens/workout_calendar_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter({required bool onboardingComplete}) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: onboardingComplete ? '/' : '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/exercises',
            builder: (context, state) => const ExerciseCatalogScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) => ExerciseDetailScreen(
                  exerciseId: int.parse(state.pathParameters['id']!),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/measurements',
            builder: (context, state) => const MeasurementsScreen(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) => const AddMeasurementScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileStatsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/workout/active',
        builder: (context, state) {
          final planDayId = state.extra as int?;
          return ActiveWorkoutScreen(planDayId: planDayId);
        },
      ),
      GoRoute(
        path: '/workout/adhoc/:exerciseId',
        builder: (context, state) {
          final exerciseId = int.parse(state.pathParameters['exerciseId']!);
          return ActiveWorkoutScreen(adHocExerciseIds: [exerciseId]);
        },
      ),
      GoRoute(
        path: '/workout/resume/:sessionId',
        builder: (context, state) {
          final sessionId = int.parse(state.pathParameters['sessionId']!);
          return ActiveWorkoutScreen(resumeSessionId: sessionId);
        },
      ),
      GoRoute(
        path: '/workout/summary/:sessionId',
        builder: (context, state) => WorkoutSummaryScreen(
          sessionId: int.parse(state.pathParameters['sessionId']!),
        ),
      ),
      GoRoute(
        path: '/workout/history',
        builder: (context, state) => const WorkoutHistoryScreen(),
      ),
      GoRoute(
        path: '/calendar',
        builder: (context, state) => const WorkoutCalendarScreen(),
      ),
      GoRoute(
        path: '/league',
        builder: (context, state) => const LeagueScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(index, context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Exercises'),
          NavigationDestination(icon: Icon(Icons.straighten), label: 'Measures'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/exercises')) return 1;
    if (location.startsWith('/measurements')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/exercises');
      case 2:
        context.go('/measurements');
      case 3:
        context.go('/profile');
    }
  }
}
