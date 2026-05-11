# Sound asset credits

All `.wav` files in this directory were **generated procedurally** by the
project authors during development using [FFmpeg](https://ffmpeg.org/) /
`libavformat`. The WAV `ISFT` (software-used) chunk in every file reads
`Lavf62.12.100`, which identifies FFmpeg as the producing tool.

These files are **not** derived from any third-party recording, sample
pack, sound library, freesound.org upload, or commercial audio asset.
They are short synthesized tones (sine waves with simple amplitude
envelopes) intended as click / beep / woodblock metronome cues.

## License

Dedicated to the **public domain** by the project authors. You may use,
copy, modify, redistribute, and incorporate these files into derivative
works without attribution or further permission. They are provided
"as is" with no warranty.

## Files

All files are 44.1 kHz, 16-bit signed PCM, mono.

| File | Approx. size | Role |
|---|---|---|
| `beep_tick.wav`   | 4.5 KB  | Per-second tick — Electronic Beeps sound set |
| `beep_phase.wav`  | 10.7 KB | Phase-transition cue — Electronic Beeps sound set |
| `click_tick.wav`  | 1.8 KB  | Per-second tick — Percussive Clicks sound set |
| `click_phase.wav` | 5.4 KB  | Phase-transition cue — Percussive Clicks sound set |
| `wood_tick.wav`   | 2.7 KB  | Per-second tick — Woodblock sound set |
| `wood_phase.wav`  | 7.1 KB  | Phase-transition cue — Woodblock sound set |

Usage: see [`lib/features/workouts/services/tempo_metronome.dart`](../../lib/features/workouts/services/tempo_metronome.dart)
and [`docs/METRONOME.md`](../../docs/METRONOME.md).

## Regenerating these files

If a sound set needs to be retuned or replaced, regenerate locally with
FFmpeg. Example for a 880 Hz tick of 50 ms with a fast fade-out:

```bash
ffmpeg -f lavfi -i "sine=frequency=880:duration=0.05" \
       -af "afade=t=out:st=0.02:d=0.03" \
       -ar 44100 -ac 1 -sample_fmt s16 beep_tick.wav
```

A phase-transition cue is typically a louder, lower-pitched, slightly
longer sample (e.g. 440 Hz for ~120 ms). Tune by ear in the app — the
metronome plays the `_tick` file at volume 0.4 and the `_phase` file at
volume 0.8 (see `TempoMetronome._playSound`).

Replacements **must keep the same file names** unless you also update
`MetronomeSoundSet.assetPrefix` in `tempo_metronome.dart`.
