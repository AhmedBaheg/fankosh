import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'nav_item.dart';

/// Floating frosted glassmorphism bottom navigation bar matching Figma exact specs:
/// - width: 350, height: 68, border-radius: 34, padding: 5px horizontal
/// - background: #FFFFFF61 (frosted glass) with blur(25px)
/// - border: 1px solid #F5F5F5
/// - shadows: 0px 2px 8px #0000000A, 0px 12px 36px #00000014
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.bundlesLabel,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;
  final Color? backgroundColor;
  final String? bundlesLabel;

  void _handleTap(BuildContext context, int index) {
    if (onTap != null) {
      onTap!(index);
      return;
    }

    if (index == 0) {
      if (currentIndex != 0) {
        Navigator.pushReplacementNamed(context, Routes.homeView);
      }
    } else if (index == 1) {
      if (currentIndex != 1) {
        Navigator.pushNamed(context, Routes.myBundleView);
      }
    } else if (index == 2) {
      if (currentIndex != 2) {
        Navigator.pushNamed(context, Routes.profileView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final homeText = l10n?.tabHome ?? 'الرئيسية';
    final profileText = l10n?.tabProfile ?? 'حسابي';
    final packagesText = bundlesLabel ?? (currentIndex == 1 ? 'باقتي' : (l10n?.tabPackages ?? 'الباقات'));

    // In Home view (#FFFFFF61 frosted glass over art), in other views clean frosted white
    final effectiveBgColor = backgroundColor ??
        (currentIndex == 0
            ? AppColors.navBarGlassActive // #FFFFFF61
            : AppColors.navBarGlassInactive); // Clean premium white

    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 6.h,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1.0,
        child: Container(
          width: 350.w,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtle, // 0px 2px 8px 0px #0000000A
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: AppColors.shadow14, // 0px 12px 36px 0px #00000014
                blurRadius: 36,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(34.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: effectiveBgColor,
                  borderRadius: BorderRadius.circular(34.r),
                  border: Border.all(
                    color: AppColors.navBarBorderLight, // 1px solid #F5F5F5
                    width: 1.0,
                  ),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tab 0: Home ("الرئيسية")
                    NavItem(
                      index: 0,
                      currentIndex: currentIndex,
                      label: homeText,
                      icon: AppAssets.homeActiveIcon,
                      onTap: () => _handleTap(context, 0),
                    ),

                    // Tab 1: Bundles / Packages ("الباقات" / "باقتي")
                    NavItem(
                      index: 1,
                      currentIndex: currentIndex,
                      label: packagesText,
                      icon: AppAssets.plansActiveIcon,
                      onTap: () => _handleTap(context, 1),
                    ),

                    // Tab 2: Profile / Account ("حسابي")
                    NavItem(
                      index: 2,
                      currentIndex: currentIndex,
                      label: profileText,
                      icon: AppAssets.profileActiveIcon,
                      onTap: () => _handleTap(context, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
