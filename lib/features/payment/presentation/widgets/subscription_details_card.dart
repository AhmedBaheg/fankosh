import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';

/// Subscription Details Card ("تفاصيل اشتراكك") matching exact Figma specs:
/// - width: 350, border-radius: 18, padding: 20
/// - background: linear gradient from #FFFFFF to rgba(246, 243, 242, 0.4)
/// - shadow: 0px 2px 8px rgba(0, 0, 0, 0.03)
/// - Rows for: الباقة, المحاولات, المدة, المبلغ المدفوع
class SubscriptionDetailsCard extends StatelessWidget {
  const SubscriptionDetailsCard({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanModel plan;

  Widget _buildDetailRow({
    required String label,
    required String value,
    FontWeight valueWeight = FontWeight.w500,
  }) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label
        Text(
          label,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 22 / 14,
          ),
          textDirection: TextDirection.rtl,
        ),

        // Value
        Text(
          value,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: valueWeight,
            color: AppColors.textHeaderDark,
            height: 22 / 14,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.surface,
            AppColors.surfaceWarmMuted.withValues(alpha: 0.4),
          ],
        ),
        border: Border.all(
          color: AppColors.surfaceMutedGray,
          width: 1.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight, // 0px 2px 8px #00000008
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card Title: "تفاصيل اشتراكك"
          Text(
            'تفاصيل اشتراكك',
            style: AppStyles.alexandria(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textHeaderDark,
              height: 26 / 18,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 16.h),

          // Row 1: الباقة (e.g. فانكوش بلس)
          _buildDetailRow(
            label: 'الباقة',
            value: plan.title,
            valueWeight: FontWeight.w600,
          ),
          Divider(
            color: AppColors.surfaceMutedGray,
            height: 22.h,
            thickness: 1,
          ),

          // Row 2: المحاولات (e.g. 40 محاولة)
          _buildDetailRow(
            label: 'المحاولات',
            value: '${plan.attempts} محاولة',
            valueWeight: FontWeight.w500,
          ),
          Divider(
            color: AppColors.surfaceMutedGray,
            height: 22.h,
            thickness: 1,
          ),

          // Row 3: المدة (e.g. 30 يوم)
          _buildDetailRow(
            label: 'المدة',
            value: '${plan.validityDays} يوم',
            valueWeight: FontWeight.w500,
          ),
          Divider(
            color: AppColors.surfaceMutedGray,
            height: 22.h,
            thickness: 1,
          ),

          // Row 4: المبلغ المدفوع (e.g. 350 جنيه)
          _buildDetailRow(
            label: 'المبلغ المدفوع',
            value: '${plan.price} جنيه',
            valueWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
