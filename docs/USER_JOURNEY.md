# User Journey

This document is the canonical description of how the app behaves from the user's point of view, across the three time horizons that matter: first run, a single day, and a full week. Edge cases — misses, paused weeks, regenerations — are at the bottom.

Code anchors:
- Onboarding flow: [`lib/features/onboarding/`](../lib/features/onboarding/)
- Home aggregation: [`lib/features/home/providers/home_provider.dart`](../lib/features/home/providers/home_provider.dart)
- Active workout state machine: [`ActiveWorkoutNotifier`](../lib/features/workouts/providers/workout_provider.dart)
- Schedule resolution: [`ScheduleHelper`](../lib/core/utils/schedule_helper.dart)

---

## First run (cold start, no user data)

Trigger: app launched, `users.onboardingComplete == false`.

Router redirects to `/onboarding` (see [`app_router.dart`](../lib/core/router/app_router.dart)). The wizard has 6 or 7 steps depending on training focus (`OnboardingNotifier.totalSteps`):

| Step | Screen | Captures |
|---|---|---|
| 1 | Welcome / name | `users.name` |
| 2 | Difficulty | `Difficulty` enum (beginner / intermediate / advanced) |
| 3 | Training focus | `TrainingFocus` enum (specificBodyPart, mobility, strength, general, cardio, flexibility) |
| 3a | Target body parts | only shown if focus == `specificBodyPart`; persisted to `user_focus_bodyparts` |
| 4 | Equipment | one or more `Equipment` enums; bodyweight is **always included** (cannot be deselected) |
| 5 | Schedule | days of week (1=Mon … 7=Sun) — workout days array |
| 6 | Profile | preferred time, height, weight, notification windows (1–5 ranges) |

On finish, `OnboardingNotifier.completeOnboarding()` (single transaction):
1. Updates the singleton user row with all captured fields and `onboardingComplete = true`.
2. Replaces equipment and (if applicable) focus body parts.
3. Replaces all notification windows with the captured ranges.

Then [`onboarding_screen.dart`](../lib/features/onboarding/screens/onboarding_screen.dart) triggers (in order):
1. `PlanGenerator.generateAndSavePlan()` — builds and persists the active plan. See [PLAN_GENERATOR.md](PLAN_GENERATOR.md).
2. `NagScheduler.requestPermission()` — Android 13+ runtime `POST_NOTIFICATIONS` prompt.
3. `NagScheduler.scheduleNags()` — schedules today's reminders if today is a workout day.

The user lands on the Home screen with a generated plan and notifications armed.

---

## Daily loop

This is the "perfect day" path. Edge branches are listed afterward.

### Morning

- Home screen mounts → `homeStateProvider` (FutureProvider) loads:
  - `User`, `Streak`, total XP and current level, today's `PlanDay` (if any), incomplete sessions older than 12 h are auto-closed via `WorkoutDao.autoCloseSession`.
- Bottom nav shows: Home · Exercises · Measurements · Profile.
- If today is a workout day (per `ScheduleHelper.isWorkoutDay`), a "Start workout" CTA highlights the day's plan.

### First nag (preferred time / first window)

