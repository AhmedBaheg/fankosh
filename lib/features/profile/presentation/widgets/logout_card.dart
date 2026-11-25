import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Logout action card with red icon and text.
///
/// Matches Figma specs: width: 358, height: 64, borderRadius: 20px, padding: 14px 16px.
class LogoutCard extends StatelessWidget {
  const LogoutCard({
    super.key,
    this.onLogout,
  });

  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 64.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowGold08,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: AppColors.shadowGold0D,
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onLogout,
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Right Side: Logout Icon + "تسجيل الخروج"
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      width: 36.r,
                      height: 36.r,
                      decoration: BoxDecoration(
                        color: AppColors.errorSurfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.logoutIcon,
                          width: 18.r,
                          height: 18.r,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      l10n.logout,
                      style: AppStyles.alexandria(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),

                // Left Side: Left Chevron Arrow (<) in soft red
                SvgPicture.asset(
                  AppAssets.icLeft,
                  width: 12.r,
                  height: 12.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.errorBorderPink,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
