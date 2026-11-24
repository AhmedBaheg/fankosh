import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/recognition_processing_view_body.dart';

/// Screen view for Recognition Chat Screen (Figma Page 8, 9 & 10).
/// Remains open while recognition request is processing without unexpected exits.
class RecognitionProcessingView extends StatelessWidget {
  const RecognitionProcessingView({super.key});

  @override
  Widget build(BuildContext context) {
    final recordedSeconds =
        (ModalRoute.of(context)?.settings.arguments as int?) ?? 5;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RecognitionProcessingViewBody(
          recordedDurationSeconds: recordedSeconds,
        ),
      ),
    );
  }
}
