import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Bottom docked action bar for bundles screen with CTA button and encryption security footnote.
class BundlesBottomActionBar extends StatelessWidget {
  const BundlesBottomActionBar({
    super.key,
    required this.buttonText,
    required this.securityNoteText,
    required this.onProceed,
  });

  final String buttonText;
  final String securityNoteText;
  final VoidCallback onProceed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bottom Action Button: "متابعة للدفع"
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 350.w),
            height: 52.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGoldBorder.withValues(alpha: 0.53),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onProceed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.profileTextDeepDark,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    buttonText,
                    style: AppStyles.alexandria(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.profileTextDeepDark,
                      height: 26 / 18,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    AppAssets.arrowBackIcon,
                    width: 18.w,
                    height: 18.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.profileTextDeepDark,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Security footnote: "دفع إلكتروني آمن ومشفّر 100%"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                AppAssets.lockIcon,
                width: 13.w,
                height: 13.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.profileTextMutedBrown,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                securityNoteText,
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.profileTextMutedBrown,
                  height: 14 / 11,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
