import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Top header bar for Remaining Attempts bottom sheet:
/// - Drag Handle (40x6, #E5E7EB, pill rounded)
/// - Close button (32x32 circle, #F3F4F6, X icon)
class RemainingAttemptsHeader extends StatelessWidget {
  const RemainingAttemptsHeader({
    super.key,
    this.onClosePressed,
  });

  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Drag Handle (40x6, #E5E7EB)
        Container(
          width: 40.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.borderLight,
            borderRadius: BorderRadius.circular(9999),
          ),
        ),
        // Close Button aligned to top-left / top-right
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: onClosePressed ?? () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: AppColors.surfaceMuted,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close_rounded,
                size: 18.sp,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
