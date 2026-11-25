import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

/// Top header section for Card Details Payment screen:
/// - Circular back button pinned to the right edge (40x40)
/// - Title: "ادخل بيانات بطاقتك" (Alexandria, 22px, Bold, #1B1C1C, Centered)
/// - Subtitle: "كمّل اشتراكك بسهولة وأمان" (Alexandria, 14px, Medium, #4E4633, Centered)
class CardPaymentHeaderSection extends StatelessWidget {
  const CardPaymentHeaderSection({
    super.key,
    this.onBackPressed,
  });

  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title Row with Back Button pinned to the right
        Stack(
          alignment: Alignment.center,
          children: [
            // Centered Title: "ادخل بيانات بطاقتك"
            Text(
              'ادخل بيانات بطاقتك',
              style: AppStyles.alexandria(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textHeaderDark,
                height: 30 / 22,
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
            ),

            // Circular Back Button pinned to the right
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
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
            ),
          ],
        ),
        SizedBox(height: 8.h),

        // Subtitle: "كمّل اشتراكك بسهولة وأمان"
        Text(
          'كمّل اشتراكك بسهولة وأمان',
          style: AppStyles.alexandria(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
            height: 22 / 14,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
