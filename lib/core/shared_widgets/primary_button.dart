import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/assets.dart';

/// Primary action button matching Figma node `1:5400` / `1:5433` (Section `1:5388`).
///
/// Features:
/// - Exact Figma dimensions (default height: `52.h`, width: full or custom).
/// - Built using [ElevatedButton] with custom styling matching project architecture.
/// - Brand primary gold background [AppColors.primary] (`#FEC529`).
/// - Elevation shadow with golden glow matching Figma specs (`elevation: 6`, `shadowColor`).
/// - Rounded corners (`16.r`).
/// - Bold Alexandria typography (`16.sp`, [AppColors.textPrimary]).
/// - Loading spinner support (`isLoading`).
/// - Outline variant support (`isOutlineBtn`).
/// - Prefix icon and navigation progression arrow support (`icon`, `hasArrow`).
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.hasArrow = false,
    this.isLoading = false,
    this.isOutlineBtn = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.hasShadow = true,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final String? text;
  final String? icon;
  final bool hasArrow;
  final bool isLoading;
  final bool isOutlineBtn;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final bool hasShadow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 52.h;
    final effectiveRadius = borderRadius ?? 34.r;
    final isInteractive = onPressed != null && !isLoading;

    final resolvedBgColor = isOutlineBtn
        ? AppColors.transparent
        : (backgroundColor ??
            (isInteractive
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.5)));

    final resolvedTextColor = textColor ??
        (isOutlineBtn ? AppColors.primary : AppColors.textPrimary);

    final showShadow = hasShadow && !isOutlineBtn && isInteractive;

    return SizedBox(
      width: width?.w ?? double.infinity,
      height: effectiveHeight,
      child: ElevatedButton(
        onPressed: isInteractive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: resolvedBgColor,
          foregroundColor: resolvedTextColor,
          disabledBackgroundColor: isOutlineBtn
              ? AppColors.transparent
              : AppColors.primary.withValues(alpha: 0.5),
          disabledForegroundColor: resolvedTextColor.withValues(alpha: 0.5),
          elevation: showShadow ? 6 : 0,
          shadowColor: (backgroundColor ?? AppColors.primary)
              .withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            side: isOutlineBtn
                ? BorderSide(
                    color: backgroundColor ?? AppColors.primary,
                    width: 1.5.w,
                  )
                : BorderSide.none,
          ),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: resolvedTextColor,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text ?? '',
                        style: textStyle ??
                            AppTextStyles.buttonLarge.copyWith(
                              fontSize: 16.sp,
                              color: resolvedTextColor,
                            ),
                      ),
                      SizedBox(width: 8.w),
                      if (icon != null) ...[
                        SvgPicture.asset(
                          icon!,
                          width: 20.w,
                          height: 20.h,
                          colorFilter: ColorFilter.mode(
                            resolvedTextColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 8.w),
                      ],
                      if (hasArrow) ...[
                        SizedBox(width: 8.w),
                        Transform.rotate(
                          angle: isEnglish(context) ? math.pi : 0,
                          child: SvgPicture.asset(
                            AppAssets.arrowBackIcon,
                            width: 20.w,
                            height: 20.h,
                            colorFilter: ColorFilter.mode(
                              resolvedTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

bool isEnglish(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'en';
}
