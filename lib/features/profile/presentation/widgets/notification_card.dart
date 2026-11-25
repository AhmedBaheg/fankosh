import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/notification_item_model.dart';

/// Notification list card matching Figma specs:
/// - width: 358, minHeight: 88, borderRadius: 16px, padding: 21.69px 16px
/// - borderBottom: 1px solid #ECEAE6, boxShadow: 0px 2px 8px 0px #00000008
/// - Icon Container: 42x42, radius 12px
/// - Title: Alexandria Bold 15px (#150E16)
/// - Subtitle: Alexandria Regular 12px (#8D8985)
/// - Time: Alexandria Regular 11px (#8D8985)
/// - Unread Indicator: 8x8 circle (#FD5C53)
class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final NotificationItemModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 88.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: const Border(
            bottom: BorderSide(
              color: AppColors.dividerBorder,
              width: 1.0,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Right: 42x42 Icon Container (radius: 12)
            Container(
              width: 42.r,
              height: 42.r,
              decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  item.iconPath,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: item.iconColor != null
                      ? ColorFilter.mode(item.iconColor!, BlendMode.srcIn)
                      : null,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Middle: Title & Subtitle Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: AppStyles.alexandria(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 20.63 / 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.subtitle,
                    style: AppStyles.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                      height: 18 / 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),

            // Left: Time & Unread Indicator Dot
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.time,
                  style: AppStyles.alexandria(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                    height: 16.5 / 11,
                  ),
                ),
                SizedBox(height: 8.h),
                if (!item.isRead)
                  Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.error,
                    ),
                  )
                else
                  SizedBox(width: 8.r, height: 8.r),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
