# Plan Generator

The plan generator turns a user's preferences into a persisted `WorkoutPlan` with one `PlanDay` per scheduled training day, each populated with `PlanDayExercise` rows. It is the only path to creating a plan in v1 — there is no manual editor.

Code anchor: [`PlanGenerator.generateAndSavePlan`](../lib/features/workouts/logic/plan_generator.dart).

---

## When it runs

| Trigger | Source |
|---|---|
| End of onboarding | `OnboardingScreen` → `PlanGenerator.generateAndSavePlan()` |
| User taps "Regenerate plan" in Settings | `SettingsScreen` |
| (No automatic re-generation on schema upgrades or preference edits — explicit user action only.) | — |

`generateAndSavePlan()` always **deactivates all previous plans** for the user (`isActive = false`) and inserts a new active plan in a single pass. Past `WorkoutSession` rows referencing previous `PlanDay` IDs are unaffected.

---

## Inputs

Read in this order at the start of the run:

| Source | Used for |
|---|---|
| `users.difficultyIndex` | Exercises filter (`maxDifficulty`) and exercises-per-day count |
| `users.trainingFocusIndex` | Set/rep scheme + body-part prioritization |
| `users.workoutDays` (e.g. `"1,3,5"`) | Number of days = split type; weekday assignment |
| `user_equipment` rows | Allowed equipment (always augmented with bodyweight) |
| `user_focus_bodyparts` rows | Priority body parts when `TrainingFocus.specificBodyPart` is set |
| `exercise_preferences` rows | Blacklist (excluded entirely) and favorites (probability boost) |

---

## Step 1 — Pick the split

Decided by `daysPerWeek = workoutDays.length` (`_determineSplit`):

| Days/week | Split | Plan-day pattern |
|---|---|---|
| 1–3 | **Full Body** | Every day hits all 11 body parts (excluding the meta `fullBody` enum entry) |
| 4 | **Upper / Lower** | Day 1: chest, back, shoulders, biceps, triceps · Day 2: quads, hamstrings, glutes, calves, core |
| 5 | **PPL + UL** | Push · Pull · Legs · Upper · Lower |
| 6+ | **PPL × 2** | Push · Pull · Legs · Push · Pull · Legs (and so on, modulo the pattern) |

Day labels (`_splitLabel`) are derived from the body-part set: `Full Body`, `Upper Body`, `Lower Body`, `Push`, `Pull`, `Legs`, or a `/`-joined list of parts.

The `dayOfWeek` for each `PlanDay` is taken in order from `workoutDays` (1=Mon … 7=Sun). For 5-day and 6-day splits, days cycle through the split list with `i % split.length`.

---

## Step 2 — Filter the exercise pool

```
candidates = exerciseDao.getFiltered(
  equipmentIndices: userEquipment ∪ {bodyweightFloor},
  maxDifficulty: difficulty.index,        // 0 (beginner) | 1 (intermediate) | 2 (advanced)
)
candidates = candidates - blacklisted_exercise_ids
```

- Bodyweight is **always** considered available, even if the user didn't select it.
- `maxDifficulty` is inclusive: a beginner only sees beginner exercises, intermediate sees beginner + intermediate, advanced sees everything.
- Blacklisting (`exercise_preferences.preference == 2`) is absolute; favorites (`== 1`) only bias selection.
- If `candidates` is empty after filtering, `generateAndSavePlan` returns silently without persisting anything. **The home screen surfaces no plan-day in this case** — known UX gap, see [USER_JOURNEY.md → no exercises match](USER_JOURNEY.md#user-has-no-exercises-matching-their-equipment--difficulty).

---

## Step 3 — Pick exercises for each plan day

For each plan day's body-part set, `_selectExercises` runs:

### Exercises per day

```
beginner     → 5
intermediate → 6
advanced     → 8
```

(`AppConstants.exercisesPerDay*`.)

### Selection algorithm

1. Group `candidates` by `bodyPartIndex`.
2. **Cover every target body part first.** For each body part in the day's split, pick one exercise:
   - Prefer compound movements (`muscleAction ∈ {compound, push, pull}`). If no compounds exist for that body part, fall back to all candidates.
   - **Favorites bias.** When the candidate pool contains favorites, with 70 % probability the pick is restricted to favorites only. The other 30 % the full pool is used. This is per body part, not per plan day.
   - Pick uniformly at random from the resulting pool. Skip if already used in this day.
3. **Fill remaining slots** until `exercisesPerDay` is reached:
   - If `TrainingFocus.specificBodyPart` is set and `user_focus_bodyparts` rows exist, slots beyond the first per-body-part pass prefer the focus subset.
   - Pick a random target body part, then a random unused exercise for it. If none remain, fall back to *any* unused candidate.
   - Stop early if no candidates remain.
4. **Final ordering.** Sort the day's selected exercises so compounds come first and isolations last.

### Set/rep scheme (`_setRepScheme`)

For exercises with `defaultDurationSecs != null` (timed holds / cardio), use the exercise's stored defaults verbatim. Otherwise:

| Training focus | Sets | Reps |
|---|---|---|
| `strengthBuilding` | 4 | 5 |
| `generalFitness` | 3 | 10 |
| `specificBodyPart` | 3 | 10 |
| `cardioConditioning` | 3 | 18 |
| `mobilityImprovement` | 2 | 12 |
| `flexibility` | 2 | 12 |

Tempo is taken from `exercise.defaultTempo` (the catalog default; the user can change it during a workout but the override is per-set, not per-plan).

---

## Step 4 — Persist

For each `PlanDay`:
- Insert one `plan_day_exercises` row per selected exercise, with computed `(sets, reps, durationSecs?, tempo)` and `orderIndex` from the sort.

The plan name is `"<Difficulty> <TrainingFocus> Plan"` — e.g. `"Intermediate Strength Building Plan"`.

---

## Determinism

The generator uses `dart:math` `Random()` (seeded from system time) for both the favorites bias roll and the candidate pick. **Two calls with identical inputs will produce different plans.** This is intentional — re-running "Regenerate" should give a fresh plan, not the same one.

If a deterministic plan is needed for testing, inject a seeded `Random` (currently impossible without code changes — `Random` is constructed inline). See [TESTING.md](TESTING.md) for how to expose this.

---

## Known issues / future work

| # | Issue |
|---|---|
| 1 | No surfacing when the candidate pool is empty after filtering (silent failure). |
| 2 | The 5-day split contains a logical quirk: the same body parts appear on Day 1 (Push) and Day 4 (Upper), which already includes Push muscles. Volume is intentional but an aggressive user with low recovery may want to swap in a dedicated "rest" cycle. |
| 3 | No lookahead for unilateral balance (e.g., guaranteeing both biceps and triceps appear on an arm-focused day). Random selection can occasionally pick all push or all pull movements when body parts overlap. |
| 4 | No "deload week" or progression — sets/reps are static for the lifetime of the plan. |
