import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Subscription Summary Card showing current plan, active status badge,
/// remaining attempts count, and "عرض باقتي" navigation link.
///
/// Matches Figma specs: width: 358, minHeight: 117, borderRadius: 18px, padding: 16px.
class ProfileSubscriptionCard extends StatelessWidget {
  const ProfileSubscriptionCard({
    super.key,
    this.planName,
    this.statusText,
    this.remainingAttempts = 28,
    this.onShowMyBundle,
  });

  final String? planName;
  final String? statusText;
  final int remainingAttempts;
  final VoidCallback? onShowMyBundle;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final effectivePlanName = planName ?? l10n.mySubscriptionPrefix;
    final effectiveStatusText = statusText ?? l10n.activeBadge;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowCardDark,
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Row: Medal Icon + Plan Name + Active Badge
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.planMedalIcon,
                        width: 16.r,
                        height: 16.r,
                        colorFilter: const ColorFilter.mode(
                          AppColors.surface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                 RichText(text: TextSpan(
                   children: [
                     TextSpan(
                       text: effectivePlanName,
                       style: AppStyles.alexandria(
                         fontSize: 11.sp,
                         fontWeight: FontWeight.w500,
                         color: AppColors.profileTextMutedBrown,
                       ),
                     ),
                     TextSpan(
                       text: ' ${l10n.fankoshPlus}',
                       style: AppStyles.alexandria(
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w700,
                         color: AppColors.textHeaderDark,
                       ),
                     ),

                   ]
                 )),
                ],
              ),

              // Active Badge ("نشطة")
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.successLight,
                  borderRadius: BorderRadius.circular(9999.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      width: 6.r,
                      height: 6.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.badgeGreenDark,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      effectiveStatusText,
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.badgeGreenDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),
          const Divider(height: 1, thickness: 1, color: AppColors.surfaceMuted),
          SizedBox(height: 12.h),

          // Bottom Row: Remaining Attempts text & "عرض باقتي" button
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Remaining attempts
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$remainingAttempts ',
                      style: AppStyles.alexandria(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textHeaderDark,
                      ),
                    ),
                    TextSpan(
                      text: l10n.attemptsRemainingThisMonth,
                      style: AppStyles.alexandria(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.profileTextMutedBrown,
                      ),
                    ),
                  ],
                ),
                textDirection: TextDirection.rtl,
              ),

              // "عرض باقتي" Link
              InkWell(
                onTap: onShowMyBundle,
                borderRadius: BorderRadius.circular(8.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.viewMyPlan,
                        style: AppStyles.alexandria(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_back,
                        size: 14.sp,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
