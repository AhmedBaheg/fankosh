import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/onboarding_page_model.dart';
import 'highlighted_heading.dart';

/// Single page item inside the Onboarding PageView.
class OnBoardingPageItem extends StatelessWidget {
  final OnBoardingPageModel model;

  const OnBoardingPageItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 95.h),

          // 1. Center Illustration / Mascot Sticker (Figma node 1:5387 / 1:5440)
          Center(
            child: Image.asset(
              model.imagePath,
              width: model.imageWidth.w,
              height: model.imageHeight.h,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 109.h),

          // 2. Text Content Area (Figma Section - ContentArea)
          Expanded(
            flex: 4,
            child: Column(
              children: [
                // Main heading with yellow brush highlight
                HighlightedHeading(
                  title: model.title,
                  highlightText: model.highlightText,
                  isHighlightFirst: model.isHighlightFirst,
                ),

                SizedBox(height: 14.h),

                // Explanatory subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    model.subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitleLarge.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
