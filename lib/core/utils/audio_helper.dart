import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
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

/// Dynamic controller for audio playback supporting actual audio file playback,
/// position tracking, pause/resume, and graceful fallback.
class AudioPlaybackController extends ChangeNotifier {
  AudioPlaybackController({
    required int totalDurationSeconds,
    this.filePath,
    int initialPositionSeconds = 0,
  })  : _totalDuration = totalDurationSeconds > 0 ? totalDurationSeconds : 1,
        _currentPosition = initialPositionSeconds {
    _initPlayer();
  }

  final String? filePath;
  int _totalDuration;
  int _currentPosition;
  bool _isPlaying = false;
  AudioPlayer? _player;
  StreamSubscription<Duration>? _posSub;
  StreamSubscription<void>? _completeSub;
  Timer? _fallbackTimer;

  int get totalDuration => _totalDuration;
  int get currentPosition => _currentPosition;
  bool get isPlaying => _isPlaying;

  void _initPlayer() {
    if (filePath != null && filePath!.isNotEmpty) {
      _player = AudioPlayer();
      _posSub = _player!.onPositionChanged.listen((pos) {
        final sec = pos.inSeconds;
        if (sec != _currentPosition && sec <= _totalDuration) {
          _currentPosition = sec;
          notifyListeners();
        }
      });
      _completeSub = _player!.onPlayerComplete.listen((_) {
        _isPlaying = false;
        _currentPosition = 0;
        _fallbackTimer?.cancel();
        notifyListeners();
      });
    }
  }

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

  /// Starts or resumes playback of the recorded audio file.
  Future<void> play() async {
    if (_currentPosition >= _totalDuration) {
      _currentPosition = 0;
    }

    _isPlaying = true;
    notifyListeners();

    if (_player != null && filePath != null && File(filePath!).existsSync()) {
      try {
        if (_currentPosition > 0) {
          await _player!.seek(Duration(seconds: _currentPosition));
          await _player!.resume();
        } else {
          await _player!.play(DeviceFileSource(filePath!));
        }
      } catch (e) {
        debugPrint('Audio playback error: $e');
        _startFallbackTimer();
      }
    } else {
      _startFallbackTimer();
    }
  }

  void _startFallbackTimer() {
    _fallbackTimer?.cancel();
    _fallbackTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
  Future<void> pause() async {
    _fallbackTimer?.cancel();
    _isPlaying = false;
    notifyListeners();
    if (_player != null) {
      try {
        await _player!.pause();
      } catch (e) {
        debugPrint('Pause error: $e');
      }
    }
  }

  /// Stops playback with optional position reset.
  Future<void> stop({bool reset = false}) async {
    _fallbackTimer?.cancel();
    _isPlaying = false;
    if (reset) {
      _currentPosition = 0;
    }
    notifyListeners();
    if (_player != null) {
      try {
        await _player!.stop();
      } catch (e) {
        debugPrint('Stop error: $e');
      }
    }
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    _posSub?.cancel();
    _completeSub?.cancel();
    _player?.dispose();
    super.dispose();
  }
}
