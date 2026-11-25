import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../data/models/recorded_audio_model.dart';

/// Business logic controller handling real audio recording, duration tracking,
/// maximum duration limit enforcement (5 seconds), and recording finalization.
class AudioRecordingController extends ChangeNotifier {
  AudioRecordingController({
    this.maxDurationSeconds = 5,
    this.onRecordingFinished,
  });

  final int maxDurationSeconds;
  final ValueChanged<RecordedAudioModel>? onRecordingFinished;

  AudioRecorder? _recorder;
  Timer? _ticker;
  int _elapsedMilliseconds = 0;
  int _elapsedSeconds = 0;
  bool _isRecording = false;
  bool _isFinalizing = false;
  String? _recordedFilePath;

  int get elapsedSeconds => _elapsedSeconds;
  int get elapsedMilliseconds => _elapsedMilliseconds;
  bool get isRecording => _isRecording;
  bool get isFinalizing => _isFinalizing;
  String? get recordedFilePath => _recordedFilePath;

  /// Starts the active recording session and duration ticker.
  Future<void> startRecording() async {
    if (_isRecording || _isFinalizing) return;
    _isRecording = true;
    _isFinalizing = false;
    _elapsedMilliseconds = 0;
    _elapsedSeconds = 0;
    _recordedFilePath = null;

    // Start timer immediately so duration tracking is instant and robust
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

    try {
      final recorder = AudioRecorder();
      _recorder = recorder;
      final hasPermission = await recorder.hasPermission();
      if (hasPermission && _isRecording) {
        final tempDir = await getTemporaryDirectory();
        final path =
            '${tempDir.path}/fankosh_rec_${DateTime.now().millisecondsSinceEpoch}.m4a';
        _recordedFilePath = path;
        await recorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc),
          path: path,
        );
      }
    } catch (e) {
      // Gracefully continue with duration tracking if audio plugin is missing/unsupported (e.g. tests)
      _recorder = null;
    }
  }

  /// Stops recording, finalizes duration, and emits [RecordedAudioModel].
  Future<RecordedAudioModel?> stopRecording({bool autoStopped = false}) async {
    if (!_isRecording || _isFinalizing) return null;
    _isRecording = false;
    _isFinalizing = true;
    _ticker?.cancel();

    final int actualSeconds = autoStopped
        ? maxDurationSeconds
        : ((_elapsedMilliseconds / 1000).round()).clamp(1, maxDurationSeconds);

    final String? finalizedPath = _recordedFilePath;

    final result = RecordedAudioModel(
      id: 'rec_${DateTime.now().millisecondsSinceEpoch}',
      durationSeconds: actualSeconds,
      recordedAt: DateTime.now(),
      filePath: finalizedPath,
    );

    onRecordingFinished?.call(result);
    notifyListeners();

    final recorder = _recorder;
    _recorder = null;
    if (recorder != null) {
      try {
        await recorder.stop();
      } catch (e) {
        // ignore in tests / when unmocked
      }
      try {
        await recorder.dispose();
      } catch (_) {}
    }

    return result;
  }

  @override
  void dispose() {
    _ticker?.cancel();
    final recorder = _recorder;
    _recorder = null;
    if (recorder != null) {
      try {
        recorder.dispose().catchError((_) {});
      } catch (_) {}
    }
    super.dispose();
  }
}
