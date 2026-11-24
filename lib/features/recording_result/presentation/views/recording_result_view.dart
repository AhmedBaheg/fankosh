import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/recording_result_view_body.dart';

/// Screen view displaying recorded audio playback with dynamic recorded duration (Figma Frame 7).
class RecordingResultView extends StatelessWidget {
  const RecordingResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final recordedSeconds =
        (ModalRoute.of(context)?.settings.arguments as int?) ?? 5;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RecordingResultViewBody(
          recordedDurationSeconds: recordedSeconds,
        ),
      ),
    );
  }
}
