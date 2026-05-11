# Third-Party Licenses & Attributions

FitNag is proprietary software (see [LICENSE](LICENSE)), but it incorporates
and uses third-party components, assets, and dependencies that are distributed
under their own licenses. This file is the canonical attribution list.

Last reviewed: 2026-05-11.

---

## Exercise demonstration images

**Source:** [yuhonas/free-exercise-db](https://github.com/yuhonas/free-exercise-db)
**License:** [The Unlicense](https://unlicense.org/) (public domain dedication)
**Used by:** [`lib/features/exercises/data/exercise_image_map.dart`](lib/features/exercises/data/exercise_image_map.dart) via [`lib/features/exercises/widgets/exercise_image_widget.dart`](lib/features/exercises/widgets/exercise_image_widget.dart)

Images are loaded at runtime over HTTPS from
`raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/<exercise_id>/[0|1].jpg`
and cached locally by [`cached_network_image`](https://pub.dev/packages/cached_network_image).
No image files are bundled in the app binary.

The Unlicense places the work in the public domain worldwide and waives all
copyright interest. No attribution is *required*, but it is provided here in
good faith and so that downstream consumers can verify provenance.

---

## Application sound assets

**Files:** `assets/sounds/{beep,click,wood}_{tick,phase}.wav` (6 files)
**Source:** Generated procedurally by the project authors using FFmpeg
(`libavformat` 62.12.100 — embedded in the WAV `ISFT` chunk).
**License:** Public domain / dedicated to the public domain by the authors.
**Used by:** [`lib/features/workouts/services/tempo_metronome.dart`](lib/features/workouts/services/tempo_metronome.dart)

These are short sine-wave / shaped-tone samples (≤ 10 KB each, 44.1 kHz mono
16-bit PCM) synthesized locally during development. They are not derived
from any third-party recording, sample pack, or sound library. See
[`assets/sounds/CREDITS.md`](assets/sounds/CREDITS.md) for the per-file
specification.

---

## Icons & visual assets

### Material Design Icons (`uses-material-design: true`)
**Source:** [Google Material Icons](https://fonts.google.com/icons)
**License:** [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
**Used by:** All `Icon(Icons.*)` usages throughout the app.

### Cupertino Icons (`cupertino_icons` package)
**Source:** [`cupertino_icons` on pub.dev](https://pub.dev/packages/cupertino_icons)
**License:** MIT (font file: SIL Open Font License 1.1)

### Application launcher icon
**Files:** [`assets/icon/fitnag_icon.svg`](assets/icon/fitnag_icon.svg),
[`assets/icon/fitnag_icon_512.png`](assets/icon/fitnag_icon_512.png),
`android/app/src/main/res/mipmap-*/ic_launcher.png` (generated from the SVG)
**Source:** Original artwork created by the project authors.
**License:** Proprietary — © 2026 Gaweł Banasik, all rights reserved.

---

## Dart / Flutter dependencies

All runtime dependencies are open source and resolved via
[pub.dev](https://pub.dev). The authoritative manifest is
[`pubspec.yaml`](pubspec.yaml); locked versions live in `pubspec.lock`.
Run `flutter pub deps` for the full transitive graph.

### Direct dependencies

| Package | License (typical) | Source |
|---|---|---|
| `flutter` (SDK) | BSD-3-Clause | https://github.com/flutter/flutter |
| `cupertino_icons` | MIT | https://pub.dev/packages/cupertino_icons |
| `flutter_riverpod` | MIT | https://pub.dev/packages/flutter_riverpod |
| `riverpod_annotation` | MIT | https://pub.dev/packages/riverpod_annotation |
| `drift` | MIT | https://pub.dev/packages/drift |
| `sqlite3_flutter_libs` | MIT | https://pub.dev/packages/sqlite3_flutter_libs |
| `path_provider` | BSD-3-Clause | https://pub.dev/packages/path_provider |
| `path` | BSD-3-Clause | https://pub.dev/packages/path |
| `go_router` | BSD-3-Clause | https://pub.dev/packages/go_router |
| `flutter_local_notifications` | BSD-3-Clause | https://pub.dev/packages/flutter_local_notifications |
| `timezone` | BSD-2-Clause | https://pub.dev/packages/timezone |
| `android_alarm_manager_plus` | BSD-3-Clause | https://pub.dev/packages/android_alarm_manager_plus |
| `fl_chart` | MIT | https://pub.dev/packages/fl_chart |
| `shared_preferences` | BSD-3-Clause | https://pub.dev/packages/shared_preferences |
| `intl` | BSD-3-Clause | https://pub.dev/packages/intl |
| `confetti` | BSD-2-Clause | https://pub.dev/packages/confetti |
| `cached_network_image` | MIT | https://pub.dev/packages/cached_network_image |
| `table_calendar` | Apache-2.0 | https://pub.dev/packages/table_calendar |
| `audioplayers` | MIT | https://pub.dev/packages/audioplayers |

### Development-only dependencies (not shipped in release builds)

| Package | License (typical) |
|---|---|
| `flutter_test` (SDK) | BSD-3-Clause |
| `flutter_lints` | BSD-3-Clause |
| `drift_dev` | MIT |
| `build_runner` | BSD-3-Clause |
| `riverpod_generator` | MIT |
| `custom_lint` | MIT |
| `riverpod_lint` | MIT |

Transitive dependencies (e.g. `analyzer`, `meta`, `collection`, `http`, etc.)
are all Dart team / Flutter team packages under BSD-3-Clause or under the
Apache-2.0 / MIT licenses of their respective publishers.

For the exact license text of any individual package, run:

```bash
flutter pub deps --no-dev
```

…and look up each package on pub.dev — every pub.dev listing has a "License"
tab linking to the upstream `LICENSE` file.

---

## How to update this file

- When you **add a runtime dependency** to `pubspec.yaml`, add a row to the
  Direct Dependencies table above.
- When you **add a bundled asset** (image, sound, font, model file) under
  `assets/`, add a section describing its source and license.
- When you **add or replace artwork** (launcher icon, in-app illustrations),
  document the original artist and the rights status.
- When you **change the third-party image source** for exercises (e.g. swap
  `free-exercise-db` for another dataset), update the Exercise demonstration
  images section to point at the new source and confirm its license.
- Bump the "Last reviewed" date at the top.

The goal: any future maintainer (or store reviewer, or legal request) can
read this single file and reconstruct exactly which third-party material
FitNag uses and under what terms.
