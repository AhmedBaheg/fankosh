import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../logic/recognition_controller.dart';
import 'ai_response_message_card.dart';
import 'bottom_search_input_bar.dart';
import 'compact_audio_preview_card.dart';
import 'generated_response_audio_player.dart';
import 'recognition_search_status_card.dart';

/// Main body layout for Recognition Chat Screen (Figma Pages 8, 9 & 10).
/// Refactored to separate recognition lifecycle management into [RecognitionController].
class RecognitionProcessingViewBody extends StatefulWidget {
  const RecognitionProcessingViewBody({
    super.key,
    this.recordedDurationSeconds = 5,
    this.onRecognitionSuccess,
    this.onRecognitionFailed,
  });

  final int recordedDurationSeconds;
  final VoidCallback? onRecognitionSuccess;
  final ValueChanged<String>? onRecognitionFailed;

  @override
  State<RecognitionProcessingViewBody> createState() =>
      _RecognitionProcessingViewBodyState();
}

class _RecognitionProcessingViewBodyState
    extends State<RecognitionProcessingViewBody> {
  late final RecognitionController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RecognitionController(
      userRecordingDuration: widget.recordedDurationSeconds,
      onSuccess: widget.onRecognitionSuccess,
      onFailure: widget.onRecognitionFailed,
    )..processRequest();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
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
                    SizedBox(height: 24.h),

                    // 2. Title ("فانكوش بيحضّرك الرد! 🍿")
                    Text(
                      l10n.processingTitle,
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimaryDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),

                    // 3. Compact Audio Preview Card (Displays User's actual recording duration)
                    CompactAudioPreviewCard(
                      durationSeconds: widget.recordedDurationSeconds,
                    ),
                    SizedBox(height: 20.h),

                    // 4. State-Driven Content Area
                    if (_controller.status == RecognitionStatus.processing) ...[
                      // Page 8: Searching Status Card
                      const RecognitionSearchStatusCard(),
                    ] else if (_controller.status == RecognitionStatus.success) ...[
                      // Pages 9 & 10: AI Match Result Card
                      const AiResponseMessageCard(),
                      SizedBox(height: 16.h),

                      // Generated AI Audio Response Player
                      GeneratedResponseAudioPlayer(
                        totalDurationSeconds:
                            _controller.result?.responseAudioDuration ?? 22,
                        initialPositionSeconds: 0,
                      ),
                    ] else if (_controller.status == RecognitionStatus.failure) ...[
                      // Failure State with Retry Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: AppColors.errorLight),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline_rounded,
                                size: 40.r,
                                color: AppColors.error,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                _controller.errorMessage ??
                                    'حدث خطأ أثناء التعرف على الإفيه',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textPrimary,
                                  fontSize: 14.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: _controller.retry,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 10.h,
                                  ),
                                ),
                                child: Text(
                                  l10n.retry,
                                  style: AppTextStyles.buttonMedium.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),

            // 5. Bottom Search Input Bar
            BottomSearchInputBar(
              isSearching: _controller.status == RecognitionStatus.processing,
            ),
          ],
        );
      },
    );
  }
}
