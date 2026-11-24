import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/recognition_response_view_body.dart';

/// Screen view for Pages 9 & 10 (Recognition Result Screen).
class RecognitionResponseView extends StatelessWidget {
  const RecognitionResponseView({super.key});

  @override
  Widget build(BuildContext context) {
    final recordedSeconds =
        (ModalRoute.of(context)?.settings.arguments as int?) ?? 5;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RecognitionResponseViewBody(
          recordedDurationSeconds: recordedSeconds,
        ),
      ),
    );
  }
}
