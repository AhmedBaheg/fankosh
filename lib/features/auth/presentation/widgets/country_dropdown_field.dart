import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/country_model.dart';

/// Header field box component for Country selection matching Figma Frame 35.
class CountryDropdownField extends StatelessWidget {
  const CountryDropdownField({
    super.key,
    required this.selectedCountry,
    required this.isExpanded,
    required this.onTap,
  });

  final CountryModel selectedCountry;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final displayName =
        '${isAr ? selectedCountry.nameAr : selectedCountry.nameEn} ${selectedCountry.flag}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.countryLabel,
          style: AppTextStyles.titleSmall.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14.r),
          child: Container(
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: isExpanded ? AppColors.secondary : AppColors.border,
                width: isExpanded ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Right side in RTL: Globe icon + Country name & flag
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.globeIcon,
                      width: 16.6.w,
                      height: 13.3.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      displayName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),

                // Left side in RTL: Resized Chevron Down/Up Icon
                Transform.rotate(
                  angle: isExpanded ? math.pi : 0,
                  child: SvgPicture.asset(
                    AppAssets.chevronDownIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
