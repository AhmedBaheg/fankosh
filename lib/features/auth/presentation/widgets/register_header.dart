import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Stateless header widget for Register view matching Figma Frame 2.
class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 55.h),

        // 1. Fankosh Colorful App Logo (Figma Frame 2)
        Center(
          child: Image.asset(
            AppAssets.logoApp,
            width: 220.w,
            height: 88.h,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 24.h),

        // 2. Title: "يلا ندخلك جوا القفشات! 🎬"
        Text(
          l10n.registerTitle,
          style: AppTextStyles.displayMedium.copyWith(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 6.h),

        // 3. Subtitle: "اعمل حسابك وخلي الضحك يبدأ مع فانكوش."
        Text(
          l10n.registerSubtitle,
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
