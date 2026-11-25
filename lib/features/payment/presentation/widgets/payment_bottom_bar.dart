import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

/// Bottom bar for the Payment screen matching exact Figma specs:
/// - Total Due Row:
///   - "الإجمالي المستحق": Alexandria, 16px, Regular (w400), #4E4633, line-height: 25.6px
///   - Price number: Alexandria, 22px, Bold (w700), #FE9311, line-height: 30px
///   - Price currency: Alexandria, 12px, SemiBold (w600), #4E4633, letterSpacing: 0.24px
/// - Action Button using shared PrimaryButton:
///   - height: 52px, border-radius: 12px
///   - "متابعة للدفع": Alexandria, 16px, SemiBold (w600), line-height: 26px
class PaymentBottomBar extends StatelessWidget {
  const PaymentBottomBar({
    super.key,
    required this.price,
    required this.isEnabled,
    required this.onPayPressed,
  });

  final int price;
  final bool isEnabled;
  final VoidCallback onPayPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: const BoxDecoration(color: AppColors.background),
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
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 25.6 / 16,
                ),
                textDirection: TextDirection.rtl,
              ),

              // Price: "350 جنيه"
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '$price',
                    style: AppStyles.alexandria(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDark,
                      height: 30 / 22,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'جنيه',
                    style: AppStyles.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      height: 16 / 12,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.h),

          // Action Button: "متابعة للدفع" (Height: 52, Radius: 12)
          PrimaryButton(
            text: 'متابعة للدفع',
            onPressed: isEnabled ? onPayPressed : null,
            hasArrow: true,
            height: 52.h,
            borderRadius: 12.r,
            disabledBackgroundColor: AppColors.borderE5E5E5,
            disabledForegroundColor: AppColors.textSecondary,
            textColor: AppColors.textPrimary,
            textStyle: AppStyles.alexandria(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 26 / 16,
            ),
          ),
        ],
      ),
    );
  }
}
