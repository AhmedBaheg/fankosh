import 'package:flutter/material.dart';

/// Centralized color palette extracted directly from the Figma design.
///
/// Designed with semantic naming, comprehensive coverage for all mobile screens
/// and components of the Fankosh application.
abstract final class AppColors {
  // ==========================================
  // 1. PRIMARY BRAND COLORS (Fankosh Yellow / Gold)
  // ==========================================
  /// Main CTA buttons, attempt counters, brand highlights, active pills (#FEC529)
  static const Color primary = Color(0xFFFEC529);

  /// Dark golden amber used for active highlights, icons, secondary gradients (#FE9311)
  static const Color primaryDark = Color(0xFFFE9311);

  /// Soft light yellow glow used in recording pulses and circular rings (#FCE372)
  static const Color primaryLight = Color(0xFFFCE372);

  /// Dark gold used for high-contrast text and icons on yellow surfaces (#815600)
  static const Color primaryExtraDark = Color(0xFF815600);

  /// Vibrant golden amber used for celebration vectors and stars (#FFAE00)
  static const Color primaryGold = Color(0xFFFFAE00);

  /// Golden border highlight on selected plan cards and badges (#FFC928)
  static const Color primaryGoldBorder = Color(0xFFFFC928);

  /// Deep espresso brand dark used in drawer headers and accents (#2F1900)
  static const Color primaryBrandDark = Color(0xFF2F1900);

  // ==========================================
  // 2. SECONDARY BRAND COLORS (Interactive Blue)
  // ==========================================
  /// Vibrant blue used for active tab bar icons, secondary CTAs, links (#399CFE)
  static const Color secondary = Color(0xFF399CFE);

  /// Dark blue interactive state (#1E7ADB)
  static const Color secondaryDark = Color(0xFF1E7ADB);

  /// Light blue background for info chips and secondary surfaces (#EBF5FF)
  static const Color secondaryLight = Color(0xFFEBF5FF);

  // ==========================================
  // 3. BACKGROUND & SURFACE COLORS
  // ==========================================
  /// Primary warm cream background used throughout all mobile screens (#FDFBF4)
  static const Color background = Color(0xFFFDFBF4);

  /// Scaffold background alias for Flutter themes (#FDFBF4)
  static const Color scaffoldBackground = Color(0xFFFDFBF4);

  /// Pure white used for cards, bottom sheets, dialog modals (#FFFFFF)
  static const Color surface = Color(0xFFFFFFFF);

  /// Card surface alias (#FFFFFF)
  static const Color card = Color(0xFFFFFFFF);

  /// Warm subtle card fill used in segmented controls and chips (#FEFAF0)
  static const Color surfaceWarm = Color(0xFFFEFAF0);

  /// Warm off-white surface for utility bars and horizontal strips (#FAF7F2)
  static const Color surfaceSubtle = Color(0xFFFAF7F2);

  /// Light gray background used for secondary action pill buttons (#F3F4F6)
  static const Color surfaceMuted = Color(0xFFF3F4F6);

  /// Soft neutral white used in form input fills (#FAFAF9)
  static const Color surfaceSoft = Color(0xFFFAFAF9);

  /// Very light button surface (#F8F9FC)
  static const Color surfaceLight = Color(0xFFF8F9FC);

  // ==========================================
  // 4. TEXT & TYPOGRAPHY COLORS
  // ==========================================
  /// High-emphasis primary text: titles, headings, bold callouts (#150E16)
  static const Color textPrimary = Color(0xFF150E16);

  /// Dark text variant 1 used in plan headers (#1B1C1C)
  static const Color textPrimaryDark = Color(0xFF1B1C1C);

  /// Dark text variant 2 used in status bars and captions (#1A1A1A)
  static const Color textDarkNeutral = Color(0xFF1A1A1A);

  /// Dark text variant 3 used in titles and counters (#211921)
  static const Color textDeepDark = Color(0xFF211921);

  /// Charcoal black text used in notification items (#111827)
  static const Color textBlack = Color(0xFF111827);

  /// Absolute pure black (#000000)
  static const Color textPureBlack = Color(0xFF000000);

  /// Medium-emphasis secondary text: descriptions, subtitles (#4E4633)
  static const Color textSecondary = Color(0xFF4E4633);

  /// Secondary text variant (#4F4633)
  static const Color textSecondaryVariant = Color(0xFF4F4633);

  /// Warm muted brown text (#554334)
  static const Color textMutedBrown = Color(0xFF554334);

  /// Slate dark text (#2D3139)
  static const Color textSlate = Color(0xFF2D3139) ;

  /// Dark charcoal text (#191C20)
  static const Color textDarkCharcoal = Color(0xFF191C20);

  /// Body gray text (#4B5563)
  static const Color textBodyGray = Color(0xFF4B5563);

  /// Low-emphasis tertiary text: timestamps, helper text, counters (#6B7280)
  static const Color textTertiary = Color(0xFF6B7280);

