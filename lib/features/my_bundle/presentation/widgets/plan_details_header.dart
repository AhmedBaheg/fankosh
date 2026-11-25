import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Header section for Plan Details with centered title/subtitle and circular back button.
class PlanDetailsHeader extends StatelessWidget {
  const PlanDetailsHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Centered Titles
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppStyles.alexandria(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textHeaderDark,
                height: 30 / 22,
                letterSpacing: -0.55,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: AppStyles.alexandria(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrayBrown,
                height: 22 / 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        // Right-aligned Circular Back Button (RTL)
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: onBackPressed ?? () => Navigator.maybePop(context),
            borderRadius: BorderRadius.circular(9999),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.borderLight.withValues(alpha: 0.7),
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowSubtle,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.chevronRightIcon,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
