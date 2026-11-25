import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../my_bundle/presentation/widgets/my_bundle_view_body.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/home_view_body.dart';
import '../widgets/profile_tab_body.dart';

/// Main screen view for Home features with bottom navigation.
///
/// Implements stateful index-based bottom navigation:
/// - Index 0: Home view content ([HomeViewBody])
/// - Index 1: My Bundle / My Subscription content ([MyBundleViewBody])
/// - Index 2: Profile / Account view content ([ProfileTabBody])
class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late int currentIndex;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pages = [
      HomeViewBody(
        onNavigateToBundles: () {
          Navigator.pushNamed(context, Routes.bundlesView);
        },
      ),
      MyBundleViewBody(
        onExplorePlans: () {
          Navigator.pushNamed(context, Routes.bundlesView);
        },
      ),
      ProfileTabBody(
        onShowMyBundle: () {
          setState(() {
            currentIndex = 1;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}
