import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets.dart';

/// Centralized shared app top bar header widget used across views (Figma Frame 4).
class AppHeaderBar extends StatelessWidget {
  const AppHeaderBar({
    super.key,
    this.onNotificationPressed,
    this.onProfilePressed,
  });

  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1. Right side in RTL: User Profile Circle Icon
          InkWell(
            onTap: onProfilePressed ?? () {},
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.all(4.r),
              child: SvgPicture.asset(
                AppAssets.userCircleIcon,
                width: 45.w,
                height: 45.h,
              ),
            ),
          ),

          // 2. Center: App Logo
          Image.asset(
            AppAssets.logoApp,
            width: 140.w,
            height: 52.h,
            fit: BoxFit.contain,
          ),

          // 3. Left side in RTL: Notification Bell Action Icon
          InkWell(
            onTap: onNotificationPressed ?? () {},
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.all(4.r),
              child: SvgPicture.asset(
                AppAssets.notificationIcon,
                width: 32.w,
                height: 33.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
