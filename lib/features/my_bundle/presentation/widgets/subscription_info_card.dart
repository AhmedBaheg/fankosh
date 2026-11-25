import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import 'subscription_info_tile.dart';

/// Section 3: Subscription Information Card matching Figma:
/// - width: 358, border-radius: 20, padding: 16, background: #FFFFFF
/// - shadow: 0px 4px 18px 0px #190E160A
/// - 4 information rows:
///   1. تاريخ التفعيل (calendar icon)
///   2. تاريخ الانتهاء (timer icon)
///   3. مدة الباقة (hourglass icon)
///   4. المبلغ المدفوع (receipt icon + amount + currency)
class SubscriptionInfoCard extends StatelessWidget {
  const SubscriptionInfoCard({
    super.key,
    this.activationDate = '15 أكتوبر 2026',
    this.expiryDate = '14 نوفمبر 2026',
    this.duration = '30 يوم',
    this.amountPaid = '350',
    this.currency = 'جنيه',
  });

  final String activationDate;
  final String expiryDate;
  final String duration;
  final String amountPaid;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 358.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
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
          // Row 1: Activation Date (تاريخ التفعيل)
          SubscriptionInfoRow(
            iconPath: AppAssets.calendarIcon,
            label: 'تاريخ التفعيل',
            value: activationDate,
          ),
          _buildDivider(),

          // Row 2: Expiry Date (تاريخ الانتهاء)
          SubscriptionInfoRow(
            iconPath: AppAssets.timerIcon,
            label: 'تاريخ الانتهاء',
            value: expiryDate,
          ),
          _buildDivider(),

          // Row 3: Duration (مدة الباقة)
          SubscriptionInfoRow(
            iconPath: AppAssets.hourglassIcon,
            label: 'مدة الباقة',
            value: duration,
          ),
          _buildDivider(),

          // Row 4: Amount Paid (المبلغ المدفوع)
          SubscriptionPriceRow(
            iconPath: AppAssets.paidReceiptIcon,
            label: 'المبلغ المدفوع',
            amount: amountPaid,
            currency: currency,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      height: 1.h,
      color: AppColors.surfaceMuted,
    );
  }
}
