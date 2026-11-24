import 'dart:async';
import 'package:flutter/foundation.dart';
import '../data/models/recognition_result_model.dart';

/// Enum representing the active asynchronous recognition processing lifecycle states.
enum RecognitionStatus {
  processing,
  success,
  failure,
}

/// Controller managing the recognition request lifecycle, asynchronous communication,
/// response state updates, and retry logic.
class RecognitionController extends ChangeNotifier {
  RecognitionController({
    required this.userRecordingDuration,
    this.onSuccess,
    this.onFailure,
  });

  final int userRecordingDuration;
  final VoidCallback? onSuccess;
  final ValueChanged<String>? onFailure;

  RecognitionStatus _status = RecognitionStatus.processing;
  String? _errorMessage;
  RecognitionResultModel? _result;

  RecognitionStatus get status => _status;
  String? get errorMessage => _errorMessage;
  RecognitionResultModel? get result => _result;

  /// Starts or retries the recognition request asynchronously.
  Future<void> processRequest() async {
    _status = RecognitionStatus.processing;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate real asynchronous recognition API/service request
      await Future.delayed(const Duration(milliseconds: 2500));

      _result = RecognitionResultModel(
        id: 'recog_${DateTime.now().millisecondsSinceEpoch}',
        userRecordingDuration: userRecordingDuration,
        responseAudioDuration: 22,
        createdAt: DateTime.now(),
      );
      _status = RecognitionStatus.success;
      onSuccess?.call();
      notifyListeners();
    } catch (error) {
      _status = RecognitionStatus.failure;
      _errorMessage = error.toString();
      onFailure?.call(error.toString());
      notifyListeners();
    }
  }

  /// Retries a failed recognition request.
  void retry() {
    processRequest();
  }
}
