# FitNag Architecture

## High-Level Overview

FitNag follows a **feature-first layered architecture** with Riverpod for state management and Drift for local SQLite persistence. All data stays on-device — there is no backend or network dependency.

```
┌──────────────────────────────────────────────────┐
│             UI Layer (Screens & Widgets)           │
│       ConsumerWidget / ConsumerStatefulWidget      │
└────────────────────┬─────────────────────────────┘
                     │  watch / read / listen
┌────────────────────▼─────────────────────────────┐
│              Riverpod Providers                    │
│   FutureProvider / StreamProvider /               │
│   StateNotifierProvider.autoDispose               │
└────────────────────┬─────────────────────────────┘
                     │  calls
┌────────────────────▼─────────────────────────────┐
│            Business Logic Services                 │
│   BadgeEvaluator · LeagueManager · StreakManager  │
│   PlanGenerator · NagScheduler · TempoMetronome   │
└────────────────────┬─────────────────────────────┘
                     │  uses
┌────────────────────▼─────────────────────────────┐
│          Data Access Objects (DAOs)                │
│   UserDao · WorkoutDao · ExerciseDao              │
│   GamificationDao · MeasurementDao · NotificationDao│
└────────────────────┬─────────────────────────────┘
                     │  Drift ORM queries
┌────────────────────▼─────────────────────────────┐
│         SQLite (local file, on-device)             │
│   fitnag.db — 18 tables, schema version 5         │
└──────────────────────────────────────────────────┘
```

---

## Module Reference

### `core/`

Pure utilities with minimal Flutter dependencies.

| File | Purpose |
|------|---------|
| `constants/app_constants.dart` | XP rewards, level thresholds, exercises-per-day by difficulty |
| `constants/exercise_constants.dart` | Enums: `BodyPart`, `Equipment`, `Difficulty`, `TrainingFocus`, `MuscleAction` |
| `constants/league_constants.dart` | 15 `LeagueTier` definitions with WHO-context minute/day thresholds |
| `constants/notification_messages.dart` | String pools for 5 nag levels + streak substitution helper |
| `router/app_router.dart` | GoRouter configuration + `ScaffoldWithNavBar` shell widget |
| `theme/app_theme.dart` | Single Material 3 dark theme — all named colors live here |
| `utils/app_logger.dart` | Thin logging wrapper (debug/warning/error) |
| `utils/bmi_calculator.dart` | Pure functions: `calculate(kg, cm)`, `category(bmi)` |
| `utils/schedule_helper.dart` | Workout-day logic for 3 schedule modes |
| `utils/tempo.dart` | `Tempo` value class and `parse("2-1-1-0")` factory |

---

### `database/`

Drift database with code generation. Access via the singleton `AppDatabase.instance`.

#### Schema — 18 Tables (version 5)

| Table | Domain | Key Columns |
|-------|--------|-------------|
| `users` | Profile | name, difficultyIndex, trainingFocusIndex, scheduleMode, workoutDays, preferredHour |
| `user_equipment` | Profile | userId, equipmentIndex |
| `user_focus_bodyparts` | Profile | userId, bodyPartIndex |
| `exercises` | Catalog | name, bodyPartIndex, equipmentIndex, defaultSets, defaultReps, defaultTempo |
| `exercise_preferences` | Catalog | userId, exerciseId, preference (0=normal / 1=favorite / 2=blacklisted) |
| `workout_plans` | Planning | userId, name, isActive |
| `plan_days` | Planning | planId, dayOfWeek, label |
| `plan_day_exercises` | Planning | planDayId, exerciseId, sets, reps, tempo |
| `workout_sessions` | History | userId, planDayId?, startedAt, completedAt, totalXpEarned |
| `session_sets` | History | sessionId, exerciseId, setNumber, repsCompleted, weightUsed, completed |
| `body_measurements` | Measurements | userId, measuredAt, weightKg, heightCm, bmi, chest, waist, hips, … |
| `streaks` | Gamification | userId, currentStreak, longestStreak, lastWorkoutDate |
| `xp_log` | Gamification | userId, amount, reason, createdAt |
| `badges` | Gamification | key, name, description, iconAsset, category |
| `user_badges` | Gamification | userId, badgeId, earnedAt |
| `user_leagues` | Gamification | userId, currentTier, weeksAboveNext, weeksBelowCurrent |
| `notification_windows` | Notifications | userId, startHour, startMinute, endHour, endMinute, orderIndex |
| `notification_log` | Notifications | userId, nagLevel, message, sentAt |

#### Migration Strategy

Sequential `if (from < N)` blocks in `onUpgrade`:
- v2: added `defaultTempo` to exercises
- v3: added `scheduleMode`, `intervalDays`, `secondaryEquipmentIndex`
- v4: added `exercise_preferences`
- v5: added `user_leagues`

