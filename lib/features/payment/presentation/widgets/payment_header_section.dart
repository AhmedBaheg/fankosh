import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

/// Top header section for the Payment screen matching exact Figma specs:
/// - Eyebrow: "إتمام عملية الدفع بأمان وسرعة" (Cairo, 18px, Bold, #150E16, text-align: right)
/// - Row: Circular back button (40x40, border #E7E5E4B2, shadow) + "اختار طريقة الدفع" (Alexandria, 22px, Bold, #1B1C1C)
/// - Subtitle: "اختار الطريقة اللي تناسبك وكمّل اشتراكك." (Alexandria, 14px, Regular, #4E4633, text-align: right)
class PaymentHeaderSection extends StatelessWidget {
  const PaymentHeaderSection({
    super.key,
    this.onBackPressed,
  });

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Eyebrow caption
        Text(
          'إتمام عملية الدفع بأمان وسرعة',
          style: AppStyles.cairo(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 22 / 18,
            letterSpacing: 0,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 14.h),

        // 2. Title Row: Circular Back Button + "اختار طريقة الدفع"
        Row(
          children: [
            // Circular Back Button (40x40)
            GestureDetector(
              onTap: onBackPressed ?? () => Navigator.pop(context),
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderLightMuted,
                    width: 1.0,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowSubtleBlack,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.chevronRightIcon,
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textHeaderDark,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Title: "اختار طريقة الدفع"
            Text(
              'اختار طريقة الدفع',
              style: AppStyles.alexandria(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textHeaderDark,
                height: 30 / 22,
                letterSpacing: -0.55,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ],
        ),
        SizedBox(height: 10.h),

        // 3. Subtitle
        Align(
          alignment: Alignment.center,
          child: Text(
            'اختار الطريقة اللي تناسبك وكمّل اشتراكك.',
            style: AppStyles.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 22 / 14,
              letterSpacing: 0,
            ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
