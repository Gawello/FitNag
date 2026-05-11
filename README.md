# FitNag — Your Persistently Motivating Fitness Companion

> A Flutter fitness tracking app that won't let you forget leg day.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11-blue.svg)](https://dart.dev)

## What is FitNag?

FitNag is a mobile fitness application built with Flutter that combines personalized workout tracking with a gamified motivation system. The app generates workout plans tailored to your equipment, fitness level, and goals — and, true to its name, sends escalating reminder notifications when you skip a workout day.

## Features

- **Personalized Workout Plans** — automatically generates a plan (Full Body / Upper-Lower / Push-Pull-Legs split) based on your available equipment, difficulty level, and training focus. Prefers compound movements and your favorited exercises.
- **5-Level Notification Escalation** — friendly reminders escalate from "Hey, don't forget!" to full emergency-level nags by end of day, across up to 5 configurable time windows.
- **Gamification System** — earn XP after each workout, level up through 10 tiers (Couch Potato → FitNag Legend), maintain workout streaks, climb a 15-tier activity league (Dormant → Absolute Unit), and unlock 12+ achievement badges.
- **Tempo Metronome** — audio and haptic metronome synchronized to your exercise rep tempo (eccentric / pause / concentric / top). Four sound sets: beep, click, woodblock, vibration-only.
- **Body Measurements** — log weight, BMI, and 9 body circumference measurements. View trends over time.
- **3 Schedule Modes** — specific weekdays, fixed interval (every N days), or adaptive scheduling.
- **Exercise Catalog** — browsable and filterable library of exercises. Mark favorites or blacklist ones you dislike; the plan generator respects both.
- **Workout History & Calendar** — review past sessions and see your activity visualized on a calendar.

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter 3.x / Dart 3.11 |
| State Management | Riverpod 2.x (FutureProvider, StreamProvider, StateNotifierProvider) |
| Database | Drift ORM + SQLite (18 tables, schema v5) |
| Routing | GoRouter 14.x with ShellRoute (bottom nav) |
| Notifications | flutter_local_notifications + timezone (zonedSchedule) |
| Audio | audioplayers 6.x |
| Charts | fl_chart |
| Calendar | table_calendar |
| Animations | confetti |

## Project Structure

```
lib/
├── main.dart                    # Entry point: orientation lock, DB seed, metronome + notification init
├── app.dart                     # Root widget (FitNagApp), router initialization
├── core/
│   ├── constants/               # XP values, enums (BodyPart, Equipment…), league tiers
│   ├── router/app_router.dart   # GoRouter config + ScaffoldWithNavBar shell
│   ├── theme/app_theme.dart     # Material 3 dark theme (all colors defined here)
│   └── utils/                   # BmiCalculator, ScheduleHelper, Tempo, AppLogger
├── database/
│   ├── app_database.dart        # Drift database (18 tables, migrations v1→v5)
│   └── daos/                    # 6 Data Access Objects (user, workout, exercise,
│                                #   gamification, measurement, notification)
├── features/
│   ├── exercises/               # Catalog screen, detail screen, preferences
│   ├── gamification/            # BadgeEvaluator, LeagueManager, StreakManager
│   ├── home/                    # Dashboard (XP, streak, today's plan)
│   ├── measurements/            # Body measurement logging and history
│   ├── notifications/           # NagScheduler (5-level escalation)
│   ├── onboarding/              # Multi-step first-run setup
│   ├── settings/                # Equipment, schedule, notification windows
│   └── workouts/                # Active workout, history, calendar, plan generator,
│                                #   tempo metronome
└── seed/                        # Initial exercise and badge data (loaded once)
```

## Getting Started

### Prerequisites

- Flutter SDK >= 3.11.3 ([install](https://docs.flutter.dev/get-started/install))
- Dart SDK >= 3.11.3 (bundled with Flutter)
- Android SDK (for Android targets) or Xcode 15+ (for iOS/macOS)

### Setup

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/fitnag.git
cd fitnag

# Install dependencies
flutter pub get

# Regenerate Drift + Riverpod code (required after any schema/provider changes)
dart run build_runner build --delete-conflicting-outputs

# Run on a connected device or emulator
flutter run
```

### Running Tests

```bash
flutter test
```

### Static Analysis

```bash
flutter analyze
```

### Building for Release

```bash
# Android APK (universal)
flutter build apk --release

# Android App Bundle (Play Store)
flutter build appbundle --release

# iOS (requires Xcode on macOS)
flutter build ios --release
```

## Documentation

The `docs/` folder is the canonical spec for product behavior, mechanics, and engineering workflow. Start with [`docs/README.md`](docs/README.md) for the index. Highlights:

- [docs/PRODUCT.md](docs/PRODUCT.md) — product principles, target user, non-goals
- [docs/USER_JOURNEY.md](docs/USER_JOURNEY.md) — first-run, daily and weekly loops, edge cases
- [docs/GAMIFICATION.md](docs/GAMIFICATION.md) — XP formulas, levels, streaks, badges, leagues
- [docs/NOTIFICATIONS.md](docs/NOTIFICATIONS.md) — 5-level escalation, windows, Android plumbing
- [docs/METRONOME.md](docs/METRONOME.md) — tempo notation, 4-phase cycle, sound sets
- [docs/PLAN_GENERATOR.md](docs/PLAN_GENERATOR.md) — split selection, exercise filtering, ordering
- [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) — local setup, schema migrations, conventions
- [docs/TESTING.md](docs/TESTING.md) — current state and recommended targets
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) — common dev and runtime issues
- [docs/RELEASE.md](docs/RELEASE.md) — pre-release checklist and build commands
- [docs/GLOSSARY.md](docs/GLOSSARY.md) — domain terms

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed documentation covering the layered architecture, database schema, state management patterns, routing, data flows, and technical debt inventory.

## Known Limitations

1. **No dependency injection for the database** — `AppDatabase.instance` is accessed directly inside providers, making unit testing of providers difficult without a real SQLite file.
2. **Single-user design** — the database schema supports only one user row (created via `UserDao.getOrCreateUser()`). Multi-profile support would require a schema migration.

## Contributing

1. Fork the repository and create a feature branch: `git checkout -b feat/your-feature`
2. Follow [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`
3. Run `flutter analyze` and `flutter test` — both must pass before opening a PR
4. Open a Pull Request with a clear description of what changed and why

## Health Disclaimer

FitNag is a fitness tracking tool, not medical advice. Consult a qualified healthcare professional before starting any exercise program, especially if you have pre-existing health conditions. Stop exercising if you feel pain, dizziness, or discomfort.

## License

Proprietary — © 2026 Gaweł Banasik. All rights reserved. See [LICENSE](LICENSE).

Third-party components (the `free-exercise-db` image dataset, Dart/Flutter
packages, Material Icons, etc.) are used under their own licenses.
See [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) for the full
attribution list.
