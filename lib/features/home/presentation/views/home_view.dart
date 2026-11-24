import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/home_view_body.dart';

/// Main screen view for Home features.
///
/// Corresponds to Figma Frame 4 (Home Screen).
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
