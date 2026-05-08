# Testing

## Where we are now

`test/widget_test.dart` contains three unit tests against `BmiCalculator`. That is the entire automated test surface in v1.0.

This is documented as **Technical Debt #2** in [ARCHITECTURE.md](../ARCHITECTURE.md#technical-debt). Most of the app's risk-bearing logic — XP calculation, plan generation, league promotion/demotion, streak transitions, nag scheduling — has no regression protection.

This document defines what to test next, and how to test it without drowning in fixture setup.

---

## Test categories, ranked by ROI

### 1. Pure-logic unit tests (highest ROI)

These have no Flutter, no DB, no async. Add tests in `test/<feature>/<name>_test.dart`. Targets:

| Target | File | What to assert |
|---|---|---|
| Tempo parsing | `lib/core/utils/tempo.dart` | `parse("2-1-1-0")` round-trips, malformed input falls back to default, `totalSeconds` and `phaseDescription` correctness |
| BMI | `lib/core/utils/bmi_calculator.dart` | (already covered) |
| League tier calculation | `LeagueConstants.calculateTier` | Boundary cases at each threshold, "minutes met but days not" = stays at lower tier, clamping at tier 1 / 15 |
| Schedule helper (specific weekdays + interval modes) | `ScheduleHelper.isWorkoutDay` | Each `scheduleMode` value, edge case where `intervalStartDate == null` falls back to `createdAt` |
| Notification level mapping | `NagScheduler._mapWindowsToLevels` (currently private) | Each window count 1..5 returns the documented level vector |

**Effort:** ~2 hours total. **Payoff:** prevents the next "I tweaked the league math and didn't realize it broke promotions" bug.

### 2. Logic-with-DAO tests (high ROI, medium effort)

Drift supports an in-memory `NativeDatabase.memory()` connection. The pattern:

```dart
late AppDatabase db;
setUp(() {
  db = AppDatabase.forTesting(NativeDatabase.memory());
});
tearDown(() async {
  await db.close();
});
```

This requires exposing a constructor like:

```dart
// in app_database.dart
@visibleForTesting
AppDatabase.forTesting(QueryExecutor e) : super(e);
```

Then targets become testable:

| Target | What to assert |
|---|---|
| `StreakManager.updateStreak` | First-ever workout → 1; same-day no-op; consecutive-day increment; gap reset to 1; longest tracking |
| `PlanGenerator` | Beginner with bodyweight only produces 5 exercises per day, no blacklisted ones, compounds first ordering |
| XP calculation in `finishWorkout` | Each term contributes correctly, streak cap honored, all-sets bonus only when truly all complete, empty session → 0 XP and session deleted |
| `BadgeEvaluator` | Newly-met thresholds award; idempotent on second call; time-based badges respect `completedAt.hour` |
| `LeagueManager.recalculateAndStore` | 28-day rolling window, 2-consecutive-recalculation gating, one-tier-at-a-time clamping |

**Blocker:** the singleton-DB pattern (`AppDatabase.instance`) means most logic services don't accept an injectable DB — they grab the singleton inside the function. Fixing this is the same blocker as Technical Debt #1. Two options:

- **Quick:** add an optional `AppDatabase? db` parameter to each `static` method, defaulting to the singleton. Minimal blast radius, ugly call sites.
- **Right:** convert the static services to instance classes injected via Riverpod. Larger blast radius but unblocks broad testing.

### 3. Provider tests (medium ROI)

Use `ProviderContainer` from `flutter_riverpod` to drive providers in isolation. Useful for `homeStateProvider`, `activeWorkoutProvider`, `workoutHistoryProvider`. Same DB-injection blocker applies.

### 4. Widget tests (lower ROI, pre-built scaffolding helps)

Flutter's `testWidgets` is good for verifying that:

- Conditional widgets render based on state (e.g. "Resume workout" CTA only shows when an incomplete session exists).
- User input flows through to the right notifier method.

It is *not* good for verifying real navigation, route transitions, or platform plugin behaviour (notifications, audio). Don't try to test `NagScheduler.scheduleNags()` end-to-end in a widget test.

### 5. Integration / golden tests

Out of scope for v1. The app has no CI yet; integration test infrastructure is a separate investment.

---

## What you don't need to test

- **Drift-generated code.** It's regenerated from the schema; unit-testing it tests Drift, not your app.
- **Riverpod scaffolding.** Same.
- **The third-party plugins** (`flutter_local_notifications`, `audioplayers`, `go_router`). Test the *boundary* (your code that calls them), not the plugin internals.
- **Theme constants, enum labels, exercise seed data.** These don't have logic that can break.

---

## Adding a test

1. Create the file under `test/`, mirroring the source path: `lib/features/gamification/logic/streak_manager.dart` → `test/features/gamification/logic/streak_manager_test.dart`.
2. Use `group()` per public method; one `test()` per behavioural assertion.
3. For DB-backed tests, use the in-memory pattern above. **Always** close the DB in `tearDown` or fixtures will leak across tests.
4. Names should describe behaviour, not method: `'increments streak on consecutive day'`, not `'updateStreak test 2'`.
5. Run `flutter test` locally before pushing. `flutter test --coverage` produces an `lcov.info` if you want a coverage view.

---

## Recommended order to attack the gap

If you have one afternoon, do steps 1–3. If you have two, do all of them.

1. Add tests for `Tempo.parse` and `LeagueConstants.calculateTier` (no DB needed).
2. Add tests for `ScheduleHelper.isWorkoutDay` for modes 0 and 1 (mode 2 needs the DAO).
3. Expose `AppDatabase.forTesting`. Add the in-memory fixture pattern to a `test/_helpers/` file.
4. Test `StreakManager.updateStreak` against the in-memory DB.
5. Test the XP formula by setting up a session with known sets and asserting the return of `finishWorkout`.
6. Test `PlanGenerator` with a small synthetic exercise set.
7. Wire CI to run `flutter analyze && flutter test` on every PR.
