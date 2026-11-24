import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/attempts_exhausted_view_body.dart';

/// Screen view for Page 25 (Free Attempts Exhausted Screen).
class AttemptsExhaustedView extends StatelessWidget {
  const AttemptsExhaustedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: AttemptsExhaustedViewBody(),
      ),
    );
  }
}
