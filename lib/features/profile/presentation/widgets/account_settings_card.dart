import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'settings_menu_item_tile.dart';

/// Settings Group Section with header "الإعدادات" and rounded white card containing 7 settings options.
///
/// Matches Figma specs: width: 358, borderRadius: 20px, dual shadows.
class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({
    super.key,
    this.country = 'مصر 🇪🇬',
    this.language = 'العربية',
    this.onBirthdayTap,
    this.onNotificationsTap,
    this.onCountryTap,
    this.onLanguageTap,
    this.onPrivacyTap,
    this.onSupportTap,
    this.onAboutTap,
  });

  final String country;
  final String language;
  final VoidCallback? onBirthdayTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onCountryTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onSupportTap;
  final VoidCallback? onAboutTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<AccountSettingsItemData> items = [
      AccountSettingsItemData(
        iconPath: AppAssets.birthdayCakeIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.birthDateTitle,
        subtitle: l10n.addBirthDateSubtitle,
        onTap: onBirthdayTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.notificationIcon,
        iconBgColor: const Color(0xFFFFF7DC),
        iconColor: AppColors.primaryDark,
        title: l10n.notifications,
        subtitle: l10n.notificationsSubtitle,
        onTap: onNotificationsTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.countryGlobeIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.countryTitle,
        subtitle: country,
        onTap: onCountryTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.globeIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.language,
        subtitle: language,
        onTap: onLanguageTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.privacyShieldIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.privacyAndSecurityTitle,
        subtitle: l10n.privacyAndSecuritySubtitle,
        onTap: onPrivacyTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.supportHeadsetIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.helpAndSupport,
        subtitle: l10n.helpAndSupportSubtitle,
        onTap: onSupportTap,
      ),
      AccountSettingsItemData(
        iconPath: AppAssets.informationIcon,
        iconBgColor: const Color(0xFFF6F3F2),
        title: l10n.aboutFankoshTitle,
        subtitle: l10n.aboutFankoshSubtitle,
        onTap: onAboutTap,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Section Title: "الإعدادات"
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            l10n.settingsSectionTitle,
            style: GoogleFonts.alexandria(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textHeaderDark,
            ),
          ),
        ),
        SizedBox(height: 10.h),

        // Settings Container Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08251A00),
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
              BoxShadow(
                color: Color(0x0D251A00),
                blurRadius: 20,
                offset: Offset(0, 4),
                spreadRadius: -4,
              ),
            ],
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                SettingsMenuItemTile(item: items[i]),
                if (i < items.length - 1)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F3F2),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
