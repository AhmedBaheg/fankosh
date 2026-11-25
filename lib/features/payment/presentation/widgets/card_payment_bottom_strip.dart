import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/assets.dart';

/// Floating sticky bottom payment strip matching exact Figma specs:
/// - width: 390, border-top-left-radius: 26px, border-top-right-radius: 26px
/// - background: #FCF9F8F2, border-top: 1px solid #E0E0E0, shadow: 0px -4px 20px 0px #0000000D
/// - blur: 12px
/// - "الإجمالي المستحق": Alexandria, 14px, Bold, #1B1C1C
/// - "350": Alexandria, 28px, ExtraBold, #FFAE00
/// - "جنيه مصري": Alexandria, 12px, Medium, #4E4633
/// - Main Action Button: height 48, radius 99999px, #FEC529, "ادفع الآن" + lock icon
/// - Helper text: "هيتم تأكيد الدفع وتفعيل الباقة فورياً في حسابك."
class CardPaymentBottomStrip extends StatelessWidget {
  const CardPaymentBottomStrip({
    super.key,
    required this.price,
    required this.onPayPressed,
    this.isLoading = false,
  });

  final int price;
  final VoidCallback onPayPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(26.r),
        topRight: Radius.circular(26.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 16.h,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceBlurNav,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.r),
              topRight: Radius.circular(26.r),
            ),
            border: const Border(
              top: BorderSide(color: AppColors.borderE0E0E0, width: 1.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtleBlack,
                blurRadius: 20,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Total Due Row
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // "الإجمالي المستحق"
                  Text(
                    'الإجمالي المستحق',
                    style: AppStyles.alexandria(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 20 / 14,
                    ),
                    textDirection: TextDirection.rtl,
                  ),

                  // Price: "350 جنيه مصري"
                  Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$price',
                        style: AppStyles.alexandria(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryGold,
                          height: 36 / 28,
                          letterSpacing: -0.7,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'جنيه مصري',
                        style: AppStyles.alexandria(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                          height: 16 / 12,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Main Action Button ("ادفع الآن" with Lock icon)
              PrimaryButton(
                text: 'ادفع الآن',
                onPressed: onPayPressed,
                icon: AppAssets.lockIcon,
                height: 48.h,
                borderRadius: 99999.r,
                isLoading: isLoading,
                backgroundColor: AppColors.primary,
                textColor: AppColors.textPrimary,
                textStyle: AppStyles.alexandria(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 24 / 16,
                ),
              ),
              SizedBox(height: 12.h),

              // Helper Text
              Text(
                'هيتم تأكيد الدفع وتفعيل الباقة فورياً في حسابك.',
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  height: 14 / 11,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