#### DAOs

| DAO | Responsibilities |
|-----|-----------------|
| `UserDao` | `getOrCreateUser`, `watchUser`, `updateUser`, equipment & focus bodyparts management |
| `WorkoutDao` | Plans, plan days, plan day exercises, sessions, session sets, history queries |
| `ExerciseDao` | All exercises, filtered queries, preference management |
| `GamificationDao` | Streak CRUD, XP log, badge catalog & award tracking |
| `MeasurementDao` | Measurement CRUD, latest measurement, count |
| `NotificationDao` | Notification windows CRUD, notification log |

---

### `features/`

Each feature follows:
```
features/<name>/
├── providers/   # Riverpod state
├── screens/     # Full-page UI
├── widgets/     # Reusable UI pieces
├── logic/       # Business logic services
└── services/    # External integrations
```

#### `exercises/`
- `ExerciseCatalogScreen` — filterable list of all exercises (body part, equipment, difficulty, preference)
- `ExerciseDetailScreen` — description, instructions, image, start ad-hoc workout button
- `exercise_provider.dart` — `allExercisesProvider`, `filteredExercisesProvider`, `exercisePreferencesProvider`

#### `gamification/`
- `BadgeEvaluator` — evaluates all badge conditions after a workout; safe to call repeatedly (idempotent)
- `LeagueManager` — calculates tier from last 28 days; promotion/demotion after 2 consecutive weeks at threshold
- `StreakManager` — increments/resets streak on `updateStreak()`; `checkStreakBroken()` for daily background checks

#### `home/`
- `homeStateProvider` (FutureProvider) — aggregates user XP, level, streak, today's plan day, incomplete sessions
- Auto-closes workout sessions older than 12 hours (via `WorkoutDao.autoCloseSession`)

#### `measurements/`
- `MeasurementsScreen` — history list + BMI trend chart (fl_chart)
- `AddMeasurementScreen` — 10-field form; awards XP on save; awards `first_measurement` badge

#### `notifications/`
- `NagScheduler` — maps up to 5 `NotificationWindow` time ranges to escalation levels 1–5; falls back to fixed offsets from `preferredHour`. Uses `FlutterLocalNotificationsPlugin.zonedSchedule` (OS-level alarm via `timezone` package) so notifications survive app backgrounding and reboots. Requests `POST_NOTIFICATIONS` runtime permission on Android 13+.

#### `onboarding/`
- 6–7 step flow (difficulty → training focus → equipment → body parts → schedule → profile)
- `OnboardingNotifier` (StateNotifier) — accumulates state; `completeOnboarding()` persists everything in one pass
- Triggers `PlanGenerator.generateAndSavePlan()` + `NagScheduler.requestPermission()` + `NagScheduler.scheduleNags()` on completion

#### `settings/`
- Equipment selection, schedule mode, notification windows editor, plan regeneration, health disclaimer

#### `workouts/`
- `ActiveWorkoutNotifier` (StateNotifierProvider.autoDispose) — manages in-progress session state
- `PlanGenerator` — smart exercise selection with compound-first ordering and favorites bias
- `TempoMetronome` — static singleton with `Timer.periodic` at 1-second resolution
- `WorkoutCalendarScreen` — `table_calendar` with workout days highlighted

---

## State Management

| Provider Type | Used For | Example |
|--------------|---------|---------|
| `FutureProvider` | One-shot async loads | `homeStateProvider`, `workoutHistoryProvider` |
| `StreamProvider` | Live DB streams | `settingsUserProvider` (watches `users` table) |
| `StateNotifierProvider.autoDispose` | Complex mutable state | `activeWorkoutProvider` |
| `StateProvider` | Simple mutable values | `exerciseFilterProvider` |
| `FutureProvider.family` | Parameterized loads | `workoutSummaryProvider(sessionId)` |

**Note**: The home screen uses `FutureProvider`, not `StreamProvider`, so it does not auto-refresh on DB changes. Call `ref.invalidate(homeStateProvider)` after mutations that should be reflected immediately.

---

## Routing

GoRouter with a `ShellRoute` for the persistent bottom navigation bar.

```
/onboarding              OnboardingScreen
/ (ShellRoute)
  /                      HomeScreen
  /exercises             ExerciseCatalogScreen
    /:id                 ExerciseDetailScreen
  /measurements          MeasurementsScreen
    /add                 AddMeasurementScreen
  /profile               ProfileStatsScreen
/workout/active          ActiveWorkoutScreen  (extra: {planDayId})
/workout/adhoc/:id       ActiveWorkoutScreen  (ad-hoc single exercise)
/workout/resume/:id      ActiveWorkoutScreen  (resume incomplete session)
/workout/summary/:id     WorkoutSummaryScreen
/workout/history         WorkoutHistoryScreen
/calendar                WorkoutCalendarScreen
/league                  LeagueScreen
/settings                SettingsScreen
```

