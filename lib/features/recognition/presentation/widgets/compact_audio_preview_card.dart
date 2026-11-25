import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/audio_helper.dart';

/// Compact audio preview card for submitted user voice message (Figma Pages 8, 9 & 10).
///
/// Designed as a right-aligned speech bubble matching exact Figma specs:
/// - Dimensions: width: 256.w, height: 72.h, maxWidth: 308.w
/// - Background: #FEF0CE (warm light gold bubble fill)
/// - Play icon: #6F5500 inside circular #FEC529 yellow button
/// - Duration text: Alexandria, 11sp, SemiBold, #815600
/// - Symmetrical audio waveform in #815600 with 8px gaps
class CompactAudioPreviewCard extends StatefulWidget {
  const CompactAudioPreviewCard({
    super.key,
    required this.durationSeconds,
    this.audioFilePath,
    this.onPlayToggle,
  });

  final int durationSeconds;
  final String? audioFilePath;
  final ValueChanged<bool>? onPlayToggle;

  @override
  State<CompactAudioPreviewCard> createState() =>
      _CompactAudioPreviewCardState();
}

class _CompactAudioPreviewCardState extends State<CompactAudioPreviewCard> {
  late final AudioPlaybackController _controller;

  /// Exact 13-bar waveform heights matching Figma design asset
  static const List<double> _waveformHeights = [
    10, 18, 8, 14, 22, 10, 18, 26, 14, 22, 8, 18, 10,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AudioPlaybackController(
      totalDurationSeconds: widget.durationSeconds,
      filePath: widget.audioFilePath,
    )..addListener(_handleControllerUpdate);
  }

  void _handleControllerUpdate() {
    widget.onPlayToggle?.call(_controller.isPlaying);
  }

  @override
  void didUpdateWidget(covariant CompactAudioPreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.durationSeconds != widget.durationSeconds) {
      _controller.updateTotalDuration(widget.durationSeconds);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerUpdate);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final activeBars = AudioHelper.calculateActiveBars(
          currentPosition: _controller.currentPosition,
          totalDuration: _controller.totalDuration,
          totalBars: _waveformHeights.length,
        );

        return Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: 256.w,
              height: 72.h,
              constraints: BoxConstraints(maxWidth: 308.w),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.userBubbleBackground,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  // 1. Yellow Circular Play/Pause Button on Right (44x44, #FEC529 with #6F5500 icon)
                  GestureDetector(
                    onTap: _controller.togglePlay,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
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
                            width: 14.w,
                            height: 16.h,
                            colorFilter: const ColorFilter.mode(
                              AppColors.playIconBrown,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // 2. Waveform Visualizer in Center (13 bars in #815600)
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(_waveformHeights.length, (index) {
                          final isBarActive = _controller.isPlaying &&
                              _controller.currentPosition > 0 &&
                              index < activeBars;

                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.6.w),
                            width: 3.w,
                            height: _waveformHeights[index].h,
                            decoration: BoxDecoration(
                              color: isBarActive
                                  ? AppColors.playIconBrown
                                  : AppColors.userBubbleText.withValues(
                                      alpha: _controller.isPlaying ? 0.35 : 1.0,
                                    ),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // 3. User Voice Duration Text on Left ("00:05", Alexandria 11sp SemiBold #815600)
                  Text(
                    AudioHelper.formatDuration(widget.durationSeconds),
                    style: AppTextStyles.voiceBubbleDuration.copyWith(
                      fontSize: 11.sp,
                      color: AppColors.userBubbleText,
                    ),
                    textAlign: TextAlign.right,
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
