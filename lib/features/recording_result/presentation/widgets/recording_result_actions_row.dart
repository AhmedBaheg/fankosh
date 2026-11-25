import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Horizontal row containing "حذف التسجيل" and "سجل من جديد" secondary action buttons (Figma Frame 7).
class RecordingResultActionsRow extends StatelessWidget {
  const RecordingResultActionsRow({
    super.key,
    this.onDeletePressed,
    this.onRecordAgainPressed,
  });

  final VoidCallback? onDeletePressed;
  final VoidCallback? onRecordAgainPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: SizedBox(
        width: 310.w,
        child: Row(
          children: [
            // 1. "سجل من جديد" Button (Record Again)
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: ElevatedButton(
                  onPressed: onRecordAgainPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surfaceMuted,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.recordAgainIcon,
                        width: 12.w,
                        height: 16.h,
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          l10n.recordAgain,
                          style: AppTextStyles.buttonSecondary.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            // 2. "حذف التسجيل" Button (Delete Recording)
            Expanded(
              child: SizedBox(
                height: 48.h,
                child: ElevatedButton(
                  onPressed: onDeletePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surfaceMuted,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.deleteIcon,
                        width: 14.w,
                        height: 15.h,
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          l10n.deleteRecording,
                          style: AppTextStyles.buttonSecondary.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
