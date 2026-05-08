# Troubleshooting

Recurring issues during development and runtime. If you fix one not listed here, add it.

---

## Build & toolchain

### `dart run build_runner build` fails with "conflicting outputs"

Run with `--delete-conflicting-outputs`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

This is the default during normal development; the warning happens when generated files exist from an older schema and Drift refuses to overwrite them silently.

### Generated `.g.dart` files have phantom changes after a regen

Drift sometimes embeds timestamps or hashes that change without a real schema diff. Inspect with `git diff` — if every change is purely cosmetic (whitespace, comment tags), commit them or `git checkout` and re-run regen on a clean tree.

### `flutter pub get` fails after pulling

Most common cause: Flutter SDK version drift. Project requires `^3.11.3`. Run `flutter --version`. Upgrade with `flutter upgrade`, or use FVM if you maintain multiple Flutter versions.

### App fails to launch on emulator with "Could not find package: …"

Run `flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs`. Build_runner sometimes leaves orphaned references when `pubspec.yaml` changes.

---

## Database

### "Schema mismatch" or "table X doesn't exist" after pulling

A teammate added a table or column. The local DB on your device/emulator is on an older schema. Two options:

- **Uninstall the app** from the target device (clears the DB file). Fastest.
- **Bump `schemaVersion` and add a migration block.** Required if real users are upgrading. See [DEVELOPMENT.md → schema changes](DEVELOPMENT.md#database-schema-changes).

### Migration blew up in production but works on fresh install

Migration paths must be cumulative and forward-only. A user upgrading v3 → v5 runs the v4 *and* v5 blocks in sequence. Test by:

1. Check out the v3 commit.
2. Install and run to seed a v3 DB.
3. Check out current `main`.
4. Run again. If the upgrade fails, the failing block is in `onUpgrade`.

Never call `customStatement('ALTER TABLE …')` for schema changes that Drift's `Migrator` can express — they break when column types diverge.

### Want to inspect the DB

The file is at `<app documents directory>/fitnag.sqlite`. On Android: `adb shell run-as <package> ls /data/data/<package>/app_flutter/`. Pull with `adb exec-out run-as <package> cat …/fitnag.sqlite > local.sqlite`, then open with any SQLite browser.

---

## Notifications

### Notifications not firing

Walk this list in order:

1. **OS permission.** On Android 13+, settle for the runtime prompt. Check `Settings → Apps → fitnag → Notifications` is enabled.
2. **Battery / power optimization.** Several Android OEMs (Xiaomi, Samsung, Huawei) kill background alarms aggressively. Add the app to the OEM's "no battery optimization" list. There is no programmatic workaround that works reliably across OEMs.
3. **Exact alarm permission** (Android 12+). The app declares `SCHEDULE_EXACT_ALARM` and `USE_EXACT_ALARM`. On API 31+, exact alarms can be revoked by the user — check `Settings → Apps → Special access → Alarms & reminders`.
4. **Notifications enabled flag.** `users.notificationsEnabled` is the in-app kill switch. Toggle in Settings → re-runs `scheduleNags()`.
5. **Today's already-completed workout.** `scheduleNags()` exits early if a workout was completed today. This is by design.
6. **Past schedule times.** `_scheduleNotification` silently skips times in the past. If you triggered scheduling at 3 p.m. and your only window was 09:00–11:00, nothing fires today.
7. **Logs.** Run `flutter logs` and look for `NagScheduler` debug entries: `Scheduled nag #N at <time>`.

### Notifications fire but don't survive reboot

Verify `<receiver>` for `ScheduledNotificationBootReceiver` is present in [`AndroidManifest.xml`](../android/app/src/main/AndroidManifest.xml). The plugin requires this receiver to re-fire pending alarms. If it's missing, scheduled alarms are lost on reboot.

### Notification taps do nothing

Currently `_onNotificationTap` only logs the payload. Deep-linking from a tap into the active workout flow is not implemented in v1. Track as a follow-on.

---

## Streaks & gamification

### Streak not resetting after missed day

Known issue. `StreakManager.checkStreakBroken` exists but is not wired to a scheduled task. As a result, `currentStreak` remains stale on the home screen until the *next* workout, at which point `updateStreak` resets it to 1.

Workaround: a workout will resolve it. Future fix: call `checkStreakBroken` from a `WorkManager` / `android_alarm_manager_plus` job at midnight, or from the `homeStateProvider` cold-load path.

### "First workout of the week" bonus didn't fire (or fired twice)

The check is `sessions.where((s) => s.completedAt > startOfWeek).isEmpty`. Edge cases:

- Crossing midnight Sunday → Monday in the middle of a workout: `startedAt` is in the old week but `completedAt` is in the new week. The session counts toward the new week. The next workout this week will *not* get the bonus.
- Time zone changes (DST or travel) can move `startOfWeek` by an hour. Workouts logged near midnight on Sunday may flip into the previous or next bucket.

### League tier won't promote

Promotion requires 2 *consecutive* recalculations above the next tier — see [GAMIFICATION.md → promotion / demotion](GAMIFICATION.md#promotion--demotion). One great week is not enough; you need two.

The 28-day window also matters: recalculation averages **across the last 28 days**, so a single big day raises the average less than expected. Verify with `LeagueManager.calculateCurrentLeague(userId)` — the returned `tier` is the calculated value, not necessarily what's stored.

---

## Audio / metronome

### Metronome silent, vibration works

Likely the device is set to ringer-silent. Audio is played with `AudioContextAndroid.audioFocus = none` and `usageType = game`, which respects the silent ringer on most devices. This is intentional — we don't want to override the user's silent mode. If the user expects sound, switch off vibration-only and ensure media volume is up.

### Metronome ticks lag or skip on first run

The first `AudioPlayer` instance has a small initialization cost on Android. Subsequent ticks are smoother. There is no warm-up step in v1 (a previous attempt was rolled back — see comments in [`tempo_metronome.dart`](../lib/features/workouts/services/tempo_metronome.dart)).

If lag is consistently bad, the per-call `AudioPlayer` strategy may need replacement with a pre-loaded pool. This was deferred because audioplayers' low-latency mode doesn't tolerate concurrent `play()` on a single player.

### Tempo never advances past first phase

Check the parsed tempo: a `0-0-0-0` (or any invalid string that falls back to default but is then overridden) makes `Tempo.totalSeconds == 0`, and `start()` no-ops. `Tempo.parse` returns the default `2-1-1-0` on any malformed input — verify the exercise's `defaultTempo` column.

---

## UI / state

### Home screen doesn't refresh after a workout

`homeStateProvider` is a `FutureProvider`, not a `StreamProvider`. After mutations that should be visible immediately, the calling code must call `ref.invalidate(homeStateProvider)`. Most mutation paths already do this; if you've added a new path, make sure to invalidate.

### Workout summary screen shows 0 XP

If the user finished a session with no completed sets, `finishWorkout()` deletes the session and returns 0. The summary screen still mounts because navigation already pushed. The 0-XP display is correct in that case.

### Active workout state is lost when navigating away

`activeWorkoutProvider` is `.autoDispose`. Leaving the screen kills it. Re-entering rehydrates from the persisted `WorkoutSession` via `resumeSession()`. If state appears inconsistent after a backgrounding event, verify `WorkoutDao.autoCloseSession` hasn't already closed a 12+ hour-old session.

---

## Logging

All logs go through `AppLogger` with module tags (`NagScheduler`, `WorkoutProvider`, `TempoMetronome`, etc.). Filter `flutter logs` by tag:

```bash
flutter logs | grep NagScheduler
```

Structured logging beyond a tagged-string approach is not implemented.
