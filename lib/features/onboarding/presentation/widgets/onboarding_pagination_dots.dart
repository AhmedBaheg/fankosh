import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

/// Animated pagination dots indicator matching Figma node `1:5397` / `1:5430`.
///
/// Displays exact 10x10 circular dots spaced by 8px (Figma delta: x=157 to x=175).
/// The active dot uses the brand's primary yellow/gold [AppColors.primary],
/// and the inactive dot uses neutral light gray [AppColors.borderLight].
class OnBoardingPaginationDots extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnBoardingPaginationDots({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: 10.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.secondary : AppColors.borderLight,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

