# Notifications (the Nag system)

The notification system is the product, not just a system integration. Tone, timing, and escalation are intentional. This document specifies **when** notifications fire, **what** they say, and **how** the platform plumbing keeps them firing across reboots and Android-13-permission gates.

Code anchors:
- Scheduler: [`NagScheduler`](../lib/features/notifications/services/nag_scheduler.dart)
- Message pools: [`NagMessages`](../lib/core/constants/notification_messages.dart)
- Android manifest perms / boot receiver: [`android/app/src/main/AndroidManifest.xml`](../android/app/src/main/AndroidManifest.xml)
- Schema: `notification_windows`, `notification_log` in [`app_database.dart`](../lib/database/app_database.dart)

---

## Five escalation levels

Each level is a **pool of messages**. `NagScheduler` picks one at random, preferring messages not in the user's most-recent log entry to reduce repeats.

| Level | Tone | Title prefix | Notes |
|---|---|---|---|
| 1 | Friendly | `FitNag` | "Workout o'clock" — fired around the user's preferred time |
| 2 | Gentle guilt | `FitNag` | "Future self is giving side-eye" |
| 3 | Passive-aggressive | `FitNag` | "Couch is winning right now"; some messages reference `{streak}` |
| 4 | Dramatic | `FitNag` (level ≥ 4 → `EMERGENCY - FitNag`) | "Streak is on life support"; `{streak}` interpolation |
| 5 | Last chance | `EMERGENCY - FitNag` | "Streak expires at midnight"; always `{streak}`-aware |

`{streak}` is replaced with the user's `currentStreak` integer at scheduling time via `NagMessages.insertStreak`.

Two non-numbered pools exist:
- `restDay` — single friendly message used on non-workout days.
- `missedDay` — used by `scheduleMissedDayMessage`, posted at 08:00 the morning after a missed day.

---

## Scheduling pipeline

Entry point: `NagScheduler.scheduleNags()`. Called from:
- App startup, after onboarding completes.
- Settings changes (toggling notifications, editing windows, regenerating plan).
- Plan regeneration.

The pipeline:

```
1. Load User. If !notificationsEnabled → return.
2. Cancel ALL pending OS notifications (cancelAll).
3. If today already has a completed workout → return (no nagging needed).
4. Determine if today is a workout day via ScheduleHelper.isWorkoutDay.
   - Rest day → schedule one restDay message at preferred time → return.
5. Load today's notification windows (ordered).
6. If 0 windows → legacy fallback (preferred + 2/4/6h offsets + 22:00).
7. Otherwise: for each window, pick a random minute inside it,
   pick a random unused message from the level pool, schedule.
8. If the last window ends before 22:00 → append a level-5 emergency at 22:00.
```

Past-time scheduling is silently skipped (`_scheduleNotification` short-circuits when `scheduledTime < now`).

### Window-to-level mapping

The number of windows determines which levels fire (`_mapWindowsToLevels`):

| Windows | Levels |
|---|---|
| 1 | `[1]` |
| 2 | `[1, 3]` |
| 3 | `[1, 3, 5]` |
| 4 | `[1, 2, 4, 5]` |
| 5 | `[1, 2, 3, 4, 5]` |

Plus the 22:00 last-chance emergency (id 99) when the last window ends earlier.

### Legacy fallback

When the user has no `notification_windows` rows configured (unlikely after onboarding, but possible if migrating from older versions or after manual DB edits), the scheduler uses fixed offsets from `users.preferredHour` / `preferredMinute`:

```
preferredTime + 0 h  → level 1   (id 1)
preferredTime + 2 h  → level 2   (id 2)
preferredTime + 4 h  → level 3   (id 3)
preferredTime + 6 h  → level 4   (id 4)
midnight   - 2 h     → level 5   (id 5)
```

Only times still in the future are scheduled.

### Notification IDs

- `1..5` — windowed scheduling (one per window) or legacy fallback.
- `50` — `missedDay` morning message.
- `99` — last-chance 22:00 emergency.
- `100` — rest-day message.

