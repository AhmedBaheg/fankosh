import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../profile/presentation/widgets/profile_view_body.dart';

/// Body layout for Profile / Account tab (Index 2 in Bottom Navigation).
///
/// Wraps [ProfileViewBody] for the Profile tab with bottom navigation callbacks.
class ProfileTabBody extends StatelessWidget {
  const ProfileTabBody({
    super.key,
    this.name = 'أحمد محمد',
    this.email = 'ahmed@example.com',
    this.planName = 'اشتراكي: فانكوش بلس',
    this.statusText = 'نشطة',
    this.remainingAttempts = 28,
    this.initialCountry = 'مصر 🇪🇬',
    this.initialLanguage = 'العربية',
    this.onCountryChanged,
    this.onLanguageChanged,
    this.onEditProfile,
    this.onShowMyBundle,
    this.onLogout,
    this.onBirthdayTap,
    this.onNotificationsTap,
    this.onCountryTap,
    this.onLanguageTap,
    this.onPrivacyTap,
    this.onSupportTap,
    this.onAboutTap,
  });

  final String name;
  final String email;
  final String planName;
  final String statusText;
  final int remainingAttempts;
  final String initialCountry;
  final String initialLanguage;
  final ValueChanged<String>? onCountryChanged;
  final ValueChanged<String>? onLanguageChanged;
  final VoidCallback? onEditProfile;
  final VoidCallback? onShowMyBundle;
  final VoidCallback? onLogout;
  final VoidCallback? onBirthdayTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onCountryTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onSupportTap;
  final VoidCallback? onAboutTap;

  @override
  Widget build(BuildContext context) {
    return ProfileViewBody(
      name: name,
      email: email,
      planName: planName,
      statusText: statusText,
      remainingAttempts: remainingAttempts,
      initialCountry: initialCountry,
      initialLanguage: initialLanguage,
      onCountryChanged: onCountryChanged,
      onLanguageChanged: onLanguageChanged,
      onEditProfile: onEditProfile,
      onShowMyBundle: onShowMyBundle ??
          () {
            Navigator.pushNamed(context, Routes.myBundleView);
          },
      onLogout: onLogout,
      onBirthdayTap: onBirthdayTap,
      onNotificationsTap: onNotificationsTap,
      onCountryTap: onCountryTap,
      onLanguageTap: onLanguageTap,
      onPrivacyTap: onPrivacyTap,
      onSupportTap: onSupportTap,
      onAboutTap: onAboutTap,
    );
  }
}
