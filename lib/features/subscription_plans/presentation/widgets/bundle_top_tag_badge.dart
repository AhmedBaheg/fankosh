import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Top-left pinned tag badge for selected / featured bundle card (e.g. "الأكثر اختيارًا ★").
class BundleTopTagBadge extends StatelessWidget {
  const BundleTopTagBadge({
    super.key,
    required this.tagText,
    this.tagBgColor,
  });

  final String tagText;
  final Color? tagBgColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 18.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: tagBgColor ?? AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
            topLeft: Radius.circular(8.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '★',
              style: AppStyles.cairo(
                fontSize: 10.sp,
                color: AppColors.textHeaderDark,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              tagText,
              style: AppStyles.cairo(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textHeaderDark,
                height: 15 / 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
