import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Search input field component for the CountrySelectionBottomSheet.
class CountrySearchField extends StatelessWidget {
  const CountrySearchField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceF8F7F4,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderMuted,
          width: 1.0,
        ),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: AppStyles.alexandria(
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.profileTextDeepDark,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: hintText,
                hintStyle: AppStyles.alexandria(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondaryGray,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.textSecondaryGray,
          ),
        ],
      ),
    );
  }
}
