import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/country_model.dart';
import 'radio_circle_icon.dart';

/// Single country item tile in the dropdown menu matching Figma Frame 35.
class CountryOptionTile extends StatelessWidget {
  const CountryOptionTile({
    super.key,
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  final CountryModel country;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final itemName =
        '${isAr ? country.nameAr : country.nameEn} ${country.flag}';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(vertical: 2.h),
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondaryLight
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1. Right side in RTL: Country Name & Flag ("مصر 🇪🇬")
            Text(
              itemName,
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),

            // 2. Left side in RTL: Radio Circle Indicator
            RadioCircleIcon(
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
