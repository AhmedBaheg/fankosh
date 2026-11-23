import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/country_model.dart';

/// Modal bottom sheet allowing users to search and select a country with its flag.
class CountryPickerBottomSheet extends StatefulWidget {
  const CountryPickerBottomSheet({
    super.key,
    required this.selectedCountry,
  });

  final CountryModel selectedCountry;

  static Future<CountryModel?> show(
    BuildContext context, {
    required CountryModel selectedCountry,
  }) {
    return showModalBottomSheet<CountryModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => CountryPickerBottomSheet(
        selectedCountry: selectedCountry,
      ),
    );
  }

  @override
  State<CountryPickerBottomSheet> createState() =>
      _CountryPickerBottomSheetState();
}

class _CountryPickerBottomSheetState
    extends State<CountryPickerBottomSheet> {
  late final TextEditingController _searchController;
  List<CountryModel> _filteredCountries = CountryModel.defaultCountries;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        _filteredCountries = CountryModel.defaultCountries;
      } else {
        _filteredCountries = CountryModel.defaultCountries.where((country) {
          final q = query.toLowerCase().trim();
          return country.nameAr.contains(q) ||
              country.nameEn.toLowerCase().contains(q) ||
              country.code.contains(q);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 520.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            // 1. Drag handle indicator
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.borderLight,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // 2. Title & Close Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isAr ? 'اختر الدولة' : 'Select Country',
                  style: AppTextStyles.headlineSmall.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    AppAssets.closeIcon,
                    width: 20.w,
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // 3. Search Bar
            CustomTextField(
              controller: _searchController,
              hintText: l10n.search,
              prefixIcon: AppAssets.searchIcon,
              onChanged: _onSearchChanged,
            ),
            SizedBox(height: 16.h),

            // 4. Country List
            Expanded(
              child: ListView.separated(
                itemCount: _filteredCountries.length,
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.divider,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final country = _filteredCountries[index];
                  final isSelected =
                      country.code == widget.selectedCountry.code &&
                          country.nameAr == widget.selectedCountry.nameAr;

                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 14.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            country.flag,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              isAr ? country.nameAr : country.nameEn,
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontSize: 15.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected
                                    ? AppColors.primaryDark
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Text(
                            country.code,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          if (isSelected) ...[
                            SizedBox(width: 10.w),
                            SvgPicture.asset(
                              AppAssets.checkCircleIcon,
                              width: 20.w,
                              height: 20.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.success,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
