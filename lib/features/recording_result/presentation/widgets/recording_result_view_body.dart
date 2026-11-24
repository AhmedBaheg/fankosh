import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'audio_player_card.dart';
import 'recording_result_actions_row.dart';

/// Main body layout component for recording result / playback screen matching Figma Frame 7.
/// Dynamically connects user's actual recorded voice duration.
class RecordingResultViewBody extends StatelessWidget {
  const RecordingResultViewBody({
    super.key,
    required this.recordedDurationSeconds,
    this.onDeletePressed,
    this.onRecordAgainPressed,
    this.onFindPunchlinePressed,
  });

  final int recordedDurationSeconds;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onRecordAgainPressed;
  final VoidCallback? onFindPunchlinePressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // 1. Shared Application Top Header
        const AppHeaderBar(),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 28.h),

                // 2. Main Title ("ده تسجيلك!")
                Text(
                  l10n.recordingResultTitle,
                  style: AppTextStyles.displayMedium.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimaryDark,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),

                // 3. Subtitle ("اسمعه ولو حابب سجل من جديد")
                Text(
                  l10n.recordingResultSubtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),

                // 4. White Audio Player Card (Dynamic Waveform + Recorded Voice Duration + Play Button)
                AudioPlayerCard(
                  totalDurationSeconds: recordedDurationSeconds,
                  initialPositionSeconds: 0,
                ),
                SizedBox(height: 24.h),

                // 5. Secondary Action Buttons ("حذف التسجيل" & "سجل من جديد")
                RecordingResultActionsRow(
                  onDeletePressed: onDeletePressed ??
                      () {
                        Navigator.pushReplacementNamed(context, Routes.homeView);
                      },
                  onRecordAgainPressed: onRecordAgainPressed ??
                      () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.recordingView,
                        );
                      },
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),

        // 6. Bottom Primary Recognition CTA ("يلا نلاقي الإفيه! ✨")
        Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Center(
            child: PrimaryButton(
              text: l10n.findPunchline,
              icon: AppAssets.sparklesIcon,
              width: 310.w,
              height: 56.h,
              borderRadius: 16.r,
              onPressed: onFindPunchlinePressed ??
                  () {
                    if (recordedDurationSeconds <= 0) return;
                    Navigator.pushNamed(
                      context,
                      Routes.recognitionProcessingView,
                      arguments: recordedDurationSeconds,
                    );
                  },
            ),
          ),
        ),
      ],
    );
  }
}