Reusing IDs across days is intentional: each day's `scheduleNags()` starts with `cancelAll`, so previous IDs are wiped before new ones land.

---

## Cancellation triggers

All pending nags are cancelled when:

- **First set of any workout is completed** (`ActiveWorkoutNotifier.completeSet` calls `cancelAllNags()` when `wasFirstSet`). The user has shown up; stop pestering.
- **`scheduleNags()` is called** at the start of its run (`cancelAll` precedes new scheduling).
- **User disables notifications in Settings** — Settings screen calls `cancelAllNags` before persisting the flag.

There is no "snooze" — re-running `scheduleNags()` is the only way to re-arm.

---

## Permissions and platform plumbing

### Android 13+ runtime permission (`POST_NOTIFICATIONS`)

Required since API 33. Requested by `NagScheduler.requestPermission()`:

- Called from onboarding completion and from Settings when toggling notifications on.
- Returns `true` if granted **or** if the device is on API < 33 (where the permission isn't needed).
- If denied, scheduling silently no-ops at the OS level. The in-app `notificationsEnabled` flag stays as the user set it.

### Manifest permissions

From [`AndroidManifest.xml`](../android/app/src/main/AndroidManifest.xml):

| Permission | Why |
|---|---|
| `POST_NOTIFICATIONS` | Android 13+ runtime permission for showing notifications |
| `SCHEDULE_EXACT_ALARM` / `USE_EXACT_ALARM` | `zonedSchedule` with `AndroidScheduleMode.exactAllowWhileIdle` requires exact-alarm capability |
| `RECEIVE_BOOT_COMPLETED` | Re-registers scheduled alarms after device reboot |
| `WAKE_LOCK` | Allow alarms to wake the device for delivery |
| `VIBRATE` | Notifications and metronome haptics |

### Boot survival

The plugin's boot receiver is registered in the manifest:

```xml
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
  <intent-filter>
    <action android:name="android.intent.action.BOOT_COMPLETED"/>
    <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
    <action android:name="android.intent.action.QUICKBOOT_POWERON"/>
  </intent-filter>
</receiver>
```

On boot, the OS re-fires pending alarms via this receiver, which re-posts the notifications scheduled with `zonedSchedule`. **No user action required.**

### Channel

Single Android channel:
- ID: `fitnag_nags`
- Name: "Workout Reminders"
- Importance: HIGH
- Sound + vibration enabled

Created in `NagScheduler.initialize()` (idempotent — safe to call repeatedly).

### iOS

Permissions and platform behaviour for iOS are not currently exercised in the codebase — there is no `iOSInitializationSettings`, no `requestPermissions` for iOS, and no APNs setup. **Treat iOS as untested for notifications in v1.**

---

## Logging and debugging

Every scheduled notification logs via `AppLogger.debug` with tag `NagScheduler` (filterable in `flutter logs`). Failures use `AppLogger.warning` with the underlying exception.

`notification_log` records *delivered* messages (so the next day's scheduler can avoid repeating them). It is not a queue — there is no replay logic.

For debugging delivery, see [TROUBLESHOOTING.md → notifications not firing](TROUBLESHOOTING.md#notifications-not-firing).

---

## Tone guidelines (when adding messages)

The 5-level escalation is a personality, not a copy template. When adding messages to a pool:

- **Levels 1–3** can self-deprecate but never threaten or insult the user. The "drill sergeant" voice should land as funny, not abusive.
- **Levels 4–5** can be dramatic and reference the streak ("`{streak}`-day streak is on life support") but should still feel like a friend who cares.
- Avoid: numbers ("burn 300 calories!"), bodyshaming, profanity, ALL CAPS for whole sentences (level 5 uses caps for tags like `EMERGENCY:` only).
- All messages are English-only. There is no `lib/l10n` and no plural-form handling.

When adding a message that uses `{streak}`, double-check it still reads correctly when streak == 0 or 1. Messages that always reference the streak (level 5) assume streak ≥ 1 — gate them or write streak-agnostic alternates.
