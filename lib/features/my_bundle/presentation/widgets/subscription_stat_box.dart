import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Reusable stat box for subscription details (e.g. Amount Paid, Expiry Date).
class SubscriptionStatBox extends StatelessWidget {
  const SubscriptionStatBox({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
    this.iconColor,
  });

  final String title;
  final String value;
  final String iconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceWarmMuted,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.alexandria(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              height: 14 / 10,
              letterSpacing: 0.0,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 3.h),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 14.w,
                height: 14.h,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              ),
              SizedBox(width: 4.w),
              Text(
                value,
                style: AppStyles.alexandria(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textHeaderDark,
                  height: 20 / 14,
                  letterSpacing: 0.14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
