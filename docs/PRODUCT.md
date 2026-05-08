# Product

## One-line pitch

FitNag is an offline-first Flutter fitness app for people who **want to be reminded — pestered, even — until they actually train**. It generates a personalized plan, tracks workouts, and escalates reminder notifications across the day until you put a set on the board.

## Target user

Someone who:
- Has lost momentum to default fitness apps that send one notification and give up.
- Trains at home, the gym, or both — with or without equipment.
- Wants accountability via streaks and tier progression, not abstract analytics.
- Is comfortable with a tongue-in-cheek "drill sergeant" tone (the nag voice in [`notification_messages.dart`](../lib/core/constants/notification_messages.dart) is intentional product personality, not placeholder copy).

## Product principles

These shape every feature decision. If a proposal violates one, it needs an explicit override before merging.

1. **Offline-first.** The app must run without a network. There is no backend, no auth, no cloud sync. All data lives in `fitnag.sqlite` in the app's documents directory. The cost: no cross-device sync. The benefit: zero auth UX, zero cloud bills, zero privacy surface.
2. **Single user per install.** The schema enforces one row in `users`; multi-profile is explicitly out of scope (see Known Limitations in [README](../README.md)).
3. **The nag is the feature.** Notifications are not optional polish — they're the core value proposition. The escalation logic, tone, and timing windows are part of the product, not the platform plumbing. See [NOTIFICATIONS.md](NOTIFICATIONS.md).
4. **Plan, then react.** A plan is generated up-front from preferences (equipment, difficulty, focus, days/week) and persists until the user regenerates. The app does not silently re-balance plans based on performance.
5. **Gamification rewards consistency, not intensity.** XP and league tiers are calibrated to *show up*, not to *lift heavier*. Streak bonuses and "first workout of the week" rewards reinforce frequency. There is no "PR detection" or rep-PR badge in v1.0 (see [GAMIFICATION.md](GAMIFICATION.md)).
6. **WHO-aligned health framing.** League tiers map to WHO physical-activity guidelines (Bronze = 150 min/wk minimum, Platinum = 300 min/wk optimum, Grandmaster+ flagged as overtraining risk). Tier names lean playful, but thresholds aren't arbitrary.
7. **Dark, portrait, single language.** The theme is dark-only by design (Material 3, orange accent, defined in [`app_theme.dart`](../lib/core/theme/app_theme.dart)). Orientation is locked to portrait. Copy is English-only; there is no `lib/l10n` and no plan to add one in v1.

## Non-goals (v1.0)

These come up frequently as feature requests; they are deliberately not built:

- **Cross-device sync / cloud backup.** Implies a backend. Out of scope.
- **Social feed, friends, comparing leagues with others.** League is a personal benchmark vs. WHO, not a leaderboard.
- **AI form feedback / video analysis.** Out of scope.
- **In-app purchases, paid tiers.** App is private; no monetization.
- **Multi-language UI.** English only.
- **Multiple user profiles per device.** Schema does not support it.
- **Wearable integration (Watch, Wear OS, Health Connect).** Sessions are timed in-app from `startedAt` to `completedAt`; no external HR or step ingestion.
- **Custom plan editor (drag exercises into days).** v1 ships generated plans only; users tune via favorites/blacklist + regeneration. Manual editing is the most-requested follow-on but explicitly post-v1.
- **Per-rep weight progression suggestions.** No automatic load increase logic; the user chooses their weight each set.

## Health & safety stance

FitNag is a tracking tool, not medical advice. The disclaimer in [README](../README.md#health-disclaimer) is product copy, not legal boilerplate — the app surfaces it during onboarding and in Settings. The League system flags tiers ≥ 11 as overtraining risk in `whoContext` strings ([`league_constants.dart`](../lib/core/constants/league_constants.dart)). When adding features that could push users harder (intensity multipliers, double-XP events, "challenge a friend"), evaluate against principle 6 above.

## What "done" looks like for v1.0

A user can:

1. Open the app for the first time, complete onboarding, and have a plan generated and notifications scheduled — no further setup.
2. Be reliably nagged on workout days, with notifications surviving reboots and app backgrounding.
3. Start a workout from the home screen or directly from a notification tap.
4. Log sets (reps + weight) for each exercise, with optional tempo metronome guidance.
5. Finish a workout and see XP, badges, level progress, and streak update immediately.
6. View history, calendar, body measurements, league standing, and ad-hoc exercise sessions.
7. Regenerate the plan, change equipment, change schedule, change notification windows from Settings without losing history.

All of the above works fully offline.
