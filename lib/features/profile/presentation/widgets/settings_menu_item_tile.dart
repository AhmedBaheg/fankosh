import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Data model representing a single account settings item.
class AccountSettingsItemData {
  const AccountSettingsItemData({
    required this.iconPath,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    this.iconColor,
    this.onTap,
  });

  final String iconPath;
  final Color iconBgColor;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
}

/// Modular clickable row tile for account settings items matching Figma specs.
class SettingsMenuItemTile extends StatelessWidget {
  const SettingsMenuItemTile({
    super.key,
    required this.item,
  });

  final AccountSettingsItemData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap ?? () {},
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Icon Container Box (36x36, radius 12)
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: item.iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  item.iconPath,
                  width: 18.r,
                  height: 18.r,
                  colorFilter: item.iconColor != null
                      ? ColorFilter.mode(item.iconColor!, BlendMode.srcIn)
                      : null,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Title & Subtitle Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppStyles.alexandria(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textHeaderDark,
                      height: 20 / 14,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.subtitle,
                    style: AppStyles.alexandria(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrayBrown,
                      height: 16 / 11,
                    ),
                  ),
                ],
              ),
            ),

            // Left Chevron Arrow (<)
            SvgPicture.asset(
              AppAssets.icLeft,
              width: 12.r,
              height: 12.r,
              colorFilter: const ColorFilter.mode(
                AppColors.borderWarmGray,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
