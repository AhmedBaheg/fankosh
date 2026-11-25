import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Hero section of the Remaining Attempts bottom sheet:
/// - Glowing circular lightning badge (94x94)
/// - Main Title: "محاولاتك في فانكوش ⚡" (Cairo, 24sp, 900, #1E232A)
/// - Subtitle: "فاضلك [3] محاولات مجانية" (dynamic count)
class RemainingAttemptsHero extends StatelessWidget {
  const RemainingAttemptsHero({
    super.key,
    required this.remainingAttempts,
  });

  final int remainingAttempts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Hero Glowing Circular Lightning Badge
        SvgPicture.asset(
          AppAssets.glowingLightningBadgeIcon,
          width: 94.w,
          height: 94.h,
        ),
        SizedBox(height: 18.h),

        // Main Title: "محاولاتك في فانكوش ⚡"
        Text(
          'محاولاتك في فانكوش ⚡',
          style: AppStyles.cairo(
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
            color: AppColors.textDarkNavyCharcoal,
            height: 32 / 24,
            letterSpacing: -0.6,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),

        // Subtitle: "فاضلك [3] محاولات مجانية"
        RichText(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          text: TextSpan(
            style: AppStyles.cairo(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textTertiary,
              height: 22.5 / 15,
            ),
            children: [
              const TextSpan(text: 'فاضلك '),
              TextSpan(
                text: '$remainingAttempts',
                style: AppStyles.cairo(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.amberWarning,
                  height: 24 / 16,
                ),
              ),
              const TextSpan(text: ' محاولات مجانية'),
            ],
          ),
        ),
      ],
    );
  }
}
