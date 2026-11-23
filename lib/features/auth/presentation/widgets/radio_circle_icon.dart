import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Custom radio circle indicator with outer blue ring and inner blue dot matching attached screenshot.
class RadioCircleIcon extends StatelessWidget {
  const RadioCircleIcon({
    super.key,
    required this.isSelected,
    this.size,
  });

  final bool isSelected;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 20.w;

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface,
        border: Border.all(
          color: isSelected ? AppColors.secondary : AppColors.borderLight,
          width: isSelected ? 1.8.w : 1.5.w,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 9.w,
                height: 9.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary,
                ),
              ),
            )
          : null,
    );
  }
}
