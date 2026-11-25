import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

/// Section 4: Subtle Upgrade Banner (بانر الترقية) matching Figma:
/// - width: 358, height: ~85, border-radius: 12, padding: 14, background: #F0F7FF
/// - Right: 32x32 #FFDF95 circle with lightbulb + Title "محتاج محاولات أكتر؟" + Subtitle
/// - Left: "شوف الباقات" Button (101x28, radius 8, #399CFE, white text)
class SubtleUpgradeBanner extends StatelessWidget {
  const SubtleUpgradeBanner({
    super.key,
    this.onUpgradePressed,
  });

  final VoidCallback? onUpgradePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 358.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.selectedItemLightBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Lightbulb Icon Container (32x32, #FFDF95)
          Container(
            width: 32.w,
            height: 32.h,
            decoration: const BoxDecoration(
              color: AppColors.badgeGoldBg,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppAssets.lightbulbUpgradeIcon,
                width: 14.w,
                height: 16.h,
              ),
            ),
          ),
          SizedBox(width: 10.w),

          // Title & Subtitle Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'محتاج محاولات أكتر؟',
                  style: AppStyles.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 22 / 14,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 2.h),
                Text(
                  'اكتشف باقي باقات فانكوش واختار الأنسب ليك',
                  style: AppStyles.alexandria(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 14 / 10,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),

          // "شوف الباقات" CTA Button (width: 101, height: 28, radius: 8, background: #399CFE)
          GestureDetector(
            onTap: onUpgradePressed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 28.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowSubtleBlack, // 0px 1px 2px 0px #0000000D
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'شوف الباقات',
                style: AppStyles.alexandria(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 16 / 12,
                  letterSpacing: 0.24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
