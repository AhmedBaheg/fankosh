import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Custom circular radio indicator for selectable bundle cards.
class BundleRadioIndicator extends StatelessWidget {
  const BundleRadioIndicator({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.borderNeutralLight,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 10.w,
          height: 10.h,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
