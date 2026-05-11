# FitNag Documentation

This folder is the **single source of truth** for how FitNag should behave. Each document is scoped to one concern. Code is the implementation; these documents are the spec.

## Index

### Product
- [PRODUCT.md](PRODUCT.md) — vision, principles, target user, non-goals
- [USER_JOURNEY.md](USER_JOURNEY.md) — first run, daily loop, weekly loop, edge cases
- [GLOSSARY.md](GLOSSARY.md) — domain terms (nag, streak, league, schedule mode, tempo)

### Mechanics (the rules the app enforces)
- [PLAN_GENERATOR.md](PLAN_GENERATOR.md) — split selection, exercise filtering, ordering
- [GAMIFICATION.md](GAMIFICATION.md) — XP formulas, levels, streaks, badges, leagues
- [NOTIFICATIONS.md](NOTIFICATIONS.md) — 5-level escalation, windows, permissions, boot survival
- [METRONOME.md](METRONOME.md) — tempo notation, 4-phase cycle, sound sets, haptics

### Engineering
- [DEVELOPMENT.md](DEVELOPMENT.md) — local setup, build_runner, schema migrations, code style
- [TESTING.md](TESTING.md) — current state, recommended targets, how to add tests
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) — common dev issues and fixes
- [RELEASE.md](RELEASE.md) — pre-release checklist, build & sign, store submission

### Licensing & attribution
- [LICENSE](../LICENSE) — project license (proprietary, all rights reserved)
- [THIRD_PARTY_LICENSES.md](../THIRD_PARTY_LICENSES.md) — third-party component attributions
- [../assets/sounds/CREDITS.md](../assets/sounds/CREDITS.md) — origin of metronome WAV files

## How to keep these docs honest

- **Spec, not narration.** State what the app does, with exact numbers and formulas. If the doc disagrees with the code, fix one of them — don't leave both.
- **Reference code paths** (e.g. `lib/features/workouts/logic/plan_generator.dart`) so a reader can verify the spec against the implementation.
- **Update when behaviour changes.** A PR that changes XP math, the split rules, the escalation timing, or the schema must update the corresponding doc in the same commit.
- **Don't duplicate.** [ARCHITECTURE.md](../ARCHITECTURE.md) at the repo root owns the layered architecture, schema table list, and module map. These docs go *deeper* on individual mechanics.

## Audience

| Document | Read this if you are… |
|---|---|
| PRODUCT, USER_JOURNEY | a designer, PM, or new contributor onboarding |
| GAMIFICATION, NOTIFICATIONS, METRONOME, PLAN_GENERATOR | implementing, tuning, or debugging that subsystem |
| DEVELOPMENT, TESTING, TROUBLESHOOTING | setting up the project or unblocking a build |
| RELEASE | shipping a build to a store |
| GLOSSARY | unsure what a term means anywhere in the codebase |
