import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// User Profile Info Card displaying avatar, name, email, and edit button.
///
/// Matches Figma specs: width: 358, height: 84, borderRadius: 20px, padding: 16px.
class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    super.key,
    this.name = 'أحمد محمد',
    this.email = 'ahmed@example.com',
    this.onEdit,
  });

  final String name;
  final String email;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 84.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowCardDark,
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Right Side: Avatar + User Name & Email
          Expanded(
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                // Avatar Circle
                Container(
                  width: 52.r,
                  height: 52.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.profileAvatarBg,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.profileAvatarIcon,
                      width: 26.r,
                      height: 26.r,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                // Name & Email Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: AppStyles.alexandria(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textHeaderDark,
                          height: 24 / 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        email,
                        style: AppStyles.alexandria(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textMutedBrown,
                          height: 20 / 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          // Left Side: Edit ("تعديل") Pill Button
          InkWell(
            onTap: onEdit,
            borderRadius: BorderRadius.circular(9999.r),
            child: Container(
              height: 28.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.cardYellowTint,
                borderRadius: BorderRadius.circular(9999.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  SvgPicture.asset(
                    AppAssets.editPencilIcon,
                    width: 12.r,
                    height: 12.r,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    l10n.edit,
                    style: AppStyles.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDark,
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
