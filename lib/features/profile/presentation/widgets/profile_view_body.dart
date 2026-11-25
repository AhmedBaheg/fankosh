import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'account_settings_card.dart';
import 'country_selection_bottom_sheet.dart';
import 'language_selection_bottom_sheet.dart';
import 'logout_card.dart';
import 'profile_header_title.dart';
import 'profile_subscription_card.dart';
import 'user_profile_card.dart';

/// Full Profile view body layout.
///
/// Features:
/// - Wavy top artwork ([AppAssets.profileHeaderBg])
/// - Top AppHeaderBar (Notifications, Logo, Profile avatar)
/// - Title "حسابي" and Subtitle "كل حاجة تخص حسابك في مكان واحد"
/// - Section 1: [UserProfileCard]
/// - Section 2: [ProfileSubscriptionCard]
/// - Section 3: [AccountSettingsCard] with interactive country selection
/// - Section 4: [LogoutCard]
class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({
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
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late String _currentName;
  late String _currentCountry;
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentName = widget.name;
    _currentCountry = widget.initialCountry;
    _currentLanguage = widget.initialLanguage;
  }

  void _handleEditProfile() async {
    if (widget.onEditProfile != null) {
      widget.onEditProfile!();
      return;
    }
    final result = await Navigator.pushNamed(context, Routes.editProfileView);
    if (result is String && result.isNotEmpty && mounted) {
      setState(() {
        _currentName = result;
      });
    }
  }

  void _handleCountryTap() {
    if (widget.onCountryTap != null) {
      widget.onCountryTap!();
      return;
    }

    showCountrySelectionBottomSheet(
      context,
      initialCountry: _currentCountry,
      onCountrySelected: (newCountry) {
        setState(() {
          _currentCountry = newCountry;
        });
        widget.onCountryChanged?.call(newCountry);
      },
    );
  }

  void _handleLanguageTap() {
    if (widget.onLanguageTap != null) {
      widget.onLanguageTap!();
      return;
    }

    showLanguageSelectionBottomSheet(
      context,
      initialLanguage: _currentLanguage,
      onLanguageSelected: (newLanguage) {
        setState(() {
          _currentLanguage = newLanguage;
        });
        widget.onLanguageChanged?.call(newLanguage);
      },
    );
  }

  void _handleNotificationsTap() {
    if (widget.onNotificationsTap != null) {
      widget.onNotificationsTap!();
      return;
    }
    Navigator.pushNamed(context, Routes.notificationsView);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Stack(
      children: [
        // 1. Wavy Header Background Artwork positioned at the top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AppAssets.profileHeaderBg,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),

        // 2. Scrollable Foreground Content
        SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top App Header Bar
                const AppHeaderBar(),
                SizedBox(height: 28.h),

                // Title & Subtitle ("حسابي" & "كل حاجة تخص حسابك في مكان واحد")
                ProfileHeaderTitle(
                  title: l10n.tabProfile,
                  subtitle: l10n.profileHeaderSubtitle,
                ),
                SizedBox(height: 24.h),

                // Section 1: User Profile Card
                UserProfileCard(
                  name: _currentName,
                  email: widget.email,
                  onEdit: _handleEditProfile,
                ),
                SizedBox(height: 12.h),

                // Section 2: Subscription Summary Card
                ProfileSubscriptionCard(
                  planName: widget.planName,
                  statusText: widget.statusText,
                  remainingAttempts: widget.remainingAttempts,
                  onShowMyBundle: widget.onShowMyBundle,
                ),
                SizedBox(height: 20.h),

                // Section 3: Account Settings Group Card
                AccountSettingsCard(
                  country: _currentCountry,
                  language: _currentLanguage,
                  onBirthdayTap: widget.onBirthdayTap,
                  onNotificationsTap: _handleNotificationsTap,
                  onCountryTap: _handleCountryTap,
                  onLanguageTap: _handleLanguageTap,
                  onPrivacyTap: widget.onPrivacyTap,
                  onSupportTap: widget.onSupportTap,
                  onAboutTap: widget.onAboutTap,
                ),
                SizedBox(height: 12.h),

                // Section 4: Logout Action Card
                LogoutCard(onLogout: widget.onLogout),

                // Bottom Padding for bottom navigation bar
                SizedBox(height: 110.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
