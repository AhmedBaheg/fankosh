import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/utils/assets.dart';
import 'order_summary_row.dart';

/// Card 2 of Review Subscription screen: Order Summary Card ("ملخص الطلب").
class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Row: "ملخص الطلب" on right, Receipt icon on left
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ملخص الطلب',
                style: AppStyles.alexandria(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textHeaderDark,
                  height: 26 / 15,
                ),
              ),
              Container(
                width: 28.w,
                height: 28.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceWarmLight,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.receiptIcon,
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Row 1: "الباقة" -> "فانكوش بلس"
          OrderSummaryRow(
            label: 'الباقة',
            value: plan.title,
          ),
          SizedBox(height: 10.h),

          // Row 2: "السعر الأساسي" -> "350 جنيه"
          OrderSummaryRow(
            label: 'السعر الأساسي',
            value: '${plan.price} جنيه',
          ),
          SizedBox(height: 14.h),

          // Divider
          const Divider(
            color: AppColors.borderF0EBE1,
            thickness: 1.0,
            height: 1.0,
          ),
          SizedBox(height: 14.h),

          // Row 3: "الإجمالي" -> "350 جنيه"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الإجمالي',
                    style: AppStyles.alexandria(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 26 / 16,
                    ),
                  ),
                  Text(
                    'شامل الضريبة وكافة المزايا',
                    style: AppStyles.alexandria(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      height: 14 / 11,
                    ),
                  ),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${plan.price}',
                    style: AppStyles.alexandria(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 30 / 20,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'جنيه',
                    style: AppStyles.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.24,
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
