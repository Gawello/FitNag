# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

FitNag is a Flutter 3.x / Dart 3.11 offline-first single-user fitness tracker. Riverpod 2.x for state, Drift + SQLite for persistence (no backend), GoRouter with a `ShellRoute`, `flutter_local_notifications` with `zonedSchedule` for escalating reminders, `audioplayers` for a tempo metronome. Dark theme only, portrait only, English-only inline strings (no `l10n`).

## Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs  # mandatory after pull / schema / annotated-provider changes
flutter run
flutter analyze        # must be clean before opening a PR
flutter test           # currently 3 BmiCalculator unit tests
flutter test test/path/to/file_test.dart                  # single test file
flutter test --plain-name "increments streak on consecutive day"  # single test by name
```

`build_runner` regenerates `lib/database/app_database.g.dart`, `lib/database/daos/*.g.dart`, and Riverpod boilerplate. **The generated `.g.dart` files are committed.** They sometimes appear in `git status` after a clean regen — verify the diff is cosmetic before committing.

Build for release: `flutter build appbundle --release` (Play Store) or `flutter build apk --release` (sideload). See [docs/RELEASE.md](docs/RELEASE.md) for the full pre-release checklist.

## Architecture — the big picture

[ARCHITECTURE.md](ARCHITECTURE.md) is the canonical map. It documents the layered architecture (UI → Riverpod → services → DAOs → SQLite), the **18-table schema (v5)** with per-table column lists, the migration sequence (v1 → v5), every DAO's responsibilities, all data flows (workout completion, plan generation, first-set side effects), the XP/level formulas, and the 15-tier league math. Read it before designing anything that crosses two features.

[docs/](docs/) is the canonical spec for product behavior and mechanics — each file is scoped to one concern. Notable:

- [docs/GAMIFICATION.md](docs/GAMIFICATION.md) — exact XP constants, level thresholds, streak rules, 12 evaluated badges + 8 seeded-but-unused, league recalc gating
- [docs/NOTIFICATIONS.md](docs/NOTIFICATIONS.md) — 5-level escalation, window-count → level-vector mapping, Android 13+ permission flow, boot survival via `ScheduledNotificationBootReceiver`
- [docs/PLAN_GENERATOR.md](docs/PLAN_GENERATOR.md) — split selection (1–3 days → Full Body, 4 → U/L, 5 → PPL+UL, 6+ → PPL×2), 70% favorites bias, focus body part prioritization
- [docs/METRONOME.md](docs/METRONOME.md) — tempo notation `E-P-C-T`, 4-phase loop, sound sets, sound file provenance
- [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) — full workflow including schema-change steps and feature-module recipe
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) — recurring build, DB, notification, audio, and state issues

## Conventions specific to this codebase

### State management
- `FutureProvider` for one-shot loads (`homeStateProvider`, `workoutHistoryProvider`). **They do not auto-refresh on DB writes.** After a mutation that should be visible immediately, call `ref.invalidate(<provider>)`. Most existing mutation paths already do this.
- `StreamProvider` for live DB-driven state (`settingsUserProvider` watches the `users` table via `UserDao.watchUser()`).
- `StateNotifierProvider.autoDispose` for complex per-screen mutable state. **`activeWorkoutProvider` is autoDispose** — navigating away kills it. Re-entering rehydrates via `WorkoutDao.autoCloseSession` + `resumeSession()`.
- Singletons (`AppDatabase.instance`, `NagScheduler`, `TempoMetronome`) are accessed statically, not via providers. This is intentional for now; see Technical Debt #1.

### Database
- All persistence is through DAOs in `lib/database/daos/`. Direct `AppDatabase` queries from feature code is a smell — extend the DAO.
- Schema changes: bump `schemaVersion` in `AppDatabase`, add an `if (from < N)` block in `onUpgrade`, regen. Migrations are **cumulative and forward-only** — a v3 → v5 upgrade runs both v4 and v5 blocks. Test on a real previous-version DB, not just a fresh install. Update [ARCHITECTURE.md](ARCHITECTURE.md) schema table in the same commit.
- `AppDatabase.instance` is a singleton. There is no DI for the DB yet — this blocks unit testing most logic services (Technical Debt #1 in ARCHITECTURE.md, with the workaround plan in [docs/TESTING.md](docs/TESTING.md)).

### Constants and enums
- `lib/core/constants/exercise_constants.dart` is the source of truth for `BodyPart`, `Equipment`, `Difficulty`, `TrainingFocus`, `MuscleAction`. Tables store the **enum `.index`**, not strings. Don't introduce parallel string enums.
- XP rewards, level thresholds, exercises-per-day are in `lib/core/constants/app_constants.dart`. League tiers (15) are in `lib/core/constants/league_constants.dart`.

### Notifications
- `NagScheduler.scheduleNags()` uses `FlutterLocalNotificationsPlugin.zonedSchedule` (not `schedule` — the old API was deprecated). Times are computed against the device's local timezone via the `timezone` package.
- Android 13+ requires the runtime `POST_NOTIFICATIONS` prompt. `NagScheduler.requestPermission()` is the only path that should request it — onboarding and the Settings toggle both call it.
- Boot survival depends on `ScheduledNotificationBootReceiver` in `AndroidManifest.xml`. If you touch the manifest, verify it's still wired.
- `scheduleNags()` is a no-op if a workout was completed today — by design. It also silently skips windows whose times are in the past.

### Audio (metronome)
- `TempoMetronome` is a **static singleton** with module-level state. Use `TempoMetronome.start(tempo)` / `.stop()` / `.setSoundSet(...)`; don't instantiate.
- A fresh `AudioPlayer` is created per playback (not pooled). Intentional — see comments in `tempo_metronome.dart`. Don't "optimize" this without reading the history.
- Sound files in `assets/sounds/` were generated procedurally with FFmpeg (see `assets/sounds/CREDITS.md`). Replacements must keep the same names or update `MetronomeSoundSet.assetPrefix`.

### Lints
- `analysis_options.yaml` enables `prefer_single_quotes` and `unawaited_futures` on top of `flutter_lints`. `avoid_print` is **intentionally not enabled** because `AppLogger.error` uses `print()` so errors surface in release builds.
- Logging goes through `AppLogger` in `lib/core/utils/app_logger.dart` with short module tags (`NagScheduler`, `WorkoutProvider`, etc.). No `print`/`debugPrint` calls in feature code.

### Style
- No comments unless the *why* is non-obvious. The codebase keeps identifiers self-explanatory; comments are reserved for hidden invariants, workarounds, or surprising platform behaviour.
- Imports follow Flutter's default order: `dart:*`, `package:*`, then relative.

## Workflow gotchas

- **PR-based merges only.** Direct pushes to `main` are blocked by policy. Create a feature branch (`feat/...`, `fix/...`, `docs/...`), push it, open a PR.
- **Conventional Commits.** Recent log shows the project tone — e.g. `fix(workout): remove remaining state.sessionId! in completeSet`, `docs(licensing): add LICENSE, ...`.
- **One concern per commit.** A schema migration + UI feature in the same commit is too much.
- Never amend or force-push commits that have reached `main`.
- When committing on Windows, expect `LF will be replaced by CRLF` warnings from git — these are harmless line-ending notices.
- **Phantom `M` status with empty diffs.** On this Windows working copy, 14 files reliably show as modified in `git status` but `git diff <file>` returns *no content* — only the CRLF warning. The set is: the 7 Drift-generated files (`lib/database/app_database.g.dart`, `lib/database/daos/*.g.dart`) and the 7 platform plugin registrants (`linux/flutter/generated_*`, `macos/Flutter/GeneratedPluginRegistrant.swift`, `windows/flutter/generated_*`). **Do not stage them.** Always run `git diff <file>` to confirm a "modified" file has real content before adding. Use `git add <specific paths>`, never `git add -A` or `git add .`.
- **`.claude/` is gitignored.** It holds per-user / per-machine permission rules (`settings.local.json` with absolute paths like `C:\flutter\bin`). The project-level `CLAUDE.md` at the repo root is tracked and is the guidance file you are reading right now.

## Third-party content

- Exercise images are loaded at runtime from `github.com/yuhonas/free-exercise-db` (Unlicense, public domain). They are not bundled in the app.
- Metronome WAV files in `assets/sounds/` are self-generated (FFmpeg), public domain — see `assets/sounds/CREDITS.md`.
- Full third-party attribution: [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md). In-app surface: the About screen at `/about` (linked from Settings) with Flutter's `showLicensePage` for per-package licenses.
