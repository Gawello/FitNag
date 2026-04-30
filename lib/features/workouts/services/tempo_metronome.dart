import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/app_logger.dart';
import '../../../core/utils/tempo.dart';

/// Which sound set the user prefers.
enum MetronomeSoundSet {
  beep('Electronic Beeps', 'beep'),
  click('Percussive Clicks', 'click'),
  wood('Woodblock', 'wood'),
  vibrationOnly('Vibration Only', '');

  const MetronomeSoundSet(this.label, this.assetPrefix);
  final String label;
  final String assetPrefix;
}

/// The four phases of a tempo rep.
enum TempoPhase { eccentric, pause, concentric, top }

/// Plays tick sounds and haptic vibrations in sync with exercise rep tempo.
///
/// Creates a fresh [AudioPlayer] instance per sound to avoid Android
/// low-latency audio mode conflicts between concurrent playback calls.
///
/// Usage:
/// ```dart
/// TempoMetronome.onTick = (phase, secondsRemaining, rep) {
///   // update UI
/// };
/// TempoMetronome.start(tempo);
/// // ...later...
/// TempoMetronome.stop();
/// ```
///
/// Call [initialize] once at app startup before [start].
class TempoMetronome {
  TempoMetronome._();

  static Timer? _timer;
  static bool _running = false;
  static bool _initialized = false;

  // Current state
  static TempoPhase _currentPhase = TempoPhase.eccentric;
  static int _secondsInPhase = 0;
  static int _repCount = 0;

  // Callbacks
  static void Function(TempoPhase phase, int secondsRemaining, int rep)? onTick;

  // Settings
  static MetronomeSoundSet _soundSet = MetronomeSoundSet.beep;
  static bool _vibrationEnabled = true;

  static MetronomeSoundSet get soundSet => _soundSet;
  static bool get vibrationEnabled => _vibrationEnabled;
  static bool get isRunning => _running;

  static void setSoundSet(MetronomeSoundSet set) => _soundSet = set;
  static void setVibrationEnabled(bool enabled) => _vibrationEnabled = enabled;

  /// Initialize. Call once at app startup.
  static Future<void> initialize() async {
    _initialized = true;
  }

  /// Play a short sound effect using a disposable player.
  static Future<void> _playSound(String assetPath, double volume) async {
    if (!_initialized) return;
    try {
      final player = AudioPlayer();
      await player.setAudioContext(AudioContext(
        android: AudioContextAndroid(
          isSpeakerphoneOn: false,
          audioMode: AndroidAudioMode.normal,
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.game,
          audioFocus: AndroidAudioFocus.none,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.ambient,
        ),
      ));
      await player.setVolume(volume);
      await player.play(AssetSource(assetPath));
      // Dispose after playback completes
      player.onPlayerComplete.listen((_) {
        player.dispose();
      });
      // Safety: dispose after 3 seconds regardless
      Future.delayed(const Duration(seconds: 3), () {
        player.dispose();
      });
    } catch (e) {
      AppLogger.warning(
        'Audio playback failed for $assetPath',
        tag: 'TempoMetronome',
        error: e,
      );
    }
  }

  /// Start the metronome for a given tempo. Loops indefinitely until stopped.
  static void start(Tempo tempo) {
    if (!tempo.isApplicable) return;
    stop();

    _repCount = 1;
    _currentPhase = TempoPhase.eccentric;
    _secondsInPhase = _phaseDuration(tempo, _currentPhase);
    _running = true;

    // Play initial phase-change sound
    _playPhaseSound();
    onTick?.call(_currentPhase, _secondsInPhase, _repCount);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_running) return;

      _secondsInPhase--;

      if (_secondsInPhase <= 0) {
        // Advance to next phase
        _currentPhase = _nextPhase(_currentPhase);
        _secondsInPhase = _phaseDuration(tempo, _currentPhase);

        if (_currentPhase == TempoPhase.eccentric) {
          _repCount++;
        }

        // Skip phases with 0 duration
        while (_secondsInPhase <= 0 && _running) {
          _currentPhase = _nextPhase(_currentPhase);
          _secondsInPhase = _phaseDuration(tempo, _currentPhase);
          if (_currentPhase == TempoPhase.eccentric) {
            _repCount++;
          }
        }

        _playPhaseSound();
      } else {
        _playTickSound();
      }

      onTick?.call(_currentPhase, _secondsInPhase, _repCount);
    });
  }

  static void stop() {
    _running = false;
    _timer?.cancel();
    _timer = null;
    _repCount = 0;
  }

  static void dispose() {
    stop();
  }

  static int _phaseDuration(Tempo tempo, TempoPhase phase) {
    return switch (phase) {
      TempoPhase.eccentric => tempo.eccentric,
      TempoPhase.pause => tempo.pause,
      TempoPhase.concentric => tempo.concentric,
      TempoPhase.top => tempo.top,
    };
  }

  static TempoPhase _nextPhase(TempoPhase phase) {
    return switch (phase) {
      TempoPhase.eccentric => TempoPhase.pause,
      TempoPhase.pause => TempoPhase.concentric,
      TempoPhase.concentric => TempoPhase.top,
      TempoPhase.top => TempoPhase.eccentric,
    };
  }

  static String phaseLabel(TempoPhase phase) {
    return switch (phase) {
      TempoPhase.eccentric => 'DOWN',
      TempoPhase.pause => 'HOLD',
      TempoPhase.concentric => 'UP',
      TempoPhase.top => 'TOP',
    };
  }

  static Future<void> _playTickSound() async {
    if (_vibrationEnabled) {
      await HapticFeedback.lightImpact();
    }

    if (_soundSet == MetronomeSoundSet.vibrationOnly) return;
    final asset = 'sounds/${_soundSet.assetPrefix}_tick.wav';
    await _playSound(asset, 0.4);
  }

  static Future<void> _playPhaseSound() async {
    if (_vibrationEnabled) {
      await HapticFeedback.heavyImpact();
    }

    if (_soundSet == MetronomeSoundSet.vibrationOnly) return;
    final asset = 'sounds/${_soundSet.assetPrefix}_phase.wav';
    await _playSound(asset, 0.8);
  }
}
