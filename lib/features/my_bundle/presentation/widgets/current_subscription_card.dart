import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'subscription_stat_box.dart';

/// Section 1: Current Subscription Card (بطاقة الباقة الحالية) matching Figma:
/// - width: 358, height: ~163, border-radius: 12, padding: 16, background: #FFFFFF
/// - Header: 44x44 #FEC529 medal icon + Plan Name + Attempts & Validity + "الباقة الحالية" Badge
/// - Info boxes: Amount Paid (المبلغ المدفوع) + Expiry Date (تاريخ الانتهاء)
class CurrentSubscriptionCard extends StatelessWidget {
  const CurrentSubscriptionCard({
    super.key,
    this.planName = 'فانكوش بلس',
    this.planQuota = '40 محاولة • 30 يوم',
    this.badgeText = 'الباقة الحالية',
    this.badge,
    this.amountPaid = '350 ج.م',
    this.expiryDate = '30 نوفمبر 2026',
    this.showBottomBoxes = true,
  });

  final String planName;
  final String planQuota;
  final String badgeText;
  final Widget? badge;
  final String amountPaid;
  final String expiryDate;
  final bool showBottomBoxes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 358.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSubtleBlack, // 0px 1px 3px 0px rgba(0, 0, 0, 0.05)
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Row (RTL): Icon + Plan Info on right, Current Badge on left
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon + Name & Quota
              Row(
                children: [
                  // 44x44 #FEC529 Icon Container with medal
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
                        width: 18.w,
                        height: 22.h,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryExtraDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  // Plan Title and Quota
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planName,
                        style: AppStyles.alexandria(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimaryDark,
                          height: 22.5 / 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        planQuota,
                        style: AppStyles.alexandria(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                          height: 16 / 12,
                          letterSpacing: 0.24,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),

              // Badge (defaults to "الباقة الحالية", or custom badge)
              badge ??
                  Container(
                    height: 24.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.badgeGoldBg,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Center(
                      child: Text(
                        badgeText,
                        style: AppStyles.alexandria(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryExtraDark,
                          height: 16 / 12,
                          letterSpacing: 0.24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
            ],
          ),
          if (showBottomBoxes) ...[
            SizedBox(height: 14.h),

            // Divider
            Container(height: 1.h, color: AppColors.surfaceMuted),
            SizedBox(height: 14.h),

            // Bottom Row (RTL): Amount Paid & Expiry Date Boxes
            Row(
              textDirection: TextDirection.rtl,
              children: [
                // Box 1: Amount Paid (المبلغ المدفوع)
                Expanded(
                  child: SubscriptionStatBox(
                    title: 'المبلغ المدفوع',
                    value: amountPaid,
                    iconPath: AppAssets.paidReceiptIcon,
                  ),
                ),
                SizedBox(width: 10.w),

                // Box 2: Expiry Date (تاريخ الانتهاء)
                Expanded(
                  child: SubscriptionStatBox(
                    title: 'تاريخ الانتهاء',
                    value: expiryDate,
                    iconPath: AppAssets.calendarIcon,
                    iconColor: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
