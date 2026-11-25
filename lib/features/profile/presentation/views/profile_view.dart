import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/widgets/custom_bottom_nav_bar.dart';
import '../widgets/profile_view_body.dart';

/// Standalone screen view for "حسابي" (Profile).
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      bottomNavigationBar: const SafeArea(
        child: CustomBottomNavBar(
          currentIndex: 2,
        ),
      ),
      body: ProfileViewBody(
        onShowMyBundle: () {
          Navigator.pushNamed(context, Routes.myBundleView);
        },
      ),
    );
  }
}
