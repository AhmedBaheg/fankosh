import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/audio_helper.dart';

/// Dynamic audio player card widget displaying user recorded voice duration & waveform (Figma Frame 7).
/// Refactored to separate playback business logic into [AudioPlaybackController].
class AudioPlayerCard extends StatefulWidget {
  const AudioPlayerCard({
    super.key,
    required this.totalDurationSeconds,
    this.audioFilePath,
    this.initialPositionSeconds = 0,
    this.onPlayStateChanged,
  });

  final int totalDurationSeconds;
  final String? audioFilePath;
  final int initialPositionSeconds;
  final ValueChanged<bool>? onPlayStateChanged;

  @override
  State<AudioPlayerCard> createState() => _AudioPlayerCardState();
}

class _AudioPlayerCardState extends State<AudioPlayerCard> {
  late final AudioPlaybackController _controller;

  static const List<double> _waveformHeights = [
    14, 22, 32, 26, 40, 18, 30, 46, 22, 38, 16, 28, 40, 20, 32, 44, 24, 16, 30, 38, 20, 14
  ];

  @override
  void initState() {
    super.initState();
    _controller = AudioPlaybackController(
      totalDurationSeconds: widget.totalDurationSeconds,
      filePath: widget.audioFilePath,
      initialPositionSeconds: widget.initialPositionSeconds,
    )..addListener(_handleControllerUpdate);
  }

  void _handleControllerUpdate() {
    widget.onPlayStateChanged?.call(_controller.isPlaying);
  }

  @override
  void didUpdateWidget(covariant AudioPlayerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.totalDurationSeconds != widget.totalDurationSeconds) {
      _controller.updateTotalDuration(widget.totalDurationSeconds);
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

        return Center(
          child: Container(
            width: 310.w,
            constraints: BoxConstraints(minHeight: 235.h),
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8.h),

                // 1. Audio Waveform Display with Active/Inactive Bars based on dynamic progress
                SizedBox(
                  height: 52.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(_waveformHeights.length, (index) {
                      final isActive = _controller.currentPosition > 0 && index < activeBars;
                      return Container(
                        width: 4.w,
                        height: _waveformHeights[index].h,
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.primary : AppColors.border,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 12.h),

                // 2. Dynamic Audio Durations Row (Left: Total Voice Length, Right: Current Playback Position)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AudioHelper.formatDuration(_controller.totalDuration),
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        AudioHelper.formatDuration(_controller.currentPosition),
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // 3. Playback Circular Yellow Button
                GestureDetector(
                  onTap: _controller.togglePlay,
                  child: Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.45),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        _controller.isPlaying ? AppAssets.pauseIcon : AppAssets.playIcon,
                        width: 20.w,
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
