import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Action buttons for the share response dialog ("شارك القفشة" & "مش دلوقتي").
class ShareDialogActionButtons extends StatelessWidget {
  const ShareDialogActionButtons({
    super.key,
    required this.onSharePressed,
    required this.onCancelPressed,
  });

  final VoidCallback onSharePressed;
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Primary Share Button: "شارك القفشة" in #FEC529 pill
        GestureDetector(
          onTap: onSharePressed,
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.shareNodesIcon,
                  width: 18.w,
                  height: 18.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.profileTextDeepDark,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'شارك القفشة',
                  style: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.profileTextDeepDark,
                    height: 24 / 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // Secondary Cancel Button: "مش دلوقتي" in #F0EFEF pill
        GestureDetector(
          onTap: onCancelPressed,
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.dialogBtnSecondaryBg,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Center(
              child: Text(
                'مش دلوقتي',
                style: AppStyles.alexandria(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dialogMutedText,
                  height: 20 / 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
