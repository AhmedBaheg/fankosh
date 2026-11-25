import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Top App Bar row for Notifications screen with back button, title, and "تحديد الكل كمقروء" action.
class NotificationsAppBar extends StatelessWidget {
  const NotificationsAppBar({
    super.key,
    required this.title,
    required this.markAllAsReadText,
    required this.onMarkAllAsRead,
    this.onBackPressed,
  });

  final String title;
  final String markAllAsReadText;
  final VoidCallback onMarkAllAsRead;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Right: Back Button + Title "الإشعارات"
        Row(
          textDirection: TextDirection.rtl,
          children: [
            // Circular Back Button (40x40)
            InkWell(
              onTap: onBackPressed ?? () => Navigator.maybePop(context),
              borderRadius: BorderRadius.circular(9999.r),
              child: Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderLight.withValues(alpha: 0.7),
                    width: 1.0,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowSubtle,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.chevronRightIcon,
                    width: 16.r,
                    height: 16.r,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Title
            Text(
              title,
              style: AppStyles.alexandria(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.profileTextDeepDark,
                height: 27 / 22,
              ),
            ),
          ],
        ),

        // Left: "تحديد الكل كمقروء" with double checkmark icon
        InkWell(
          onTap: onMarkAllAsRead,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 6.h,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.markReadIcon,
                  width: 13.w,
                  height: 8.h,
                ),
                SizedBox(width: 4.w),
                Text(
                  markAllAsReadText,
                  style: AppStyles.alexandria(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                    height: 19.5 / 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
