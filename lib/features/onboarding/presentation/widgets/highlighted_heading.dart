import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Renders a heading where a specific phrase has a yellow brush highlight behind it,
/// precisely matching Figma node `1:5389` / `1:5422`.
class HighlightedHeading extends StatelessWidget {
  final String title;
  final String highlightText;
  final bool isHighlightFirst;

  const HighlightedHeading({
    super.key,
    required this.title,
    required this.highlightText,
    required this.isHighlightFirst,
  });

  @override
  Widget build(BuildContext context) {
    final highlightWidget = Stack(
      clipBehavior: Clip.none,
      children: [
        // Yellow brush highlight pill behind text matching Figma 1:5392 / 1:5425
        Positioned(
          left: -4.w,
          right: -4.w,
          bottom: 1.h,
          height: 12.h,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        // Highlighted text
        Text(
          highlightText,
          style: AppTextStyles.displayLarge.copyWith(
            fontSize: 26.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );

    final regularTextWidget = Text(
      title,
      style: AppTextStyles.displayLarge.copyWith(
        fontSize: 26.sp,
        color: AppColors.textPrimary,
      ),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8.w,
        children: isHighlightFirst
            ? [highlightWidget, regularTextWidget]
            : [regularTextWidget, highlightWidget],
      ),
    );
  }
}
