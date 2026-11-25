import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Counter row displaying remaining attempts, total attempts, and optional percentage on left.
class AttemptsCounterRow extends StatelessWidget {
  const AttemptsCounterRow({
    super.key,
    required this.remainingAttempts,
    required this.totalAttempts,
    this.counterSuffix,
    this.percentageOnLeft = false,
    required this.percentage,
  });

  final int remainingAttempts;
  final int totalAttempts;
  final String? counterSuffix;
  final bool percentageOnLeft;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$remainingAttempts',
              style: AppStyles.alexandria(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.secondary,
                height: 32 / 28,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(width: 6.w),
            Text(
              counterSuffix ?? 'من $totalAttempts محاولة',
              style: AppStyles.alexandria(
                fontSize: 14.sp,
                fontWeight: percentageOnLeft ? FontWeight.w400 : FontWeight.w600,
                color: percentageOnLeft
                    ? AppColors.textGrayBrown
                    : AppColors.textSecondary,
                height: 22 / 14,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        if (percentageOnLeft)
          Text(
            '$percentage%',
            style: AppStyles.alexandria(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              height: 16 / 12,
              letterSpacing: 0.24,
            ),
            textAlign: TextAlign.left,
          ),
      ],
    );
  }
}
