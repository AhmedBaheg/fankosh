import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_view_body.dart';

/// Temporary onboarding startup screen representing Figma frames 22 and 23.
///
/// Displayed when the application is launched for the first time or cache is cleared.
/// Features a 2-page carousel showcasing the app's value propositions,
/// yellow brush-highlighted titles, responsive pagination dots, and localized CTA.
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: OnBoardingViewBody(),
      ),
    );
  }
}
