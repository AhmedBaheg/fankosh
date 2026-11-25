import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Reusable key-value row for order summaries.
class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 22 / 14,
          ),
        ),
        Text(
          value,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textHeaderDark,
            height: 22 / 14,
          ),
        ),
      ],
    );
  }
}
