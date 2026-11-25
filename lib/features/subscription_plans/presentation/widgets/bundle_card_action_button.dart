import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Modular action button inside bundle card matching Figma specs.
class BundleCardActionButton extends StatelessWidget {
  const BundleCardActionButton({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
    this.isButtonDisabled = false,
    this.isButtonOutlined = false,
    this.buttonBorderColor,
    this.buttonBgColor,
    this.onTap,
  });

  final String buttonText;
  final Color buttonTextColor;
  final bool isButtonDisabled;
  final bool isButtonOutlined;
  final Color? buttonBorderColor;
  final Color? buttonBgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isButtonDisabled ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 36.h,
        constraints: BoxConstraints(minWidth: 93.w),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isButtonDisabled
              ? AppColors.surfaceMuted
              : (isButtonOutlined
                  ? Colors.transparent
                  : (buttonBgColor ?? AppColors.primary)),
          borderRadius: BorderRadius.circular(12.r),
          border: isButtonOutlined
              ? Border.all(
                  color: buttonBorderColor ?? AppColors.discoverBlueAccent,
                  width: 2.0.w,
                )
              : (isButtonDisabled
                  ? Border.all(
                      color: AppColors.borderLight.withValues(alpha: 0.6),
                      width: 1.0.w,
                    )
                  : null),
          boxShadow: (!isButtonDisabled && !isButtonOutlined)
              ? [
                  BoxShadow(
                    color: (buttonBgColor ?? AppColors.primary)
                        .withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: AppStyles.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: buttonTextColor,
            height: 16 / 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
