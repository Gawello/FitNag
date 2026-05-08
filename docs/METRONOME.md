# Tempo Metronome

The metronome plays audio + haptic cues at one-second resolution to guide the user through a four-phase rep.

Code anchor: [`TempoMetronome`](../lib/features/workouts/services/tempo_metronome.dart). Initialized once in `main.dart`. State is module-level (static) — the entire app shares one metronome instance.

---

## Tempo notation

Each exercise has a `defaultTempo` string with the format **`E-P-C-T`**:

| Letter | Phase | Phase enum | Meaning |
|---|---|---|---|
| E | Eccentric | `eccentric` | Lowering / lengthening (e.g. squat descent) |
| P | Pause | `pause` | Hold at the bottom |
| C | Concentric | `concentric` | Lifting / shortening (e.g. squat ascent) |
| T | Top | `top` | Hold at the top / lockout |

Each value is a non-negative integer in seconds. The default is `2-1-1-0` (2 s down, 1 s pause, 1 s up, no top hold). A 0 in any position means "skip this phase".

Parsed by [`Tempo.parse(s)`](../lib/core/utils/tempo.dart). On any malformed input the parser returns `defaultTempo` rather than throwing.

`Tempo.totalSeconds` is the rep length. `Tempo.isApplicable` is `true` iff total > 0 — used by `TempoMetronome.start` to no-op for zero-duration tempos.

---

## Cycle

`TempoMetronome.start(tempo)` runs `Timer.periodic(1 second)`. Each tick:

1. Decrement `_secondsInPhase`.
2. If still > 0 → play the *tick* sound + light haptic, fire `onTick(phase, secondsRemaining, rep)`.
3. If reached 0 → advance to the next phase (`eccentric → pause → concentric → top → eccentric`). When wrapping back to `eccentric`, increment the rep counter. Skip any phase whose duration is 0 (loop until a non-zero phase is found).
4. On phase change → play the *phase* sound + heavy haptic.

The loop never terminates on its own — it runs until `TempoMetronome.stop()` is called (typically when the user finishes the set, navigates away from the active workout, or starts a different exercise).

---

## Sound sets

Selected via `TempoMetronome.setSoundSet(MetronomeSoundSet)` and persisted in user preferences (settings screen). Asset prefix maps to two files:

| Sound set | Label | Asset prefix | Tick / phase files |
|---|---|---|---|
| `beep` | Electronic Beeps | `beep` | `assets/sounds/beep_tick.wav`, `beep_phase.wav` |
| `click` | Percussive Clicks | `click` | `assets/sounds/click_tick.wav`, `click_phase.wav` |
| `wood` | Woodblock | `wood` | `assets/sounds/wood_tick.wav`, `wood_phase.wav` |
| `vibrationOnly` | Vibration Only | *(none)* | no audio — haptics only |

Tick volume = 0.4. Phase volume = 0.8 (intentionally louder so the user can feel the phase boundary even with a quiet tick).

Asset declaration is in [`pubspec.yaml`](../pubspec.yaml) under `assets/sounds/`.

---

## Haptics

Independent of the sound set, controlled by `TempoMetronome.setVibrationEnabled(bool)`:

| Event | Haptic |
|---|---|
| Tick (each second within a phase) | `HapticFeedback.lightImpact()` |
| Phase change | `HapticFeedback.heavyImpact()` |

Vibration mode (`MetronomeSoundSet.vibrationOnly`) is the same haptic pattern with **no audio**. The `VIBRATE` permission in the Android manifest covers this.

---

## Audio implementation notes

- A **fresh `AudioPlayer` is created per playback** rather than reusing one instance. This is intentional: Android's low-latency audio mode rejects overlapping `play()` calls on a single player. Spawning per-call players costs a few ms each but avoids dropped ticks at fast tempos.
- Each player auto-disposes via two paths: `onPlayerComplete` listener, and a 3-second hard timeout (`Future.delayed`). The timeout exists because some Android codecs don't reliably fire `onPlayerComplete` for short clips.
- Audio context is set per playback:
  - **Android:** `usageType = game`, `audioMode = normal`, `audioFocus = none`. The app does **not** ducking other audio (e.g. the user's music keeps playing during workouts).
  - **iOS:** `category = ambient`. Same intent — coexist with background audio.
- Initialization (`TempoMetronome.initialize`) is currently a no-op other than flipping `_initialized = true`. Pre-warming an `AudioPlayer` was tried and dropped because the per-call instances need a fresh context anyway.

---

## API

```dart
// Once at app startup (already wired in main.dart)
await TempoMetronome.initialize();

// Hook for UI updates (optional)
TempoMetronome.onTick = (phase, secondsRemaining, rep) {
  // e.g. setState to update phase label / countdown
};

// Start a metronome for a tempo
TempoMetronome.start(tempo); // tempo: Tempo from the active exercise

// Stop (also stops any pending Timer.periodic)
TempoMetronome.stop();
```

Read-only state: `TempoMetronome.isRunning`, `.soundSet`, `.vibrationEnabled`.

`phaseLabel(TempoPhase)` returns short uppercase strings for UI: `DOWN`, `HOLD`, `UP`, `TOP`.

---

## Calibration

The metronome operates at **1-second resolution**. This is good enough for tempo work (compound movements rarely use sub-second phase durations) but means a `0.5` second eccentric is unrepresentable — round up.

`Timer.periodic` drift on Android is typically < 50 ms over a 60 s rep, which is below the threshold the user can perceive against a haptic anchor. Drift correction (using a wall-clock baseline) is **not** implemented; if a user reports the metronome going noticeably out of sync over long sets, this is the place to add it.
