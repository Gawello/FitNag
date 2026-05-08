# Development

How to set up the project, change it, and not break the build. For per-feature mechanics, see the relevant feature doc; this file covers cross-cutting workflow.

---

## Prerequisites

- **Flutter SDK** ≥ 3.11.3 — confirm with `flutter --version`. The project's SDK constraint is in [`pubspec.yaml`](../pubspec.yaml).
- **Android SDK** with at least API 33 installed (the app requests `POST_NOTIFICATIONS` runtime permission).
- **Xcode 15+** (only for building / running iOS or macOS targets).
- A connected device or running emulator. Android Studio's AVD or a physical device both work.

Verify with `flutter doctor -v` and resolve any red ✗ items before continuing.

---

## First-time setup

```bash
git clone <repo-url>
cd fitnag
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

The `build_runner` step is **mandatory** — it generates:

- `lib/database/app_database.g.dart` and `lib/database/daos/*.g.dart` (Drift schema + queries)
- Riverpod-annotated provider boilerplate where used

The generated `.g.dart` files are committed to the repo. They will appear in `git status` after a regen even if no schema changed (timestamps differ in some Drift versions). Treat unintended regen-noise as a soft warning to verify nothing real changed.

---

## Day-to-day commands

| Command | Use it for |
|---|---|
| `flutter run` | Launches the app on the connected target (debug build, hot reload available) |
| `flutter analyze` | Static analysis. Must pass before opening a PR. |
| `flutter test` | Runs the test suite (currently three `BmiCalculator` tests — see [TESTING.md](TESTING.md)) |
| `dart run build_runner build --delete-conflicting-outputs` | One-shot regen after schema or annotated provider changes |
| `dart run build_runner watch --delete-conflicting-outputs` | Continuous regen during active schema work |
| `flutter clean && flutter pub get` | Reset for "it builds on my machine but not in CI" mysteries |

---

## Project structure

The high-level map is in [`README.md`](../README.md#project-structure) and [`ARCHITECTURE.md`](../ARCHITECTURE.md). Key conventions:

- **Feature-first folders.** New features go under `lib/features/<name>/` with the canonical layout: `providers/`, `screens/`, `widgets/`, `logic/`, `services/` (only the folders you actually need).
- **Cross-cutting code lives in `lib/core/`.** If something would import from two unrelated features, it belongs in core.
- **Database access goes through DAOs.** Direct queries against `AppDatabase` from feature code are a smell — extend the appropriate DAO instead.
- **Constants are typed.** Enums in `lib/core/constants/exercise_constants.dart` are the source of truth for body parts, equipment, difficulty, training focus, and muscle action. Don't introduce parallel string constants.
- **Single theme, single language.** Colors come from [`app_theme.dart`](../lib/core/theme/app_theme.dart). Strings are inline English; there is no `lib/l10n`.

---

## Riverpod conventions

| Provider type | When to reach for it |
|---|---|
| `FutureProvider` | Read-only async data the UI loads once per screen open (e.g. `homeStateProvider`, `workoutHistoryProvider`). After a write, **call `ref.invalidate(...)`** — the home screen does not auto-refresh on DB changes. |
| `StreamProvider` | Live DB-driven state that should update reactively (e.g. `settingsUserProvider` watches the `users` table). |
| `StateNotifierProvider.autoDispose` | Complex per-screen mutable state (`activeWorkoutProvider`). The `autoDispose` matters: it ensures session state is not retained after the user navigates away. |
| `StateProvider` | Trivial UI state that doesn't merit a notifier (filter selections). |
| `FutureProvider.family` | Parameterized loads (`workoutSummaryProvider(sessionId)`). |

**Don't** use `Provider` for mutable services — the singletons (`AppDatabase.instance`, `NagScheduler`, `TempoMetronome`) are static for historical reasons. See [ARCHITECTURE.md](../ARCHITECTURE.md#technical-debt) for the dependency-injection plan.

---

## Database schema changes

Drift schema is defined in [`lib/database/app_database.dart`](../lib/database/app_database.dart). Steps:

1. **Edit the table definition** (add/remove columns, add a new table). Stick to Drift's declarative syntax — no raw `customStatement` calls in `Table` classes.
2. **Increment `schemaVersion`** in the `AppDatabase` class. Skip a version *only* if you mean to.
3. **Add an `if (from < N)` block** in `MigrationStrategy.onUpgrade`. Migrations must be idempotent and forward-only — a user upgrading from v3 → v5 runs the v4 *and* v5 blocks. Test this on a v3 DB, not just a fresh install.
4. **Regen** with `dart run build_runner build --delete-conflicting-outputs`. Verify the diff in `app_database.g.dart` looks reasonable.
5. **Update DAOs** if the new column needs a query.
6. **Update [ARCHITECTURE.md](../ARCHITECTURE.md#schema--18-tables-version-5)** schema table and **this doc** if the migration sequence changes.

The on-device DB file is at `<app docs>/fitnag.sqlite`. To rebase to a clean schema during development, uninstall the app from the device. Don't ship a destructive `onUpgrade`.

---

## Adding a new feature module

A typical sequence:

1. Create the folder: `lib/features/<name>/`. Add `providers/`, `screens/`, `widgets/`, `logic/`, `services/` only as needed.
2. If the feature needs new persistent state, extend an existing DAO if the table fits, otherwise add a new table + DAO (see schema-change steps above).
3. Wire UI:
   - **Top-level route** with bottom nav: add to the shell in [`app_router.dart`](../lib/core/router/app_router.dart) under the `ShellRoute`.
   - **Standalone route** (e.g. modal flow): add as a sibling to existing standalone routes (`/workout/...`, `/calendar`, `/league`, `/settings`).
4. Read state via `Consumer*` widgets. Don't introduce new singleton service classes without a strong reason — prefer DAO + Riverpod provider.
5. Update [PRODUCT.md](PRODUCT.md) **non-goals** if your feature contradicts one (or carry the override in the PR description).
6. Add a test if any non-trivial pure logic exists. See [TESTING.md](TESTING.md).

---

## Coding style

- Follow `flutter_lints` defaults; project pins `flutter_lints: ^6.0.0` plus `riverpod_lint`.
- Run `flutter analyze` before pushing. Warnings are not failures, but unaddressed warnings will accumulate; flag intentionally-suppressed ones with `// ignore:` and a comment.
- **No comments unless the why is non-obvious.** The code's identifiers should explain what; comments explain hidden invariants, workarounds, or surprising behaviour. Don't comment what `git blame` already tells you.
- **Imports** use Flutter's default ordering: dart, package, relative.
- **Logging** goes through `AppLogger` (`lib/core/utils/app_logger.dart`), not `print` or `debugPrint`. Tags are short module names.

---

## Branching & commits

- Branch from `main`: `git checkout -b feat/<short-slug>` / `fix/<short-slug>` / `docs/<short-slug>`.
- Use [Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`. The recent `git log` shows the project's tone (e.g. `fix(workout): remove remaining state.sessionId! in completeSet`).
- Keep commits focused. A schema migration + a UI feature in the same commit is too much.
- Never amend or force-push commits that are already on `main`.

---

## Pull requests

A PR is mergeable when:

1. `flutter analyze` is clean.
2. `flutter test` passes.
3. Any user-facing change has been exercised on a real device or emulator (UI changes can't be verified by `flutter test` alone).
4. Schema changes include the matching migration and an update to [ARCHITECTURE.md → schema table](../ARCHITECTURE.md#schema--18-tables-version-5).
5. Behaviour changes (XP math, escalation timing, plan rules, league thresholds) include an update to the corresponding doc in `docs/`.

PR description should answer "what changed" and "why now". The diff answers "how".
