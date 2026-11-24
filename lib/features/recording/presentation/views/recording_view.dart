import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/recording_view_body.dart';

/// Active audio recording screen view with a 5-second maximum recording limit (Figma Frame 6).
class RecordingView extends StatelessWidget {
  const RecordingView({
    super.key,
    this.maxDurationSeconds = 5,
  });

  final int maxDurationSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RecordingViewBody(
          maxDurationSeconds: maxDurationSeconds,
        ),
      ),
    );
  }
}
