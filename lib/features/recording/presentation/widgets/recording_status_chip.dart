import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/audio_helper.dart';
import '../../../../l10n/app_localizations.dart';

/// White pill container displaying active recording timer & blinking status indicator (Figma Frame 6).
class RecordingStatusChip extends StatefulWidget {
  const RecordingStatusChip({
    super.key,
    required this.elapsedSeconds,
  });

  final int elapsedSeconds;

  @override
  State<RecordingStatusChip> createState() => _RecordingStatusChipState();
}

class _RecordingStatusChipState extends State<RecordingStatusChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Dynamic Recording Duration Timer ("00:05") using shared AudioHelper
            Text(
              AudioHelper.formatDuration(widget.elapsedSeconds),
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 14.w),

            // 2. Vertical Divider Line
            Container(
              width: 1.w,
              height: 14.h,
              color: AppColors.borderLight,
            ),
            SizedBox(width: 14.w),

            // 3. Blinking Red Recording Dot & "جاري التسجيل..." Text
            FadeTransition(
              opacity: _blinkController,
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.error,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              l10n.recordingInProgress,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
