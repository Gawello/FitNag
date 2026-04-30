import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/schedule_helper.dart';
import '../../../database/app_database.dart';
import '../../../database/daos/user_dao.dart';
import '../../../database/daos/workout_dao.dart';

class CalendarState {
  final Map<DateTime, List<WorkoutSession>> completedSessions;
  final Set<DateTime> scheduledDays;
  final bool loading;

  const CalendarState({
    this.completedSessions = const {},
    this.scheduledDays = const {},
    this.loading = true,
  });
}

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier() : super(const CalendarState());

  Future<void> loadMonth(int year, int month) async {
    state = CalendarState(
      completedSessions: state.completedSessions,
      scheduledDays: state.scheduledDays,
      loading: true,
    );

    final db = AppDatabase.instance;
    final userDao = UserDao(db);
    final workoutDao = WorkoutDao(db);
    final user = await userDao.getOrCreateUser();

    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 1);

    final sessions =
        await workoutDao.getSessionsByDateRange(user.id, start, end);
    final scheduledDays =
        await ScheduleHelper.getWorkoutDaysInMonth(user, year, month);

    state = CalendarState(
      completedSessions: sessions,
      scheduledDays: scheduledDays.map((d) => DateTime(d.year, d.month, d.day)).toSet(),
      loading: false,
    );
  }
}

final calendarProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>(
  (ref) => CalendarNotifier(),
);
