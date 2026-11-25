import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import 'ai_response_message_card.dart';
import 'bottom_search_input_bar.dart';
import 'compact_audio_preview_card.dart';
import 'generated_response_audio_player.dart';

/// Main body layout for Pages 9 & 10 (Recognition Response Screen).
class RecognitionResponseViewBody extends StatelessWidget {
  const RecognitionResponseViewBody({
    super.key,
    this.recordedDurationSeconds = 5,
    this.responseAudioSeconds = 22,
    this.audioFilePath,
  });

  final int recordedDurationSeconds;
  final int responseAudioSeconds;
  final String? audioFilePath;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // 1. Shared App Header
        const AppHeaderBar(),

        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),

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
                SizedBox(height: 14.h),

                // 3. Compact Audio Preview Card (User's original submission)
                CompactAudioPreviewCard(
                  durationSeconds: recordedDurationSeconds,
                  audioFilePath: audioFilePath,
                ),
                SizedBox(height: 16.h),

                // 4. AI Match Message Card ("أيووووه! قفشت الإفيه! 😍")
                const AiResponseMessageCard(),
                SizedBox(height: 16.h),

                // 5. Generated AI Response Audio Player (Pages 9 & 10)
                GeneratedResponseAudioPlayer(
                  totalDurationSeconds: responseAudioSeconds,
                  initialPositionSeconds: 8,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),

        // 6. Bottom Search Bar Input
        const BottomSearchInputBar(
          isSearching: false,
        ),
      ],
    );
  }
}
