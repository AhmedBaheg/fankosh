import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

/// Single navigation item tab component for custom bottom navigation bar matching Figma Frame 1171275654.
///
/// Selected:
/// - width: 104, height: 58, border-radius: 27
/// - background: #FEC529 / #FFC928
/// - border: 1px solid #FCD66C
/// - shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25)
/// - icon: 18x20, white
/// - text: Cairo, Bold (700), 12px, line-height 18px, letter-spacing -0.3, white
/// - Indicator Dot: 4x4 circle, white, centered beneath text
///
/// Unselected:
/// - width: 104, height: 58
/// - icon: 18x20, #6B6965
/// - text: Cairo, Regular (400), 12px, line-height 18px, letter-spacing -0.3, #6B6965
class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.label,
    this.icon,
    this.activeIcon,
    this.inactiveIcon,
    required this.onTap,
  });

  final int index;
  final int currentIndex;
  final String label;
  final String? icon;
  final String? activeIcon;
  final String? inactiveIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;
    final iconAsset = icon ?? (isActive ? (activeIcon ?? inactiveIcon!) : (inactiveIcon ?? activeIcon!));

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 104.w,
        height: 58.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(27.r),
          border: isActive
              ? Border.all(
                  color: AppColors.navBorder,
                  width: 1.0,
                )
              : null,
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    color: AppColors.shadow40, // 0px 4px 4px 0px #00000040
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon (18w x 20h)
            SvgPicture.asset(
              iconAsset,
              width: 18.w,
              height: 20.h,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : AppColors.navText,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 2.h),

            // Text Label (Cairo, 12sp, Bold if active, Regular if inactive)
            Text(
              label,
              style: AppStyles.cairo(
                fontSize: 12.sp,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                color: isActive ? Colors.white : AppColors.navText,
                height: 18 / 12,
                letterSpacing: -0.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),

            // Indicator Dot Centered Beneath Active Tab (4x4 white circle)
            SizedBox(height: 2.h),
            if (isActive)
              Container(
                width: 4.w,
                height: 4.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              )
            else
              SizedBox(height: 4.h), // Maintains identical vertical alignment
          ],
        ),
      ),
    );
  }
}
