import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

/// Security Information Strip matching exact Figma specs:
/// - width: 350, height: 64, border-radius: 12px, padding: 12px 16px, background: #F6F3F2
/// - "دفع آمن ومشفر": Cairo, 14px, Bold, #1B1C1C
/// - "نستخدم أعلي معايير الأمان لحماية بياناتك": Cairo, 12px, Regular, #4E4633
/// - Green shield checkmark icon in circular badge
class SecurityInformationStrip extends StatelessWidget {
  const SecurityInformationStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 64.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceWarmMuted,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Green Shield Icon Container on the right
          Container(
            width: 32.w,
            height: 32.h,
            decoration: const BoxDecoration(
              color: AppColors.successLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.shieldCheckIcon,
                width: 14.w,
                height: 16.h,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'دفع آمن ومشفر',
                  style: AppStyles.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 20 / 14,
                    letterSpacing: 0.14,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 2.h),
                Text(
                  'نستخدم أعلي معايير الأمان لحماية بياناتك',
                  style: AppStyles.cairo(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 17.5 / 12,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
