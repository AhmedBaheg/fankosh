import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Section 1: Active Plan Card (باقتك الحالية) matching Figma:
/// - width: 359, height: 108, border-radius: 20, padding: 16, background: #FFFFFF
/// - shadow: 0px 4px 18px 0px #190E160A
/// - Top row: "باقتك الحالية" + "نشطة" badge (green dot + #E8F8F3 background)
/// - Bottom row: 44x44 gold medal icon + Plan Name ("فانكوش بلس") + Quota ("28 محاولة متبقية • تنتهي 15 نوفمبر")
class ActivePlanOverviewCard extends StatelessWidget {
  const ActivePlanOverviewCard({
    super.key,
    this.planName = 'فانكوش بلس',
    this.remainingAttempts = 28,
    this.expiryDate = '15 نوفمبر',
    this.isActive = true,
  });

  final String planName;
  final int remainingAttempts;
  final String expiryDate;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 359.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowCardDark, // 0px 4px 18px 0px #190E160A
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Row (RTL): "باقتك الحالية" on right, "نشطة" badge on left
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'باقتك الحالية',
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  height: 14 / 11,
                ),
                textAlign: TextAlign.right,
              ),

              // Active Badge: 64x18, radius: 9999, background: #E8F8F3
              Container(
                height: 18.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.successLight
                      : AppColors.surfaceMuted,
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
                        color: isActive
                            ? AppColors.badgeGreenDark
                            : AppColors.textDisabled,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      isActive ? 'نشطة' : 'غير نشطة',
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? AppColors.badgeGreenDark
                            : AppColors.textTertiary,
                        height: 14 / 11,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Bottom Row (RTL): 44x44 Medal Icon + Title & Remaining Quota
          Row(
            textDirection: TextDirection.rtl,
            children: [
              // 44x44 Gold Medal Icon
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.planMedalIcon,
                    width: 20.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.goldDark5C3D00,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),

              // Plan Name & Quota Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planName,
                      style: AppStyles.alexandria(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textHeaderDark,
                        height: 22.5 / 16,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '$remainingAttempts محاولة متبقية • تنتهي $expiryDate',
                      style: AppStyles.alexandria(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 22 / 14,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
