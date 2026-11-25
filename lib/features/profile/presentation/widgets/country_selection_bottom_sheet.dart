import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/country_item_model.dart';
import 'country_search_field.dart';
import 'country_selection_tile.dart';

/// Modal bottom sheet dialog for country selection (Figma Dialog - CountrySelectionBottomSheet).
///
/// Features:
/// - Header with close button, title ("اختار دولتك 🌍"), and subtitle
/// - Instant search input field ([CountrySearchField])
/// - Scrollable list of countries with flags & custom radio indicators ([CountrySelectionTile])
/// - Primary button for saving changes ([PrimaryButton])
class CountrySelectionBottomSheet extends StatefulWidget {
  const CountrySelectionBottomSheet({
    super.key,
    this.initialCountry = 'مصر 🇪🇬',
    this.onCountrySelected,
  });

  final String initialCountry;
  final ValueChanged<String>? onCountrySelected;

  static const List<CountryItem> countries = [
    CountryItem(name: 'مصر', flag: '🇪🇬'),
    CountryItem(name: 'السعودية', flag: '🇸🇦'),
    CountryItem(name: 'الإمارات', flag: '🇦🇪'),
    CountryItem(name: 'الكويت', flag: '🇰🇼'),
    CountryItem(name: 'قطر', flag: '🇶🇦'),
    CountryItem(name: 'البحرين', flag: '🇧🇭'),
    CountryItem(name: 'عُمان', flag: '🇴🇲'),
    CountryItem(name: 'الأردن', flag: '🇯🇴'),
    CountryItem(name: 'المغرب', flag: '🇲🇦'),
    CountryItem(name: 'تونس', flag: '🇹🇳'),
    CountryItem(name: 'الجزائر', flag: '🇩🇿'),
    CountryItem(name: 'العراق', flag: '🇮🇶'),
    CountryItem(name: 'لبنان', flag: '🇱🇧'),
    CountryItem(name: 'فلسطين', flag: '🇵🇸'),
    CountryItem(name: 'اليمن', flag: '🇾🇪'),
    CountryItem(name: 'ليبيا', flag: '🇱🇾'),
    CountryItem(name: 'السودان', flag: '🇸🇩'),
  ];

  @override
  State<CountrySelectionBottomSheet> createState() =>
      _CountrySelectionBottomSheetState();
}

class _CountrySelectionBottomSheetState
    extends State<CountrySelectionBottomSheet> {
  late String _selectedCountryName;
  final TextEditingController _searchController = TextEditingController();
  List<CountryItem> _filteredCountries = CountrySelectionBottomSheet.countries;

  @override
  void initState() {
    super.initState();
    _selectedCountryName = widget.initialCountry;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = CountrySelectionBottomSheet.countries;
      } else {
        _filteredCountries = CountrySelectionBottomSheet.countries
            .where((item) =>
                item.name.toLowerCase().contains(query) ||
                item.displayName.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  bool _isSelected(CountryItem item) {
    return _selectedCountryName.contains(item.name) ||
        item.displayName == _selectedCountryName;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      constraints: BoxConstraints(
        maxHeight: 695.h,
        minHeight: 450.h,
      ),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSheet,
            blurRadius: 30,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Top Drag Handle Pill
            Center(
              child: Container(
                width: 36.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.borderLightGray,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // 2. Header Row: Close Button (Left) & Title + Subtitle (Right in RTL)
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Right: Title & Subtitle Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.chooseCountryTitle,
                        style: AppStyles.alexandria(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.profileTextDeepDark,
                          height: 24.75 / 18,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        l10n.chooseCountrySubtitle,
                        style: AppStyles.alexandria(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondaryGray,
                          height: 19.5 / 13,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),

                // Left: Close Circle Button (X)
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(9999.r),
                  child: Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceMuted,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 18.sp,
                        color: AppColors.textSecondaryGray,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // 3. Search TextFormField Component
            CountrySearchField(
              controller: _searchController,
              hintText: l10n.searchCountryHint,
            ),
            SizedBox(height: 12.h),

            // 4. Countries Scrollable List
            Expanded(
              child: _filteredCountries.isEmpty
                  ? Center(
                      child: Text(
                        'لا توجد نتائج مطابقة',
                        style: AppStyles.alexandria(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondaryGray,
                        ),
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _filteredCountries.length,
                      separatorBuilder: (context, index) => SizedBox(height: 4.h),
                      itemBuilder: (context, index) {
                        final item = _filteredCountries[index];
                        return CountrySelectionTile(
                          item: item,
                          isSelected: _isSelected(item),
                          onTap: () {
                            setState(() {
                              _selectedCountryName = item.displayName;
                            });
                          },
                        );
                      },
                    ),
            ),
            SizedBox(height: 12.h),

            // 5. Primary Action Button "حفظ التغييرات"
            PrimaryButton(
              text: l10n.saveChanges,
              height: 52.h,
              borderRadius: 35.r,
              backgroundColor: AppColors.primary,
              textColor: AppColors.profileTextDeepDark,
              textStyle: AppStyles.alexandria(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.profileTextDeepDark,
              ),
              hasShadow: true,
              onPressed: () {
                widget.onCountrySelected?.call(_selectedCountryName);
                Navigator.pop(context, _selectedCountryName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper function to display the CountrySelectionBottomSheet.
Future<String?> showCountrySelectionBottomSheet(
  BuildContext context, {
  String initialCountry = 'مصر 🇪🇬',
  ValueChanged<String>? onCountrySelected,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.overlay,
    builder: (context) => CountrySelectionBottomSheet(
      initialCountry: initialCountry,
      onCountrySelected: onCountrySelected,
    ),
  );
}
