import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../recording/data/models/recorded_audio_model.dart';
import '../widgets/recognition_processing_view_body.dart';

/// Screen view for Recognition Chat Screen (Figma Page 8, 9 & 10).
/// Remains open while recognition request is processing without unexpected exits.
class RecognitionProcessingView extends StatelessWidget {
  const RecognitionProcessingView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final RecordedAudioModel? model = args is RecordedAudioModel ? args : null;
    final int recordedSeconds =
        model?.durationSeconds ?? (args is int ? args : 5);
    final String? audioPath = model?.filePath;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RecognitionProcessingViewBody(
          recordedDurationSeconds: recordedSeconds,
          audioFilePath: audioPath,
        ),
      ),
    );
  }
}
