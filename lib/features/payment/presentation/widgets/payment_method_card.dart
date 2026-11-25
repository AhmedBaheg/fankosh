import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/payment_method_model.dart';

/// Single selectable payment method card matching exact Figma specs:
/// - Unselected: width: 350, height: 64, border-radius: 12px, padding: 12px 16px, bg: #FFFFFF, shadow: 0px 1px 2px 0px #0000000D
/// - Selected: width: 350, height: 64, border-radius: 12px, padding: 12px 16px, bg: #FFF9E2, border: 1px solid #FEC529, shadow: 0px 4px 4px 0px #00000040
/// - Icon container: 40x40, border-radius: 8px (yellow #FEC529 when selected with white icon)
/// - Radio Indicator: 20x20 outer, 8x8 inner dot when selected
class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentMethodModel method;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 64.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardYellowTint : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border.all(
                  color: AppColors.primary,
                  width: 1.0,
                )
              : null,
          boxShadow: [
            if (isSelected)
              const BoxShadow(
                color: AppColors.shadow20,
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            else
              const BoxShadow(
                color: AppColors.shadowSubtleBlack,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Icon container: 40x40, rounded 8px
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : method.iconBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  method.iconPath,
                  width: 22.w,
                  height: 22.h,
                  colorFilter: isSelected
                      ? const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Text details (Title + Subtitle)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  method.title,
                  style: AppStyles.alexandria(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 20 / 14,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 2.h),
                Text(
                  method.subtitle,
                  style: AppStyles.cairo(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 22 / 10,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Spacer(),

            // Selection Radio Indicator (20x20)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.surfaceF8F8F8,
                border: isSelected
                    ? null
                    : Border.all(
                        color: AppColors.borderDFDFDF,
                        width: 1.0,
                      ),
                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color: AppColors.shadowSubtleBlack,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cardYellowTint,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
