import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import 'attempts_counter_row.dart';
import 'attempts_progress_bar.dart';

/// Section 2: Remaining Attempts Card (بطاقة المحاولات المتبقية) matching Figma:
/// - width: 358, height: 160, border-radius: 12, padding: 16, background: #FFFFFF
/// - Header: 28x28 #FFDF95 circle with lightning bolt + "المحاولات المتبقية" (18px Bold)
/// - Counter: "28" (28px #399CFE Bold) + "من 40 محاولة" (14px SemiBold)
/// - Visual dynamic progress bar: 10px height, #399CFE fill on #E5E2E1, RTL
/// - Caption row: "استخدم محاولاتك قبل انتهاء الباقة." + "70% متبقي" (dynamic)
class RemainingAttemptsCard extends StatelessWidget {
  const RemainingAttemptsCard({
    super.key,
    this.title = 'المحاولات المتبقية',
    this.remainingAttempts = 28,
    this.totalAttempts = 40,
    this.counterSuffix,
    this.percentageOnLeft = false,
    this.showInfoIcon = false,
    this.showCircleIconBackground = true,
  });

  final String title;
  final int remainingAttempts;
  final int totalAttempts;
  final String? counterSuffix;
  final bool percentageOnLeft;
  final bool showInfoIcon;
  final bool showCircleIconBackground;

  @override
  Widget build(BuildContext context) {
    final progress = (totalAttempts > 0)
        ? (remainingAttempts / totalAttempts).clamp(0.0, 1.0)
        : 0.0;
    final percentage = (progress * 100).toInt();

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 358.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSubtleBlack,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Row (RTL): Circle With Lightning OR Inline Lightning + Title
          Row(
            textDirection: TextDirection.rtl,
            children: [
              if (showCircleIconBackground)
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: const BoxDecoration(
                    color: AppColors.badgeGoldBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.benefitLightningIcon,
                      width: 12.w,
                      height: 12.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryDark,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              else
                SvgPicture.asset(
                  AppAssets.benefitLightningIcon,
                  width: 14.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryDark,
                    BlendMode.srcIn,
                  ),
                ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppStyles.alexandria(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textHeaderDark,
                  height: 26 / 18,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(height: 10.h),

          // Attempts Counter Row (RTL)
          AttemptsCounterRow(
            remainingAttempts: remainingAttempts,
            totalAttempts: totalAttempts,
            counterSuffix: counterSuffix,
            percentageOnLeft: percentageOnLeft,
            percentage: percentage,
          ),
          SizedBox(height: 10.h),

          // Visual Progress Bar
          AttemptsProgressBar(progress: progress),
          SizedBox(height: 10.h),

          // Helper Caption Row (RTL): "استخدم محاولاتك قبل انتهاء الباقة." + "% متبقي"
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: percentageOnLeft
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              if (showInfoIcon) ...[
                SvgPicture.asset(
                  AppAssets.informationIcon,
                  width: 13.w,
                  height: 13.h,
                ),
                SizedBox(width: 4.w),
              ],
              Text(
                'استخدم محاولاتك قبل انتهاء الباقة.',
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: percentageOnLeft
                      ? AppColors.textGrayBrown
                      : AppColors.textSecondary,
                  height: 14 / 11,
                ),
                textAlign: TextAlign.right,
              ),
              if (!percentageOnLeft)
                Text(
                  '$percentage% متبقي',
                  style: AppStyles.alexandria(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                    height: 14 / 11,
                  ),
                  textAlign: TextAlign.left,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
