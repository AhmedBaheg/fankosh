import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Single navigation item tab component for custom bottom navigation bar.
class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.onTap,
  });

  final int index;
  final int currentIndex;
  final String label;
  final String activeIcon;
  final String inactiveIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isActive ? 122.w : 80.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: isActive
              ? Border.all(
                  color: AppColors.navBorder,
                  width: 2.w,
                )
              : null,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 1,
                offset: const Offset(-1, 3),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            SvgPicture.asset(
              isActive ? activeIcon : inactiveIcon,
              width: 22.w,
              height: 22.h,
            ),
            SizedBox(height: 2.h),

            // Text Label
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 12.sp,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                color: isActive ? AppColors.textWhite : AppColors.navText,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
