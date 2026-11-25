import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Standardized custom text field component for form inputs matching Figma design.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.focusNode,
    this.helperText,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.textAlign,
    this.style,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final FocusNode? focusNode;
  final String? helperText;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? 14.r;
    final effectiveBorderColor = borderColor ?? AppColors.border;
    final effectiveFillColor = fillColor ?? AppColors.surface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: labelStyle ??
                AppTextStyles.subtitleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          textAlign: textAlign ?? TextAlign.start,
          style: style ??
              AppTextStyles.bodyLarge.copyWith(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
              ),
          cursorColor: AppColors.primaryDark,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textDisabled,
                ),
            helperText: helperText,
            helperStyle: AppTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              color: AppColors.textTertiary,
            ),
            fillColor: effectiveFillColor,
            filled: true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
            prefixIcon: prefixWidget ??
                (prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: SvgPicture.asset(
                          prefixIcon!,
                          width: 16.6.w,
                          height: 13.3.h,
                          fit: BoxFit.contain,
                        ),
                      )
                    : null),
            prefixIconConstraints: prefixIconConstraints ??
                BoxConstraints(
                  minWidth: 16.3.w,
                  minHeight: 13.3.h,
                ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveRadius),
              borderSide: BorderSide(
                color: effectiveBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveRadius),
              borderSide: const BorderSide(
                color: AppColors.primaryDark,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveRadius),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveRadius),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
