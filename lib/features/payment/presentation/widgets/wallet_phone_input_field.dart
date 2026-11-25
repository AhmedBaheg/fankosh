import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';

/// Phone number input field for wallet payment:
/// - Label: "رقم الموبايل المرتبط بالمحفظة" (Alexandria, 14px, SemiBold, #150E16)
/// - Uses shared [CustomTextField] with:
///   - Prefix (left in LTR): Green checkmark badge (20x20, #18CB9E1A)
///   - Hint text: "010 1234 5678"
///   - Suffix (right in LTR): Phone icon in circular container (32x32, #F6F6F6)
///   - Border radius 14, border #E7E5E4, fill #FFFFFF
/// - Info caption below with info icon
class WalletPhoneInputField extends StatelessWidget {
  const WalletPhoneInputField({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label (RTL aligned to the right)
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'رقم الموبايل المرتبط بالمحفظة',
            style: AppStyles.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 22 / 14,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        SizedBox(height: 8.h),

        // Input Card using shared CustomTextField
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowLight,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: CustomTextField(
              controller: controller,
              onChanged: onChanged,
              hintText: "01015774093",
              keyboardType: TextInputType.phone,
              hintStyle: AppStyles.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textMutedWarm.withValues(alpha: 0.6),
                letterSpacing: 0.4,
              ),
              style: AppStyles.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textHeaderDark,
                letterSpacing: 0.4,
              ),
              borderRadius: 14.r,
              borderColor: AppColors.borderMuted,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 14.h,
              ),
              // Valid Checkmark Badge on left (prefix in LTR)
              prefixWidget: Padding(
                padding: EdgeInsets.only(left: 12.w, right: 10.w),
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.success.withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.checkMarkIcon,
                      width: 10.w,
                      height: 8.h,
                    ),
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 42.w,
                minHeight: 20.h,
              ),
              // Phone Icon in circular container on right (suffix in LTR)
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.w, left: 8.w),
                child: Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surfaceNeutral,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.mobilePhoneIcon,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
        SizedBox(height: 8.h),

        // Info caption below field
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              AppAssets.walletNotifiIcon,
              width: 14.w,
              height: 14.h,
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                'اكتب الرقم المسجل عليه محفظتك لتلقي إشعار التأكيد.',
                style: AppStyles.alexandria(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textMutedWarm,
                  height: 16 / 11,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
