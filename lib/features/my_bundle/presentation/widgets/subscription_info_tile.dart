import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Reusable information row displaying an icon, label, and value.
class SubscriptionInfoRow extends StatelessWidget {
  const SubscriptionInfoRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Right Side: Icon + Label
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 16.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                AppColors.textGrayBrown,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppStyles.alexandria(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeaderDark,
                height: 22 / 14,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),

        // Left Side: Value
        Text(
          value,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textHeaderDark,
            height: 20 / 14,
            letterSpacing: 0.14,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

/// Reusable pricing information row displaying icon, label, amount, and currency.
class SubscriptionPriceRow extends StatelessWidget {
  const SubscriptionPriceRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.amount,
    required this.currency,
  });

  final String iconPath;
  final String label;
  final String amount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Right Side: Icon + Label
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 16.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                AppColors.textGrayBrown,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppStyles.alexandria(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeaderDark,
                height: 22 / 14,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),

        // Left Side: Price + Currency
        Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              amount,
              style: AppStyles.alexandria(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textHeaderDark,
                height: 26 / 18,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 4.w),
            Text(
              currency,
              style: AppStyles.alexandria(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textGrayBrown,
                height: 16 / 12,
                letterSpacing: 0.24,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }
}
