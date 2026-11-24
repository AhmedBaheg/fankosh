import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Secondary upload audio file pill button matching Figma Frame 4 (Node 1:3372).
class UploadAudioButton extends StatelessWidget {
  const UploadAudioButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: InkWell(
        onTap: onPressed ?? () {},
        borderRadius: BorderRadius.circular(24.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: AppColors.primary,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.icUpload,
                width: 16.w,
                height: 16.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                l10n.orUploadAudio,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
