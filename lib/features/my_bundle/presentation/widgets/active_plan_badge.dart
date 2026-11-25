import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Active Plan Badge matching Figma specs:
/// - height: 24, padding: 4h 12w, border-radius: 9999px, background: #E8FAF4
/// - Dot: 6x6 circle, background: #0A9E77
/// - Text: "نشطة" (Alexandria Bold 12px, #0A9E77)
class ActivePlanBadge extends StatelessWidget {
  const ActivePlanBadge({
    super.key,
    this.text = 'نشطة',
    this.isActive = true,
  });

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        isActive ? AppColors.activeBadgeMintBg : AppColors.surfaceMuted;
    final dotColor =
        isActive ? AppColors.activeBadgeGreen : AppColors.textDisabled;
    final textColor =
        isActive ? AppColors.activeBadgeGreen : AppColors.textTertiary;

    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            text,
            style: AppStyles.alexandria(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
              height: 16 / 12,
              letterSpacing: 0.24,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
