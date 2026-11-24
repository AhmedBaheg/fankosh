import 'dart:ui';

import 'package:fankosh/features/home/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Floating frosted glassmorphism bottom navigation bar matching Figma Node 1:3388 (Frame 4).
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, this.currentIndex = 0, this.onTap});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 72.h,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.8),
                width: 1.5.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tab 0: Home ("الرئيسية")
                NavItem(
                  index: 0,
                  currentIndex: currentIndex,
                  label: l10n.tabHome,
                  activeIcon: AppAssets.homeActiveIcon,
                  inactiveIcon: AppAssets.homeInactiveIcon,
                  onTap: () => onTap?.call(0),
                ),

                // Tab 1: Plans / Packages ("الباقات")
                NavItem(
                  index: 1,
                  currentIndex: currentIndex,
                  label: l10n.tabPackages,
                  activeIcon: AppAssets.plansActiveIcon,
                  inactiveIcon: AppAssets.plansInactiveIcon,
                  onTap: () {
                    if (onTap != null) {
                      onTap!(1);
                    } else {
                      Navigator.pushNamed(
                        context,
                        Routes.subscriptionPlansView,
                      );
                    }
                  },
                ),

                // Tab 2: Profile / Account ("حسابي")
                NavItem(
                  index: 2,
                  currentIndex: currentIndex,
                  label: l10n.tabProfile,
                  activeIcon: AppAssets.profileActiveIcon,
                  inactiveIcon: AppAssets.profileInactiveIcon,
                  onTap: () => onTap?.call(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
