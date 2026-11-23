import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Header component for Subscription Plans view (Figma Frame 3).
class SubscriptionPlansHeader extends StatelessWidget {
  const SubscriptionPlansHeader({
    super.key,
    this.onSkipPressed,
  });

  final VoidCallback? onSkipPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Top Bar: Logo & "تخطي الآن" Action Link
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onSkipPressed ?? () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.skipNow,
                style: AppTextStyles.buttonSecondary.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
            ),
            Image.asset(
              AppAssets.logoApp,
              width: 140.w,
              height: 56.h,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 60.w), // Spacer for centering logo
          ],
        ),
        SizedBox(height: 24.h),

        // 2. Main Headline Title
        Text(
          l10n.plansTitle,
          style: AppTextStyles.displayMedium.copyWith(
            fontSize: 23.sp,
            fontWeight: FontWeight.w900,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),

        // 3. Subtitle
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            l10n.plansSubtitle,
            style: AppTextStyles.titleMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
