import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/home/presentation/widgets/remaining_attempts_bottom_sheet.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../utils/assets.dart';

/// Pill badge component showing remaining recording attempts (Figma Page 25 / Frame 4).
/// - Pill capsule with soft warm golden gradient (#FFF7DC -> #FFE699) and subtle border (#FCDA82)
/// - Visual Layout: [ ⚡  محاولات 0 ]
///   - Left: solid amber lightning bolt icon (15x15)
///   - Right: attempts count in Alexandria 13sp SemiBold (#1B1C1C)
/// - Tapping displays the Remaining Attempts Bottom Sheet dialog.
class AttemptsBadge extends StatelessWidget {
  const AttemptsBadge({
    super.key,
    this.attemptsCount = 3,
    this.onTap,
  });

  final int attemptsCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final countText = l10n?.attemptsCount(attemptsCount) ?? '$attemptsCount محاولات';

    return Center(
      child: GestureDetector(
        onTap: onTap ??
            () {
              showRemainingAttemptsBottomSheet(
                context,
                remainingAttempts: attemptsCount,
              );
            },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.attemptsBadgeGradientStart,
                AppColors.attemptsBadgeGradientEnd,
              ],
            ),
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: AppColors.attemptsBadgeBorder,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                countText,
                style: AppStyles.alexandria(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimaryDark,
                  height: 18 / 13,
                  letterSpacing: 0.0,
                ),
              ),
              SizedBox(width: 6.w),
              SvgPicture.asset(
                AppAssets.attemptsLightningIcon,
                width: 15.w,
                height: 15.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryDark,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
