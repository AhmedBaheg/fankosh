import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/country_model.dart';
import 'country_option_tile.dart';

/// Animated expandable country list menu matching Figma Frame 35.
class CountryDropdownMenu extends StatelessWidget {
  const CountryDropdownMenu({
    super.key,
    required this.selectedCountry,
    required this.isExpanded,
    required this.onSelectCountry,
  });

  final CountryModel selectedCountry;
  final bool isExpanded;
  final ValueChanged<CountryModel> onSelectCountry;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: Container(
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.borderLight,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: CountryModel.defaultCountries.map((country) {
            final isSelected =
                country.nameAr == selectedCountry.nameAr &&
                    country.code == selectedCountry.code;

            return CountryOptionTile(
              country: country,
              isSelected: isSelected,
              onTap: () => onSelectCountry(country),
            );
          }).toList(),
        ),
      ),
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 250),
    );
  }
}
