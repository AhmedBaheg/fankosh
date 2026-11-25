import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/widgets/custom_bottom_nav_bar.dart';
import '../widgets/my_bundle_view_body.dart';

/// Standalone screen view for "باقتي" (My Bundle).
class MyBundleView extends StatelessWidget {
  const MyBundleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavBar(
          currentIndex: 1,
        ),
      ),
      body: MyBundleViewBody(),
    );
  }
}
