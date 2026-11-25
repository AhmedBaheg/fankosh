import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Selectable wallet provider option card (Vodafone Cash, Etisalat Cash, Orange Cash)
/// - Height: 68px, Border-radius: 14px, Padding: horizontal 16px
/// - Selected: bg #FFF9E2, border 1px solid #FEC529, shadow 0px 4px 4px #00000040
/// - Unselected: bg #FFFFFF, shadow 0px 2px 6px #00000005
class WalletOptionCard extends StatelessWidget {
  const WalletOptionCard({
    super.key,
    required this.title,
    required this.logoAsset,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String logoAsset;
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
        height: 68.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardYellowTint : Colors.white,
          borderRadius: BorderRadius.circular(14.r),
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
                color: AppColors.shadow05,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Provider Logo
            SizedBox(
              width: 28.w,
              height: 28.h,
              child: Center(
                child: SvgPicture.asset(
                  logoAsset,
                  width: 26.w,
                  height: 26.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Provider Title (Alexandria, 14px, Medium, #150E16)
            Expanded(
              child: Text(
                title,
                style: AppStyles.alexandria(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                  height: 25.6 / 14,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ),

            // Radio Selection Indicator (20x20)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.surfaceF0EDED,
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
