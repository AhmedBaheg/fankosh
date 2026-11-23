import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Stateless header widget for Login view matching Figma Frame 1.
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Fankosh Colorful App Logo (Figma Frame 1)
        Center(
          child: Image.asset(
            AppAssets.logoApp,
            width: 220.w,
            height: 88.h,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 39.h),

        // 2. Title: "نورت فانكوش تاني! 🎬"
        Text(
          l10n.loginTitle,
          style: AppTextStyles.displayMedium.copyWith(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 7.h),

        // 3. Subtitle: "سجّل دخولك وكمّل قفشاتك."
        Text(
          l10n.loginSubtitle,
          style: AppTextStyles.subtitleLarge.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
