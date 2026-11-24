import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Dynamic animated yellow audio waveform visualizer pill component (Figma Frame 6).
class AudioWaveformVisualizer extends StatefulWidget {
  const AudioWaveformVisualizer({
    super.key,
    this.isRecording = true,
  });

  final bool isRecording;

  @override
  State<AudioWaveformVisualizer> createState() =>
      _AudioWaveformVisualizerState();
}

class _AudioWaveformVisualizerState extends State<AudioWaveformVisualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  final List<double> _baseHeights = [
    12, 20, 32, 24, 40, 16, 28, 44, 20, 36, 14, 26, 38, 18, 30, 42, 22, 14, 28, 36, 18, 12
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310.w,
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceWarm.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: AppColors.primaryLight.withValues(alpha: 0.4),
            width: 1.0,
          ),
        ),
        child: AnimatedBuilder(
          animation: _animController,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(_baseHeights.length, (index) {
                final baseHeight = _baseHeights[index];
                final factor = widget.isRecording
                    ? (0.6 + 0.4 * sin(_animController.value * pi * 2 + index))
                    : 0.3;
                final currentHeight = max(6.0, baseHeight * factor);

                return Container(
                  width: 4.w,
                  height: currentHeight.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
