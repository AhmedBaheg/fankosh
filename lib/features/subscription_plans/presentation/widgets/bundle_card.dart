import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import 'bundle_card_action_button.dart';
import 'bundle_top_tag_badge.dart';

/// Single bundle card component matching the Bundles Navigation screen design.
class BundleCard extends StatelessWidget {
  const BundleCard({
    super.key,
    required this.title,
    this.badgeText,
    this.badgeBgColor,
    this.badgeBorderColor,
    this.badgeTextColor,
    required this.priceValue,
    required this.priceCurrency,
    required this.priceColor,
    required this.quotaBold,
    this.quotaRegular = '',
    required this.featureText,
    required this.featureTextColor,
    this.featureFontWeight = FontWeight.w400,
    this.featureIconPath,
    this.featureIconColor,
    required this.buttonText,
    this.isButtonDisabled = false,
    this.isButtonOutlined = false,
    this.buttonBorderColor,
    this.buttonBgColor,
    required this.buttonTextColor,
    required this.cardBorderColor,
    this.cardBorderWidth = 1.0,
    this.topTagText,
    this.topTagBgColor,
    this.onTap,
  });

  final String title;
  final String? badgeText;
  final Color? badgeBgColor;
  final Color? badgeBorderColor;
  final Color? badgeTextColor;
  final String priceValue;
  final String priceCurrency;
  final Color priceColor;
  final String quotaBold;
  final String quotaRegular;
  final String featureText;
  final Color featureTextColor;
  final FontWeight featureFontWeight;
  final String? featureIconPath;
  final Color? featureIconColor;
  final String buttonText;
  final bool isButtonDisabled;
  final bool isButtonOutlined;
  final Color? buttonBorderColor;
  final Color? buttonBgColor;
  final Color buttonTextColor;
  final Color cardBorderColor;
  final double cardBorderWidth;
  final String? topTagText;
  final Color? topTagBgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main Card Container
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: topTagText != null ? 24.h : 16.h,
            bottom: 16.h,
            left: 18.w,
            right: 18.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: cardBorderColor,
              width: cardBorderWidth.w,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtle,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row (RTL): Title & Badge on right, Price & Currency on left
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title + Optional Pill Badge
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppStyles.cairo(
                          fontSize: 16.sp,
                          fontWeight: topTagText != null
                              ? FontWeight.w900
                              : FontWeight.w800,
                          color: AppColors.textHeaderDark,
                          height: 24 / 16,
                        ),
                      ),
                      if (badgeText != null) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: badgeBgColor ?? AppColors.surfaceMuted,
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color:
                                  badgeBorderColor ?? AppColors.borderLight,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            badgeText!,
                            style: AppStyles.cairo(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: badgeTextColor ?? AppColors.textGrayBrown,
                              height: 16.5 / 11,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  // Price + Currency
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        priceValue,
                        style: AppStyles.cairo(
                          fontSize: topTagText != null ? 24.sp : 20.sp,
                          fontWeight: FontWeight.w900,
                          color: priceColor,
                          height: topTagText != null ? 32 / 24 : 28 / 20,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        priceCurrency,
                        style: AppStyles.cairo(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6.h),

              // Middle Line: Quota & Validity
              RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: quotaBold,
                      style: AppStyles.cairo(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark292524,
                        height: 19.5 / 12,
                      ),
                    ),
                    if (quotaRegular.isNotEmpty)
                      TextSpan(
                        text: quotaRegular,
                        style: AppStyles.cairo(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textWarmMuted,
                          height: 19.5 / 12,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),

              // Bottom Row (RTL): Feature highlight on right, Action button on left
              Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Feature highlight + icon
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (featureIconPath != null) ...[
                        SvgPicture.asset(
                          featureIconPath!,
                          width: 14.w,
                          height: 14.h,
                          colorFilter: featureIconColor != null
                              ? ColorFilter.mode(
                                  featureIconColor!,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                        SizedBox(width: 5.w),
                      ],
                      Text(
                        featureText,
                        style: AppStyles.cairo(
                          fontSize: topTagText != null ? 11.sp : 12.sp,
                          fontWeight: featureFontWeight,
                          color: featureTextColor,
                          height: 16 / 12,
                        ),
                      ),
                    ],
                  ),

                  // Action Button
                  BundleCardActionButton(
                    buttonText: buttonText,
                    buttonTextColor: buttonTextColor,
                    isButtonDisabled: isButtonDisabled,
                    isButtonOutlined: isButtonOutlined,
                    buttonBorderColor: buttonBorderColor,
                    buttonBgColor: buttonBgColor,
                    onTap: onTap,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Optional Top-Left Tag Badge ("الأكثر اختيارًا ★")
        if (topTagText != null)
          BundleTopTagBadge(
            tagText: topTagText!,
            tagBgColor: topTagBgColor,
          ),
      ],
    );
  }
}
