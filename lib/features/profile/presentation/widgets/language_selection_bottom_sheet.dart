import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import 'language_option_tile.dart';

/// Language selection bottom sheet dialog matching Figma specs:
/// - width: 390, minHeight: 388, padding: 12px 20px 32px 20px, radius: 24px
/// - Title: "اختر اللغة" (Cairo Bold 18px, #0B1C30)
/// - Subtitle: "اختر لغة عرض التطبيق." (Cairo Regular 13px, #414753)
/// - Option 1: Arabic (ع)
/// - Option 2: English (EN)
/// - Primary Save Button: "حفظ" (#FEC529, Cairo Bold 14px, #FFFFFF)
/// - Cancel Button: "إلغاء" (Cairo SemiBold 14px, #414753)
class LanguageSelectionBottomSheet extends StatefulWidget {
  const LanguageSelectionBottomSheet({
    super.key,
    this.initialLanguage = 'العربية',
    this.onLanguageSelected,
  });

  final String initialLanguage;
  final ValueChanged<String>? onLanguageSelected;

  @override
  State<LanguageSelectionBottomSheet> createState() =>
      _LanguageSelectionBottomSheetState();
}

class _LanguageSelectionBottomSheetState
    extends State<LanguageSelectionBottomSheet> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialLanguage;
  }

  bool _isArabicSelected() =>
      _selectedLanguage == 'العربية' || _selectedLanguage == 'ar';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = _isArabicSelected();

    return Container(
      constraints: BoxConstraints(minHeight: 388.h),
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 32.h),
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
            // 1. Top Drag Handle
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
            SizedBox(height: 16.h),

            // 2. Title & Subtitle
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                l10n.chooseLanguageTitle,
                style: AppStyles.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkNavy,
                  height: 27 / 18,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 6.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                l10n.chooseLanguageSubtitle,
                style: AppStyles.cairo(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSlate,
                  height: 19.5 / 13,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 24.h),

            // 3. Option 1: Arabic
            LanguageOptionTile(
              title: l10n.arabic,
              subtitle: 'Arabic',
              badgeText: 'ع',
              badgeTextColor: isArabic
                  ? AppColors.secondary
                  : AppColors.profileTextSlate,
              badgeBgColor: isArabic
                  ? AppColors.surface
                  : AppColors.surfaceNeutral,
              badgeBorderColor: isArabic
                  ? AppColors.secondary
                  : Colors.transparent,
              isSelected: isArabic,
              onTap: () {
                setState(() {
                  _selectedLanguage = 'العربية';
                });
              },
            ),
            SizedBox(height: 10.h),

            // 4. Option 2: English
            LanguageOptionTile(
              title: 'English',
              subtitle: l10n.english,
              badgeText: 'EN',
              badgeTextColor: AppColors.primary,
              badgeBgColor: AppColors.surfaceNeutral,
              badgeBorderColor: !isArabic
                  ? AppColors.secondary
                  : Colors.transparent,
              isSelected: !isArabic,
              onTap: () {
                setState(() {
                  _selectedLanguage = 'English';
                });
              },
            ),
            SizedBox(height: 28.h),

            // 5. Save Button
            InkWell(
              onTap: () {
                widget.onLanguageSelected?.call(_selectedLanguage);
                Navigator.pop(context, _selectedLanguage);
              },
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                width: double.infinity,
                height: 49.h,
                constraints: BoxConstraints(minHeight: 48.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowSubtleBlack,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    l10n.save,
                    style: AppStyles.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.surface,
                      height: 21 / 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // 6. Cancel Button
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                width: double.infinity,
                height: 45.h,
                constraints: BoxConstraints(minHeight: 44.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    l10n.cancel,
                    style: AppStyles.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.profileTextSlate,
                      height: 21 / 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper function to display the LanguageSelectionBottomSheet.
Future<String?> showLanguageSelectionBottomSheet(
  BuildContext context, {
  String initialLanguage = 'العربية',
  ValueChanged<String>? onLanguageSelected,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.overlay,
    builder: (context) => LanguageSelectionBottomSheet(
      initialLanguage: initialLanguage,
      onLanguageSelected: onLanguageSelected,
    ),
  );
}
