import 'dart:async';
import 'package:flutter/foundation.dart';
import '../data/models/recorded_audio_model.dart';

/// Business logic controller handling audio recording duration tracking,
/// maximum duration limit enforcement (5 seconds), and recording finalization.
class AudioRecordingController extends ChangeNotifier {
  AudioRecordingController({
    this.maxDurationSeconds = 5,
    this.onRecordingFinished,
  });

  final int maxDurationSeconds;
  final ValueChanged<RecordedAudioModel>? onRecordingFinished;

  Timer? _ticker;
  int _elapsedMilliseconds = 0;
  int _elapsedSeconds = 0;
  bool _isRecording = false;
  bool _isFinalizing = false;

  int get elapsedSeconds => _elapsedSeconds;
  int get elapsedMilliseconds => _elapsedMilliseconds;
  bool get isRecording => _isRecording;
  bool get isFinalizing => _isFinalizing;

  /// Starts the active recording session and duration ticker.
  void startRecording() {
    if (_isRecording || _isFinalizing) return;
    _isRecording = true;
    _isFinalizing = false;
    _elapsedMilliseconds = 0;
    _elapsedSeconds = 0;

    _ticker = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _elapsedMilliseconds += 100;
      final currentSeconds =
          (_elapsedMilliseconds / 1000).floor().clamp(0, maxDurationSeconds);

      if (currentSeconds != _elapsedSeconds) {
        _elapsedSeconds = currentSeconds;
        notifyListeners();
      }

      // Automatically enforce 5-second maximum limit in the business logic
      if (_elapsedMilliseconds >= maxDurationSeconds * 1000) {
        stopRecording(autoStopped: true);
      }
    });
    notifyListeners();
  }

  /// Stops recording, finalizes duration, and emits [RecordedAudioModel].
  RecordedAudioModel? stopRecording({bool autoStopped = false}) {
    if (!_isRecording || _isFinalizing) return null;
    _isRecording = false;
    _isFinalizing = true;
    _ticker?.cancel();

    final int actualSeconds = autoStopped
        ? maxDurationSeconds
        : ((_elapsedMilliseconds / 1000).round()).clamp(1, maxDurationSeconds);

    final result = RecordedAudioModel(
      id: 'rec_${DateTime.now().millisecondsSinceEpoch}',
      durationSeconds: actualSeconds,
      recordedAt: DateTime.now(),
    );

    onRecordingFinished?.call(result);
    notifyListeners();
    return result;
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}
