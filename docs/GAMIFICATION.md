# Gamification

The motivation system has four mechanics, each independent: **XP**, **levels**, **streaks**, **badges**, **leagues**. They share no state; mutating one does not mutate the others. They are all evaluated on workout completion (`finishWorkout` in `workout_provider.dart`), except streaks, which also update on the *first completed set*.

Code anchors:
- Numerical constants: [`lib/core/constants/app_constants.dart`](../lib/core/constants/app_constants.dart)
- League tiers: [`lib/core/constants/league_constants.dart`](../lib/core/constants/league_constants.dart)
- Badge catalog (seeded): [`lib/seed/badge_seed_data.dart`](../lib/seed/badge_seed_data.dart)
- Logic: [`StreakManager`](../lib/features/gamification/logic/streak_manager.dart), [`LeagueManager`](../lib/features/gamification/logic/league_manager.dart), [`BadgeEvaluator`](../lib/features/gamification/logic/badge_evaluator.dart)

---

## XP formula

Computed inside `ActiveWorkoutNotifier.finishWorkout()`. Run order matters because some terms reference DB state that earlier steps have already written.

```
xp = xpWorkoutBase                                       (= 50)
   + xpPerExercise × (exercises with ≥1 completed set)   (= 5 each)
   + xpAllSetsBonus  if every set in every exercise was completed  (= 20)
   + min(currentStreak × xpStreakMultiplier, xpStreakCap)   (= streak × 2, max 50)
   + xpFirstWorkoutOfWeek  if no completed session this Mon-onwards  (= 15)
```

Other XP sources (called from their respective screens, not from `finishWorkout`):

| Action | XP | Constant |
|---|---|---|
| Log body measurement | 10 | `xpLogMeasurements` |
| Personal best (declared but unused in v1) | 25 | `xpPersonalBest` |

**Important behavioural notes:**

- An empty session (no sets completed) is **deleted**, not saved with 0 XP. No streak update, no XP log row.
- The streak bonus is computed *before* the post-workout `StreakManager.updateStreak` call — so it uses yesterday's streak count, not today's. This is intentional: today's increment becomes tomorrow's bonus.
- "First workout of the week" looks at sessions completed since `now - (weekday - 1)` days, which is Monday 00:00. Sunday is the last day of the previous week.
- Every awarded XP value is appended to `xp_log` with a human-readable `reason` string. Total XP is `SUM(xp_log.amount)`; there is no cached level column.

---

## Levels (10 tiers)

| Level | Title | XP required |
|---|---|---|
| 0 | Couch Potato | 0 |
| 1 | First Steps | 100 |
| 2 | Getting There | 300 |
| 3 | Warming Up | 600 |
| 4 | On a Roll | 1 000 |
| 5 | Dedicated | 1 500 |
| 6 | Beast Mode | 2 200 |
| 7 | Iron Will | 3 000 |
| 8 | Unstoppable | 4 000 |
| 9 | FitNag Legend | 5 500 |

Source: `AppConstants.levels`. Level is derived: the highest entry whose `xp` ≤ user total. There is no level-up animation/notification distinct from the workout summary screen.

> **Doc-vs-code mismatch.** [README](../README.md) and [ARCHITECTURE.md](../ARCHITECTURE.md) list slightly different titles and thresholds for some levels. Treat the table above (matching `app_constants.dart`) as authoritative; both other documents will be aligned in a follow-up.

---

## Streaks

A streak is a count of **consecutive days on which a workout was logged**. Stored in the singleton `streaks` row per user.

### Update rule (`StreakManager.updateStreak`)

Called twice per workout: once on the *first completed set* (so the user gets streak credit even if they bail on finishing), and once on `finishWorkout`. The second call is idempotent: if `lastWorkoutDate == today`, it returns immediately.

| Days since last workout | New `currentStreak` |
|---|---|
| First workout ever | 1 |
| 0 (already logged today) | unchanged |
| 1 (yesterday) | previous + 1 |
| ≥ 2 | reset to 1 |

`longestStreak` is updated to `max(longestStreak, currentStreak)`.

### Break check (`StreakManager.checkStreakBroken`)

