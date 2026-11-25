import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Modular selectable option tile for language selection sheet matching Figma specs.
class LanguageOptionTile extends StatelessWidget {
  const LanguageOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.badgeTextColor,
    required this.badgeBgColor,
    required this.badgeBorderColor,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String badgeText;
  final Color badgeTextColor;
  final Color badgeBgColor;
  final Color badgeBorderColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: isSelected ? 72.h : 70.h,
        constraints: BoxConstraints(minHeight: 56.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selectedItemLightBlue : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.borderECECEC,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Right: Badge & Titles
            Row(
              textDirection: TextDirection.rtl,
              children: [
                // Circular Language Icon Badge (40x40)
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: badgeBgColor,
                    border: Border.all(color: badgeBorderColor, width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      badgeText,
                      style: AppStyles.cairo(
                        fontSize: badgeText.length > 1 ? 14.sp : 15.sp,
                        fontWeight: FontWeight.w700,
                        color: badgeTextColor,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Title & Subtitle Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                        height: 21 / 14,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppStyles.cairo(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.profileTextSlate,
                        height: 18 / 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Left: Custom Radio Circle
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.secondary : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.secondary
                      : AppColors.borderLightGray,
                  width: 2.0,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
