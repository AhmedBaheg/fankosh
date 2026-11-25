import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/audio_helper.dart';
import '../../../../l10n/app_localizations.dart';
import 'share_response_dialog.dart';

/// Generated AI response audio player card implementing Page 9 (Paused) & Page 10 (Playing) states.
/// Aligned Left in RTL to match Fankoosh AI speech bubble design:
/// - Outer Bubble: width: 270.w, borderRadius: 16.r, bg: #FFFFFF, border: #E8E2D4B2
/// - Quality Badge: "HQ • 320kbps" in Alexandria 11sp SemiBold (#807660)
/// - Inner Player Box: bg: #F7F5F5 with 24 yellow waveform bars and white play button icon
/// - Timestamps: Progress timestamp on left (#1B1C1C), total duration on right (#807660)
/// - Bottom Action Strip: "خد الإفيه ده عندك! 🎧" with speaker icon in #4E4633
class GeneratedResponseAudioPlayer extends StatefulWidget {
  const GeneratedResponseAudioPlayer({
    super.key,
    this.totalDurationSeconds = 22,
    this.initialPositionSeconds = 8,
  });

  final int totalDurationSeconds;
  final int initialPositionSeconds;

  @override
  State<GeneratedResponseAudioPlayer> createState() =>
      _GeneratedResponseAudioPlayerState();
}

class _GeneratedResponseAudioPlayerState
    extends State<GeneratedResponseAudioPlayer> {
  late final AudioPlaybackController _controller;

  /// Exact 24-bar waveform pattern matching Figma Page 9 design
  static const List<double> _waveformHeights = [
    16, 24, 12, 18, 28, 22, 14, 26, 32, 20, 28, 22, 34, 30, 18, 24, 32, 26, 16, 28, 20, 32, 22, 14,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AudioPlaybackController(
      totalDurationSeconds: widget.totalDurationSeconds,
      initialPositionSeconds: widget.initialPositionSeconds,
    );
  }

  @override
  void didUpdateWidget(covariant GeneratedResponseAudioPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.totalDurationSeconds != widget.totalDurationSeconds) {
      _controller.updateTotalDuration(widget.totalDurationSeconds);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final punchlineActionText = l10n?.takePunchlineHere ?? 'خد الإفيه ده عندك! 🎧';

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final activeBars = AudioHelper.calculateActiveBars(
          currentPosition: _controller.currentPosition,
          totalDuration: _controller.totalDuration,
          totalBars: _waveformHeights.length,
        );

        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 270.w,
              constraints: BoxConstraints(maxWidth: 308.w),
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.aiBubbleBorder, // #E8E2D4B2
                  width: 1.0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowSubtleBlack, // 0px 1px 2px 0px #0000000D
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Audio Quality Label ("HQ • 320kbps") aligned to top-left
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'HQ • 320kbps',
                      style: AppStyles.alexandria(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrayBrown, // #807660
                        height: 14 / 11,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // 2. Inner Audio Player Box (#F7F5F5)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceF7F5F5, // Light warm-gray fill
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        // Yellow Circular Play Button on Right (48x48, #FEC529 with white icon)
                        GestureDetector(
                          onTap: _controller.togglePlay,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary, // #FEC529
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: _controller.isPlaying ? 0 : 2.w,
                                ),
                                child: SvgPicture.asset(
                                  _controller.isPlaying
                                      ? AppAssets.pauseIcon
                                      : AppAssets.playIcon,
                                  width: 16.w,
                                  height: 18.h,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white, // Crisp white play triangle
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Waveform and Timestamps Column on Left
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // 24 Waveform Bars in Yellow
                              SizedBox(
                                height: 36.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    _waveformHeights.length,
                                    (index) {
                                      final isBarActive = _controller.isPlaying
                                          ? index < activeBars
                                          : true;

                                      return Container(
                                        width: 2.8.w,
                                        height: _waveformHeights[index].h,
                                        decoration: BoxDecoration(
                                          color: isBarActive
                                              ? AppColors.primary // #FEC529
                                              : AppColors.primaryLight,
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),

                              // Timestamps: Position on left ("00:08"), Total duration on right ("00:22")
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    AudioHelper.formatDuration(
                                      _controller.currentPosition,
                                    ),
                                    style: AppStyles.alexandria(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textHeaderDark,
                                    ),
                                  ),
                                  Text(
                                    AudioHelper.formatDuration(
                                      _controller.totalDuration,
                                    ),
                                    style: AppStyles.alexandria(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textGrayBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // 3. Bottom Audio Action Pill ("خد الإفيه ده عندك! 🎧" -> Opens Page 11 Share Dialog)
                  InkWell(
                    onTap: () {
                      ShareResponseDialog.show(
                        context,
                        userRecordingSeconds: 5,
                        responseAudioSeconds: _controller.totalDuration,
                      );
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceF7F5F5, // Light warm-gray fill
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.volume_up_rounded,
                            size: 18.r,
                            color: AppColors.textGrayBrown,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Text(
                              punchlineActionText,
                              style: AppStyles.alexandria(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
