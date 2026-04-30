import 'package:flutter/foundation.dart';

/// Thin logging wrapper for FitNag.
///
/// - [debug] and [warning]: active only in debug builds (via [assert]).
/// - [error]: always printed, including profile/release builds, so errors are
///   never silently swallowed. Wire [error] to a crash reporter (e.g. Firebase
///   Crashlytics) when one is added without changing call sites.
class AppLogger {
  AppLogger._();

  /// Log a diagnostic message. Silent in release builds.
  static void debug(String message, {String tag = 'FitNag'}) {
    assert(() {
      debugPrint('[$tag] $message');
      return true;
    }());
  }

  /// Log a non-fatal warning. Silent in release builds.
  static void warning(String message, {String tag = 'FitNag', Object? error}) {
    assert(() {
      debugPrint('[$tag][WARN] $message${error != null ? ': $error' : ''}');
      return true;
    }());
  }

  /// Log an error. Always printed — errors must surface in all build modes.
  // ignore: avoid_print
  static void error(
    String message, {
    String tag = 'FitNag',
    Object? error,
    StackTrace? stackTrace,
  }) {
    // ignore: avoid_print
    print('[$tag][ERROR] $message${error != null ? ': $error' : ''}');
    if (stackTrace != null) {
      // ignore: avoid_print
      print(stackTrace);
    }
  }
}
