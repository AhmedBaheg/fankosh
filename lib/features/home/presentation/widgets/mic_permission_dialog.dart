import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Modal dialog widget for microphone permission request matching Figma Frame 5 reference screenshot.
class MicPermissionDialog extends StatelessWidget {
  const MicPermissionDialog({super.key});

  /// Displays the custom microphone permission modal dialog with dimmed background blur.
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.35),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: const MicPermissionDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: AppColors.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: 324.w,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Microphone Permission Circular Badge Icon (Node 1:5075)
            SvgPicture.asset(
              AppAssets.icMicPermission,
              width: 68.w,
              height: 68.h,
            ),
            SizedBox(height: 18.h),

            // 2. Bold Headline Title ("عايزين نسمعك")
            Text(
              l10n.micPermissionTitle,
              style: AppTextStyles.headlineMedium.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),

            // 3. Subtitle Description Explanation
            Text(
              l10n.micPermissionSubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26.h),

            // 4. Primary Yellow Button ("سماح" + Checkmark Icon)
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icAllow,
                      width: 16.w,
                      height: 16.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      l10n.allowAccess,
                      style: AppTextStyles.buttonMedium.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // 5. Secondary Light-Gray Button ("مش دلوقتي")
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: TextButton(
                onPressed: () => Navigator.pop(context, false),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.surfaceMuted,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Text(
                  l10n.notNow,
                  style: AppTextStyles.buttonSecondary.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
