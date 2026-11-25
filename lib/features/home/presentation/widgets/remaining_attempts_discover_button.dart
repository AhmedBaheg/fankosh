import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';

/// Outlined blue CTA button "اكتشف الباقات <" matching Figma:
/// - width: 342, height: 56, border-radius: 32
/// - border: 2px solid #3998FA
/// - background: #FFFFFF01 (transparent)
/// - box-shadow: 0px 1px 2px 0px #0000000D
class RemainingAttemptsDiscoverButton extends StatelessWidget {
  const RemainingAttemptsDiscoverButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.pushNamed(context, Routes.bundlesView);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 342.w),
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.01),
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: AppColors.discoverBlueAccent,
            width: 2.0,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowSubtleBlack, // 0px 1px 2px 0px #0000000D
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              'اكتشف الباقات',
              style: AppStyles.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.discoverBlueAccent,
                height: 24 / 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.chevronLeftBlueIcon,
              width: 8.w,
              height: 14.h,
            ),
          ],
        ),
      ),
    );
  }
}