This *is* implemented and resets `currentStreak` to 0 if more than 1 day has elapsed without a workout — but it is **not currently wired to any scheduled task**, so the streak displayed on the home screen can be stale until the next workout. See [TROUBLESHOOTING.md](TROUBLESHOOTING.md#streak-not-resetting-after-missed-day).

---

## Badges

Awarded by `BadgeEvaluator.evaluate(userId)`, called from `WorkoutSummaryScreen` after a workout and from `AddMeasurementScreen` after a measurement save. Idempotent (double-award is prevented by `_tryAward`).

### Currently evaluated

| Key | Trigger | Badge name |
|---|---|---|
| `streak_3` | streak ≥ 3 | Hot Start |
| `streak_7` | streak ≥ 7 | Week Warrior |
| `streak_14` | streak ≥ 14 | Fortnight Force |
| `streak_30` | streak ≥ 30 | Monthly Machine |
| `streak_90` | streak ≥ 90 | Quarter Beast |
| `workout_1` | total completed sessions ≥ 1 | First Rep |
| `workout_10` | … ≥ 10 | Getting Serious |
| `workout_50` | … ≥ 50 | Half Century |
| `workout_100` | … ≥ 100 | Centurion |
| `first_measurement` | ≥ 1 body measurement logged | Measured Up |
| `early_bird` | last completed session's `completedAt.hour < 7` | Early Bird |
| `night_owl` | last completed session's `completedAt.hour >= 21` | Night Owl |

### Seeded but **not** evaluated (catalog only)

These badges are inserted by [`BadgeSeedData`](../lib/seed/badge_seed_data.dart) but never awarded — their conditions don't have evaluator code yet:

`chest_20`, `back_20`, `legs_20`, `arms_20`, `core_20`, `measurement_4weeks`, `weekend_warrior`, `perfect_week`.

When implementing the next batch of badge conditions, add the check in `BadgeEvaluator.evaluate` and update this table. Don't change the badge `key` — it's the join column in `user_badges`.

---

## League

Tier ranking on a 1–15 scale, derived from a **28-day rolling window** of completed sessions. Source: [`LeagueManager.calculateCurrentLeague`](../lib/features/gamification/logic/league_manager.dart) and [`LeagueConstants.tiers`](../lib/core/constants/league_constants.dart).

### Inputs

For each session in the last 28 days where `completedAt != null`:
- Add `completedAt - startedAt` minutes to total minutes.
- Add `completedAt`'s date to a Set (counts unique days, not sessions).

```
weeksOfData     = clamp(daysSince(earliestSession) / 7, 1, 4)
avgWeeklyMins   = totalMinutes / weeksOfData
avgWeeklyDays   = uniqueDayCount / weeksOfData
```

### Tier table

| Tier | Name | Min min/wk | Min days/wk | WHO context |
|---|---|---|---|---|
| 1 | Dormant | 0 | 0 | far below |
| 2 | Awakening | 30 | 1 | building |
| 3 | Spark | 60 | 2 | some benefits |
| 4 | Ember | 100 | 2 | approaching min |
| 5 | **Bronze** | 150 | 3 | **WHO minimum** |
| 6 | Silver | 200 | 3 | above min |
| 7 | Gold | 250 | 4 | optimal |
| 8 | **Platinum** | 300 | 4 | **WHO optimum** |
| 9 | Diamond | 360 | 5 | beyond guidelines |
| 10 | Master | 420 | 5 | recovery critical |
| 11 | Grandmaster | 480 | 6 | overtraining risk |
| 12 | Legend | 540 | 6 | overtraining risk |
| 13 | Titan | 600 | 6 | overtraining risk |
| 14 | Olympian | 720 | 7 | overtraining risk |
| 15 | Absolute Unit | 900 | 7 | overtraining risk |

`calculateTier` walks the list and returns the highest tier where **both** thresholds are met. Both must be satisfied — being above on minutes alone keeps you at the previous tier.

### Promotion / demotion (`LeagueManager.recalculateAndStore`)

Tier changes are dampened to prevent oscillation:

- **Promotion:** if `calculatedTier > storedTier`, increment `weeksAboveNext`. After 2 consecutive recalculations above, advance **one** tier (you don't skip from 3 to 7 in a single week).
- **Demotion:** if `calculatedTier < storedTier`, increment `weeksBelowCurrent`. After 2 consecutive recalculations below, drop **one** tier.
- **Stable:** counters reset.
- Recalculation runs after every `finishWorkout`, so "consecutive" effectively means "consecutive workouts", not "consecutive weeks". On a high-frequency week a user can be promoted in 2 workouts.

`weeksAtCurrentTier` increments when the tier doesn't change (it's a counter for UI display, not a gate).

`currentTier` is clamped to `[1, 15]`.

---

## Where each mechanic surfaces in the UI

| Mechanic | Screens / widgets |
|---|---|
| XP total + level | `HomeScreen`, `ProfileStatsScreen`, `WorkoutSummaryScreen` |
| Streak | `HomeScreen` header, `ProfileStatsScreen`, nag messages (string interpolation `{streak}`) |
| Badges | `ProfileStatsScreen` recent badges, `WorkoutSummaryScreen` confetti reveal |
| League | `LeagueScreen`, `LeagueBadgeWidget` on `HomeScreen` |
