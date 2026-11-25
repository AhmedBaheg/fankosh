import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';

/// Summary card displaying the selected subscription plan details:
/// - Exact Figma specs: width: 350, height: 75, border-radius: 12px, padding: 14px, shadow: 0px 1px 2px 0px #0000000D
/// - Right side: "فانكوش بلس" (Alexandria, 18px, Bold, #1B1C1C) & "40 محاولة • 30 يوم" (Alexandria, 14px, Regular, #4E4633)
/// - Left side: "350 جنيه" (Alexandria, 18px, Bold, #1B1C1C) & "تغيير الباقة" (Alexandria, 12px, SemiBold, #399CFE)
class PaymentPlanSummaryCard extends StatelessWidget {
  const PaymentPlanSummaryCard({
    super.key,
    required this.plan,
    this.onChangePlan,
  });

  final SubscriptionPlanModel plan;
  final VoidCallback? onChangePlan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 75.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSubtleBlack,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Right column: Plan Title + Quota/Validity
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                plan.title,
                style: AppStyles.alexandria(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textHeaderDark,
                  height: 22.5 / 18,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 2.h),
              Text(
                '${plan.attempts} محاولة • ${plan.validityDays} يوم',
                style: AppStyles.alexandria(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 22 / 14,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ],
          ),

          // Left column: Price + Change Plan Link
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${plan.price} جنيه',
                style: AppStyles.alexandria(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textHeaderDark,
                  height: 22.5 / 18,
                ),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: onChangePlan ?? () => Navigator.pop(context),
                behavior: HitTestBehavior.opaque,
                child: Text(
                  'تغيير الباقة',
                  style: AppStyles.alexandria(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary,
                    height: 16 / 12,
                    letterSpacing: 0.24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