  /// Inactive bottom bar icon and label color (#928E89)
  static const Color textNavInactive = Color(0xFF928E89);

  /// Muted subtitle text (#8D8985)
  static const Color textMuted = Color(0xFF8D8985);

  /// Disabled text and placeholder color (#9CA3AF)
  static const Color textDisabled = Color(0xFF9CA3AF);

  /// Search placeholder text (#8E919D)
  static const Color textPlaceholder = Color(0xFF8E919D);

  /// White text for dark surfaces, badges, primary CTA buttons (#FFFFFF)
  static const Color textWhite = Color(0xFFFFFFFF);

  // ==========================================
  // 5. BORDER & DIVIDER COLORS
  // ==========================================
  /// Warm subtle border for cards, inputs, and search containers (#EBE6DF)
  static const Color border = Color(0xFFEBE6DF);

  /// Subtle border divider (#EFE9DC)
  static const Color borderSubtle = Color(0xFFEFE9DC);

  /// Light neutral border for sheet handles and pill buttons (#E5E7EB)
  static const Color borderLight = Color(0xFFE5E7EB);

  /// Golden muted border for premium cards (#F3E8D1)
  static const Color borderGolden = Color(0xFFF3E8D1);

  /// Form field input border (#E2E5EC)
  static const Color borderInput = Color(0xFFE2E5EC);

  /// List item divider (#EAEDF2)
  static const Color divider = Color(0xFFEAEDF2);

  /// Soft border divider (#EAEDF4)
  static const Color borderGray = Color(0xFFEAEDF4);

  /// Khaki border for profile cards (#D2C5AC)
  static const Color borderKhaki = Color(0xFFD2C5AC);

  /// Dark border for outlines (#434751)
  static const Color borderDark = Color(0xFF434751);

  /// Icon stroke gray (#3C3C3C)
  static const Color borderIconGray = Color(0xFF3C3C3C);

  // ==========================================
  // 6. SEMANTIC & STATUS COLORS
  // ==========================================
  /// Success green: Active plan badge "نشطة", toggles, success checks (#18CB9E)
  static const Color success = Color(0xFF18CB9E);

  /// Light success background tint (#E8FBF5)
  static const Color successLight = Color(0xFFE8FBF5);

  /// Error coral red: Logout action, delete recording, error messages (#FD5C53)
  static const Color error = Color(0xFFFD5C53);

  /// Dark coral red text (#C84727)
  static const Color errorDark = Color(0xFFC84727);

  /// Light coral background tint (#FBE7E2)
  static const Color errorLight = Color(0xFFFBE7E2);

  /// Coral error border tint (#F7D0C5)
  static const Color errorBorder = Color(0xFFF7D0C5);

  /// Pink border tint for error/destructive tags (#FECDD3)
  static const Color errorBorderLight = Color(0xFFFECDD3);

  /// Warning orange: alerts, remaining attempts alert (#FE9311)
  static const Color warning = Color(0xFFFE9311);

  /// Light warning background tint (#FFF3E0)
  static const Color warningLight = Color(0xFFFFF3E0);

  /// Info blue: informational notices (#399CFE)
  static const Color info = Color(0xFF399CFE);

  /// Light info background tint (#EBF5FF)
  static const Color infoLight = Color(0xFFEBF5FF);

  // ==========================================
  // 7. COMPONENT SPECIFIC & ACCENTS
  // ==========================================
  /// Inactive bottom bar icon and label color (#928E89)
  static const Color navInactive = Color(0xFF928E89);

  /// Active bottom bar item color (#399CFE)
  static const Color navActive = Color(0xFF399CFE);

  /// High-contrast coral red notification count badge (#E05A38)
  static const Color notificationBadge = Color(0xFFE05A38);

  /// Audio player timeline scrubber cursor spot (#815600)
  static const Color audioScrubberCursor = Color(0xFF815600);

  /// Microphone recording pulse ring with ~59% opacity (#FCE372)
  static const Color micPulseGlow = Color(0x96FCE372);

  /// Dark modal backdrop overlay
  static const Color overlay = Color(0x80000000);

  /// Light modal backdrop overlay
  static const Color overlayLight = Color(0x1A000000);

  /// Transparent color
  static const Color transparent = Color(0x00000000);

  // ==========================================
  // 8. BRAND GRADIENTS
  // ==========================================
  /// Primary golden yellow gradient for main buttons
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [primary, primaryDark],
  );

  /// Splash screen background gradient
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFF9E6),
      Color(0xFFFDFBF4),
    ],
  );

  /// Microphone pulsing ripple gradient
  static const RadialGradient micRippleGradient = RadialGradient(
    colors: [
      Color(0x96FCE372),
      Color(0x33FCE372),
      Color(0x00FCE372),
    ],
  );

  /// Card highlight gradient
  static const LinearGradient cardHighlightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      surface,
      surfaceWarm,
    ],
  );
}
