import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Dynamic horizontal progress bar displaying remaining attempts ratio with RTL fill.
class AttemptsProgressBar extends StatelessWidget {
  const AttemptsProgressBar({
    super.key,
    required this.progress,
    this.height,
  });

  final double progress;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 10.h,
      decoration: BoxDecoration(
        color: AppColors.borderNeutralLight,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerRight,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(9999),
          ),
        ),
      ),
    );
  }
}