Bottom nav tabs: Home · Exercises · Measurements · Profile

---

## Data Flow: Completing a Workout

```
User taps "Finish Workout" in ActiveWorkoutScreen
  └─► ActiveWorkoutNotifier.finishWorkout()
        ├─ Guard: sessionId must not be null
        ├─ If no sets completed → deleteSession() + return 0 XP
        ├─ Calculate XP:
        │    base (50) + per-exercise (5×N) + all-sets bonus (20)
        │    + streak multiplier (streak × 2, capped at 50)
        │    + first-of-week bonus (15)
        ├─ workoutDao.completeSession(sessionId, xp, allComplete)
        ├─ gamificationDao.addXp(userId, xp, reason)
        ├─ StreakManager.updateStreak(userId)
        ├─ LeagueManager.recalculateAndStore(userId)
        └─ Navigate to /workout/summary/:sessionId

WorkoutSummaryScreen mounts
  └─► confettiController.play() + load session from DB
```

---

## Data Flow: On First Completed Set

```
ActiveWorkoutNotifier.completeSet(...)
  └─ wasFirstSet == true
       ├─ StreakManager.updateStreak(userId)   ← marks today as workout day
       └─ NagScheduler.cancelAllNags()          ← stops all pending reminders
```

---

## Plan Generation Flow

```
PlanGenerator.generateAndSavePlan()
  ├─ Load user preferences (equipment, focus body parts, difficulty)
  ├─ Deactivate all existing plans
  ├─ Determine split type:
  │    1–3 days → Full Body
  │    4 days   → Upper / Lower
  │    5 days   → PPL + Upper / Lower
  │    6+ days  → PPL × 2
  ├─ Filter exercises (exclude blacklisted, filter by equipment + difficulty)
  ├─ For each plan day:
  │    • Sort candidates: compound movements first
  │    • Apply favorites bias (70 % chance to prefer favorites)
  │    • Prioritize focus body parts if trainingFocus == specificBodyPart
  │    • Pick N exercises (beginner: 5, intermediate: 6, advanced: 8)
  │    • Assign sets/reps based on trainingFocus
  └─ Insert WorkoutPlan + PlanDays + PlanDayExercises
```

---

## XP & Level System

| Action | XP |
|--------|----|
| Complete workout (base) | 50 |
| Per exercise with work | +5 |
| All sets completed | +20 |
| Streak bonus | streak × 2 (max 50) |
| First workout of the week | +15 |
| Log measurements | 10 |

**Levels** (10 total):

| Level | Title | XP Required |
|-------|-------|-------------|
| 0 | Couch Potato | 0 |
| 1 | First Steps | 100 |
| 2 | Getting There | 300 |
| 3 | Warming Up | 600 |
| 4 | Regular | 1 000 |
| 5 | Committed | 1 600 |
| 6 | Serious | 2 400 |
| 7 | Dedicated | 3 400 |
| 8 | Elite | 4 500 |
| 9 | FitNag Legend | 5 500 |

---

## League Tier System (15 Tiers)

Tiers are calculated from the last 28 days of session data (avg weekly minutes + avg weekly days).

| Tier | Name | Min avg min/week | Min avg days/week |
|------|------|-----------------|-------------------|
| 1 | Dormant | 0 | 0 |
| 2 | Awakening | 30 | 1 |
| 3 | Spark | 60 | 2 |
| 4 | Ember | 100 | 2 |
| 5 | Bronze | 150 | 3 | ← WHO minimum |
| 6 | Silver | 200 | 3 |
| 7 | Gold | 250 | 4 |
| 8 | Platinum | 300 | 4 | ← WHO optimal |
| 9–15 | Diamond … Absolute Unit | 350–900 | 5–7 |

Promotion/demotion requires 2 consecutive recalculations above/below threshold.

---

## Technical Debt

| # | Issue | Location | Impact |
|---|-------|----------|--------|
| 1 | **Singleton DB access** — 45+ direct `AppDatabase.instance` calls inside providers | All providers | Medium: makes unit testing providers without real SQLite impossible |
| 2 | **Minimal test coverage** — only 3 unit tests (`BmiCalculator`) | `test/widget_test.dart` | Medium: critical flows (XP calc, plan gen, league) have no regression protection |
| 3 | **Calendar performance** — `ScheduleHelper.getWorkoutDaysInMonth` makes up to 30 async DB calls for adaptive schedule mode | `CalendarNotifier.loadMonth()` | Low: noticeable on slow devices in adaptive mode |
