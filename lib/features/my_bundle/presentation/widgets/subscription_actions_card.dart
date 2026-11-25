import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

/// Section 3: Subscription Actions Card (إجراءات الاشتراك) matching Figma:
/// - width: 358, height: ~142, border-radius: 12, background: #FFFFFF
/// - Dual shadows: 0px 1px 3px rgba(34, 34, 34, 0.04), 0px 4px 20px -2px rgba(255, 174, 0, 0.06)
/// - Action 1: "تفاصيل الباقة" with blue document icon (#EBF4FF)
/// - Action 2: "تجديد أو تغيير الباقة" with red circular refresh icon (#FFF0EF)
class SubscriptionActionsCard extends StatelessWidget {
  const SubscriptionActionsCard({
    super.key,
    this.onDetailsPressed,
    this.onRenewPressed,
  });

  final VoidCallback? onDetailsPressed;
  final VoidCallback? onRenewPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 358.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowCardDark, // 0px 1px 3px 0px #2222220A
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: AppColors.shadowGold08, // 0px 4px 20px -2px #FFAE000F
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Action 1: تفاصيل الباقة
          _ActionRow(
            iconPath: AppAssets.planDetailsIcon,
            iconBgColor: AppColors.blueLight2,
            iconColor: AppColors.secondary,
            title: 'تفاصيل الباقة',
            subtitle: 'عرض كل تفاصيل اشتراكك',
            onTap: onDetailsPressed,
          ),

          // Divider
          Container(
            height: 1.h,
            color: AppColors.surfaceWarmLight,
          ),

          // Action 2: تجديد أو تغيير الباقة
          _ActionRow(
            iconPath: AppAssets.renewPlanIcon,
            iconBgColor: AppColors.errorSurfaceLight,
            iconColor: AppColors.error,
            title: 'تجديد أو تغيير الباقة',
            subtitle: 'اختار باقة جديدة أو جدّد اشتراكك',
            onTap: onRenewPressed,
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.iconPath,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String iconPath;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // 40x40 Rounded icon container
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 16.w,
                  height: 18.h,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 25.6 / 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    subtitle,
                    style: AppStyles.cairo(
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

            // Left Chevron Arrow (6x10)
            SvgPicture.asset(
              AppAssets.icLeft,
              width: 6.w,
              height: 10.h,
              colorFilter: const ColorFilter.mode(
                AppColors.borderWarmGray,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
