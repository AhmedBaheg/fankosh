import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Large circular coral-red stop button component using stop_recording.svg (Figma Frame 6).
class StopRecordingButton extends StatelessWidget {
  const StopRecordingButton({
    super.key,
    required this.onStopPressed,
    this.maxDurationSeconds = 5,
  });

  final VoidCallback onStopPressed;
  final int maxDurationSeconds;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // Stop recording button icon SVG (Node 1:6377)
        GestureDetector(
          onTap: onStopPressed,
          behavior: HitTestBehavior.opaque,
          child: SvgPicture.asset(
            AppAssets.stopRecordingIcon,
            width: 110.w,
            height: 110.h,
          ),
        ),
        SizedBox(height: 16.h),

        // Primary Instruction Label: "اضغط لإنهاء التسجيل"
        Text(
          l10n.tapToStopRecording,
          style: AppTextStyles.buttonMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.h),

        // Secondary Instruction Helper: Timer clock icon + "الحد الأقصى للتسجيل: 05 ثانية"
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.timerIcon,
                width: 14.w,
                height: 14.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  l10n.maxRecordingDuration(
                    maxDurationSeconds.toString().padLeft(2, '0'),
                  ),
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
