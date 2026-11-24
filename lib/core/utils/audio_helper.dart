import 'dart:async';
import 'package:flutter/foundation.dart';

/// Helper utility for audio duration formatting and playback calculations.
abstract final class AudioHelper {
  /// Formats seconds into a standard `mm:ss` string (e.g. `00:03`, `00:05`).
  static String formatDuration(int seconds) {
    final safeSeconds = seconds < 0 ? 0 : seconds;
    final mins = (safeSeconds ~/ 60).toString().padLeft(2, '0');
    final secs = (safeSeconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  /// Calculates the number of active waveform bars given progress and total bar count.
  static int calculateActiveBars({
    required int currentPosition,
    required int totalDuration,
    required int totalBars,
  }) {
    if (currentPosition <= 0 || totalDuration <= 0) return 0;
    final ratio = (currentPosition / totalDuration).clamp(0.0, 1.0);
    return (totalBars * ratio).round();
  }
}

/// Lightweight controller for audio playback simulation and state tracking.
///
/// Separates audio playback business logic, timer handling, and progress
/// calculations from presentation widgets.
class AudioPlaybackController extends ChangeNotifier {
  AudioPlaybackController({
    required int totalDurationSeconds,
    int initialPositionSeconds = 0,
  })  : _totalDuration = totalDurationSeconds > 0 ? totalDurationSeconds : 1,
        _currentPosition = initialPositionSeconds;

  int _totalDuration;
  int _currentPosition;
  bool _isPlaying = false;
  Timer? _timer;

  int get totalDuration => _totalDuration;
  int get currentPosition => _currentPosition;
  bool get isPlaying => _isPlaying;

  /// Updates the total duration if the parent widget passes a new duration.
  void updateTotalDuration(int newTotal) {
    if (_totalDuration != newTotal) {
      stop(reset: true);
      _totalDuration = newTotal > 0 ? newTotal : 1;
      notifyListeners();
    }
  }

  /// Toggles playback between play and pause.
  void togglePlay() {
    if (_isPlaying) {
      pause();
    } else {
      play();
    }
  }

  /// Starts playback from current position or restarts if at the end.
  void play() {
    if (_currentPosition >= _totalDuration) {
      _currentPosition = 0;
    }

    _isPlaying = true;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentPosition < _totalDuration) {
        _currentPosition++;
        notifyListeners();
      }
      if (_currentPosition >= _totalDuration) {
        stop(reset: true);
      }
    });
  }

  /// Pauses playback and retains current position.
  void pause() {
    _timer?.cancel();
    _isPlaying = false;
    notifyListeners();
  }

  /// Stops playback with optional position reset.
  void stop({bool reset = false}) {
    _timer?.cancel();
    _isPlaying = false;
    if (reset) {
      _currentPosition = 0;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
