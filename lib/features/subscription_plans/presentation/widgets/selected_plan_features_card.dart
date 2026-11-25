import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Inner details card in the subscription review screen showing attempts & validity features.
class SelectedPlanFeaturesCard extends StatelessWidget {
  const SelectedPlanFeaturesCard({
    super.key,
    required this.attempts,
    required this.validityDays,
  });

  final int attempts;
  final int validityDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceSubtle,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Item 1: Mic + attempts
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryGold.withValues(alpha: 0.2),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.micSymbolIcon,
                    width: 12.w,
                    height: 12.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryGold,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '$attempts محاولة صوتية للتعرف على الإفيه',
                  style: AppStyles.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHeaderDark,
                    height: 22 / 14,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Item 2: Calendar + validity
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryGold.withValues(alpha: 0.2),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.calendarIcon,
                    width: 12.w,
                    height: 12.h,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'صالحة لمدة $validityDays يومًا',
                  style: AppStyles.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHeaderDark,
                    height: 22 / 14,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
