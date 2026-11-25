import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Centered title and subtitle for the main profile view.
class ProfileHeaderTitle extends StatelessWidget {
  const ProfileHeaderTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.alexandria(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textHeaderDark,
            height: 36 / 28,
            letterSpacing: -0.7,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textMutedBrown,
            height: 22 / 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