`NagScheduler.scheduleNags()` schedules notifications for today only:
- If notification windows are configured: one notification per window, at a random minute inside the window. Window-to-level mapping is defined in `_mapWindowsToLevels()` (see [NOTIFICATIONS.md](NOTIFICATIONS.md#window-to-level-mapping)).
- If no windows: legacy fallback at preferred time, +2 h, +4 h, +6 h, and 22:00 (level 5).
- A 22:00 emergency-level "last chance" nag is appended whenever the last window ends before 22:00.

Notifications are delivered by the OS via `flutter_local_notifications.zonedSchedule` (timezone-aware), so they fire even if the app has been killed.

### Workout

User taps "Start" (or a notification, which currently only logs the tap — payload-based deep link is not wired):

1. **Start.** Routes to `/workout/active?planDayId=<id>`. `ActiveWorkoutNotifier.initialize(planDayId)` creates a `WorkoutSession` row with `startedAt = now`, materializes plan exercises and empty `SessionSets`.
2. **First completed set.** `completeSet()` detects `wasFirstSet`. Two side effects fire:
   - `StreakManager.updateStreak(userId)` — marks today as the workout day, increments or resets the streak.
   - `NagScheduler.cancelAllNags()` — kills all pending reminders for today.
3. **Subsequent sets.** Each `completeSet` persists immediately to `session_sets` (reps, weight, completed flag). Optional rest timer (60 s default) and tempo metronome can be toggled.
4. **Tempo guidance** (optional, per exercise): user taps the metronome icon → `TempoMetronome.start(tempo)` plays audio + haptics in a 4-phase loop. See [METRONOME.md](METRONOME.md).
5. **Finish.** `finishWorkout()`:
   - Empty session (no sets completed) → `deleteSession()`, return 0 XP, no streak update.
   - Otherwise: compute XP per the formula in [GAMIFICATION.md](GAMIFICATION.md#xp-formula), persist all sets, mark session complete with `completedAt = now`, append to `xp_log`, update streak again (idempotent), recalculate league tier.
6. **Summary.** Navigates to `/workout/summary/:sessionId`. Confetti plays. Screen shows XP earned, sets logged, level/streak progress.

### Evening

- If the workout was logged: nags for today are already cancelled.
- If the workout was *not* logged: subsequent windows fire as scheduled. The 22:00 emergency message threatens the streak ("Your N-day streak expires at midnight").
- Tomorrow morning at 08:00, if the streak was broken (no workout yesterday on a workout day), `NagScheduler.scheduleMissedDayMessage()` posts one of `NagMessages.missedDay`. **Note:** the daily streak-break check (`StreakManager.checkStreakBroken`) is implemented but not yet wired to a scheduled task — `currentStreak` only resets on the *next* workout via `StreakManager.updateStreak`. Track this as known-issue #4 in [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

---

## Weekly loop

A week (Mon–Sun, week number derived from `DateTime.weekday`) is the unit for:

- **First-workout-of-week bonus** (+15 XP, see `finishWorkout()` in `workout_provider.dart`).
- **League recalculation.** `LeagueManager.recalculateAndStore()` runs after every workout but uses a 28-day rolling window, not a calendar week. Promotion and demotion require **2 consecutive recalculations** above/below threshold; tier moves one step at a time. See [GAMIFICATION.md](GAMIFICATION.md#league).
- **Calendar view** (`/calendar`) renders `table_calendar` with workout days highlighted via `ScheduleHelper.getWorkoutDaysInMonth`.

There is no notion of "weekly goals" beyond these — XP and badges accumulate cumulatively, not weekly.

---

## Schedule modes

The `users.scheduleMode` integer (0 / 1 / 2) controls what counts as a workout day. Source of truth: [`ScheduleHelper.isWorkoutDay`](../lib/core/utils/schedule_helper.dart).

| Mode | Name | "Today is a workout day if…" |
|---|---|---|
| 0 | **Specific weekdays** *(default)* | `today.weekday` is in `users.workoutDays` (e.g., `1,3,5` = Mon/Wed/Fri) |
| 1 | **Fixed interval** | `(daysSince(intervalStartDate)) % intervalDays == 0` |
| 2 | **Adaptive** | `daysSince(streak.lastWorkoutDate) >= intervalDays`. If never worked out, today is always a workout day. |

Plan generation always produces a fixed number of days = `workoutDays.length`. For interval modes, `ScheduleHelper.getRotationalDayIndex` cycles through plan days as the user progresses.

---

## Edge cases

### Missed a workout day
- Streak does not reset until the **next** workout is logged (see daily-loop note above and known-issue #4).
- The next morning's `missedDay` message is posted at 08:00 (if scheduled).
- League tier doesn't change immediately — it's a 28-day rolling average.

### Started a workout but didn't finish
- Session row stays in `workout_sessions` with `completedAt = null`.
- After 12 hours, `WorkoutDao.autoCloseSession` (called from `homeStateProvider`) closes it as incomplete with `totalXpEarned = 0`. **No streak update on auto-close.**
- Within 12 h, the home screen offers a "Resume" action → routes to `/workout/resume/:sessionId` and rehydrates state from DB.

### Notifications disabled in OS settings
- `NagScheduler.requestPermission()` returns false; nag scheduling is silently no-op'd by the OS.
- The in-app `users.notificationsEnabled` flag is independent — it's a soft kill switch in Settings even when the OS permission is granted.

### Plan regenerated mid-week
- `PlanGenerator.generateAndSavePlan()` deactivates the previous plan (sets `isActive=false`) and inserts a new one.
- Past `WorkoutSessions` keep their `planDayId` reference (foreign key is preserved). History is unaffected.
- The user's *current* streak, XP, badges, and league tier are not touched.

### First app launch on a non-workout day
- Onboarding still completes normally, plan still generates.
- `NagScheduler.scheduleNags()` posts a single rest-day message (`NagMessages.restDay`) at the user's preferred time.

### Day with zero windows configured
- Legacy fallback: notifications fire at preferred hour, +2h, +4h, +6h, and 22:00 (5 levels). See [NOTIFICATIONS.md](NOTIFICATIONS.md#legacy-fallback).

### Bodyweight unselected during onboarding
- Cannot happen: the toggle is locked on. `OnboardingNotifier.toggleEquipment` refuses to remove `Equipment.bodyweightFloor`. `PlanGenerator` also re-adds it defensively.

### User has no exercises matching their equipment + difficulty
- `PlanGenerator` returns early without persisting a plan. The home screen will show no plan day. **This case is not currently surfaced to the user** — track as a UX gap.
