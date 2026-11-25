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

  /// Bottom nav bar border color (#FCD66C)
  static const Color navBorder = Color(0xFFFCD66C);
  static const Color navText = Color(0xFF6B6965);

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

  /// User voice message bubble fill in recognition chat (#FEF0CE)
  static const Color userBubbleBackground = Color(0xFFFEF0CE);

  /// Dark olive-gold play icon fill in voice preview bubble (#6F5500)
  static const Color playIconBrown = Color(0xFF6F5500);

  /// User voice bubble duration and waveform bar color (#815600)
  static const Color userBubbleText = Color(0xFF815600);

  /// AI message searching card background in recognition chat (#FFFBF0)
  static const Color aiSearchingCardBg = Color(0xFFFFFBF0);

  /// AI message searching card border in recognition chat (#F4E6C0)
  static const Color aiSearchingCardBorder = Color(0xFFF4E6C0);

  /// AI message bubble border with 70% opacity (#E8E2D4B2)
  static const Color aiBubbleBorder = Color(0xB2E8E2D4);

  /// AI search overlay circular background tint 25% opacity (#FFC92840)
  static const Color searchOverlayBg = Color(0x40FFC928);

  /// Vibrant accent cyan-blue used for searching pill badge (#43BDFD)
  static const Color searchingBadgeBlue = Color(0xFF43BDFD);

  /// Gray-brown status caption text (#807660)
  static const Color textGrayBrown = Color(0xFF807660);

  /// Share dialog subtitle text color (#4A454E)
  static const Color dialogSubtitleText = Color(0xFF4A454E);

  /// Share dialog muted text and action color (#6B6572)
  static const Color dialogMutedText = Color(0xFF6B6572);

  /// Share dialog duration timestamp text color (#9C9484)
  static const Color dialogTimestampText = Color(0xFF9C9484);

  /// Share dialog inner audio player card background (#F6F5F2)
  static const Color dialogCardBg = Color(0xFFF6F5F2);

  /// Share dialog secondary cancel button background (#F0EFEF)
  static const Color dialogBtnSecondaryBg = Color(0xFFF0EFEF);

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

  // ==========================================
  // 9. PROFILE, NOTIFICATIONS & SETTINGS COLORS
  // ==========================================
  /// Circular avatar background in user profile (#EAF4FE)
  static const Color profileAvatarBg = Color(0xFFEAF4FE);

  /// Subtitle muted brown text (#4E4633)
  static const Color profileTextMutedBrown = Color(0xFF4E4633);

  /// Header dark text (#1B1C1C)
  static const Color textHeaderDark = Color(0xFF1B1C1C);

  /// Deep dark text (#150E16)
  static const Color profileTextDeepDark = Color(0xFF150E16);

  /// Secondary description gray (#8D8985)
  static const Color textSecondaryGray = Color(0xFF8D8985);

  /// Dark navy text for titles (#0B1C30)
  static const Color textDarkNavy = Color(0xFF0B1C30);

  /// Slate gray for subtitles (#414753)
  static const Color profileTextSlate = Color(0xFF414753);

  /// Selected option light blue background (#F0F7FF)
  static const Color selectedItemLightBlue = Color(0xFFF0F7FF);

  /// Notification yellow icon container (#FEF6DF)
  static const Color notificationYellowBg = Color(0xFFFEF6DF);

  /// Notification blue icon container (#E0F2FE)
  static const Color notificationBlueBg = Color(0xFFE0F2FE);

  /// Card border / divider (#ECEAE6)
  static const Color dividerBorder = Color(0xFFECEAE6);

  /// Profile wavy header warm background (#FDF8EB)
  static const Color profileWaveTop = Color(0xFFFDF8EB);

  // ==========================================
  // 10. ATTEMPTS, NAVIGATION & MODAL ACCENTS
  // ==========================================
  /// Attempts badge top gradient color (#FFF7DC)
  static const Color attemptsBadgeGradientStart = Color(0xFFFFF7DC);

  /// Attempts badge bottom gradient color (#FFE699)
  static const Color attemptsBadgeGradientEnd = Color(0xFFFFE699);

  /// Attempts badge gold border (#FCDA82)
  static const Color attemptsBadgeBorder = Color(0xFFFCDA82);

  /// Benefits icon background tint (#FDC41E2B)
  static const Color benefitsIconBg = Color(0x2BFDC41E);

  /// Bottom nav bar active glass background (#FFFFFF61)
  static const Color navBarGlassActive = Color(0x61FFFFFF);

  /// Bottom nav bar inactive glass background (#FFFFFFEB)
  static const Color navBarGlassInactive = Color(0xEBFFFFFF);

  /// Bottom nav bar subtle border (#F5F5F5)
  static const Color navBarBorderLight = Color(0xFFF5F5F5);

  /// Discover button vibrant blue (#3998FA)
  static const Color discoverBlueAccent = Color(0xFF3998FA);

  /// Modal overlay barrier 40% black (#00000066)
  static const Color modalOverlayBarrier = Color(0x66000000);

  /// Subtle drop shadow tint (#0000000A)
  static const Color shadowSubtle = Color(0x0A000000);

  /// Active plan badge solid green (#0A9E77)
  static const Color activeBadgeGreen = Color(0xFF0A9E77);

  /// Active plan badge light mint background (#E8FAF4)
  static const Color activeBadgeMintBg = Color(0xFFE8FAF4);

  /// Trial step active circle gradient top (#FBBF24)
  static const Color trialActiveGradientStart = Color(0xFFFBBF24);

  /// Trial step active circle gradient bottom (#FACC15)
  static const Color trialActiveGradientEnd = Color(0xFFFACC15);

  /// Trial step amber label (#B45309)
  static const Color trialAmberText = Color(0xFFB45309);

  /// Warning amber orange (#F59E0B)
  static const Color amberWarning = Color(0xFFF59E0B);

  /// Dark navy charcoal (#1E232A)
  static const Color textDarkNavyCharcoal = Color(0xFF1E232A);

  /// Gold border tint (#FDE68A)
  static const Color goldBorderTint = Color(0xFFFDE68A);

  /// Card gold tint fill (#FFFBEB)
  static const Color cardGoldTintFill = Color(0xFFFFFBEB);

  /// Gold badge background (#FFDF95)
  static const Color badgeGoldBg = Color(0xFFFFDF95);

  /// Muted warm gray box background (#F6F3F2)
  static const Color surfaceWarmMuted = Color(0xFFF6F3F2);

  // ==========================================
  // 11. GENERAL SHADOWS & NEUTRAL SURFACES
  // ==========================================
  /// 5% black shadow (0px 1px 2px #0000000D)
  static const Color shadowSubtleBlack = Color(0x0D000000);

  /// 3% black shadow (0px 2px 8px #00000008)
  static const Color shadowLight = Color(0x08000000);

  /// 18% black shadow for sheets (0px -8px 30px #0000002E)
  static const Color shadowSheet = Color(0x2E000000);

  /// Card dark shadow (0x0A190E16)
  static const Color shadowCardDark = Color(0x0A190E16);

  /// Amber / gold subtle card shadow (0x08251A00)
  static const Color shadowGold08 = Color(0x08251A00);

  /// Amber / gold elevation shadow (0x0D251A00)
  static const Color shadowGold0D = Color(0x0D251A00);

  /// Card border with 70% opacity (#E7E5E4B2)
  static const Color borderLightMuted = Color(0xB2E7E5E4);

  /// Subtle gray surface (#F1EFEF)
  static const Color surfaceMutedGray = Color(0xFFF1EFEF);

  /// Warm yellow card background (#FFF9E2)
  static const Color cardYellowTint = Color(0xFFFFF9E2);

  /// Radio button unselected border (#BCBFC6)
  static const Color radioUnselected = Color(0xFFBCBFC6);

  /// Border light gray (#D1D5DB)
  static const Color borderLightGray = Color(0xFFD1D5DB);

  /// Green badge text (#0E936C)
  static const Color badgeGreenDark = Color(0xFF0E936C);

  /// Muted dark gray (#706E6E)
  static const Color textMutedDarkGray = Color(0xFF706E6E);

  /// Neutral surface (#F6F6F6)
  static const Color surfaceNeutral = Color(0xFFF6F6F6);

  /// Error light red surface (#FFF0EF)
  static const Color errorSurfaceLight = Color(0xFFFFF0EF);

  /// Warm light surface (#F5F5F4)
  static const Color surfaceWarmLight = Color(0xFFF5F5F4);

  /// Neutral light border (#E5E2E1)
  static const Color borderNeutralLight = Color(0xFFE5E2E1);

  /// Neutral border (#E7E5E4)
  static const Color borderMuted = Color(0xFFE7E5E4);

  /// Muted warm text (#88847F)
  static const Color textMutedWarm = Color(0xFF88847F);

  /// Warm gray border (#A8A29E)
  static const Color borderWarmGray = Color(0xFFA8A29E);

  /// Border (#C7C5C2)
  static const Color borderC7C5C2 = Color(0xFFC7C5C2);

  /// Surface (#F7F5F5)
  static const Color surfaceF7F5F5 = Color(0xFFF7F5F5);

  /// Warm muted text (#78716C)
  static const Color textWarmMuted = Color(0xFF78716C);

  /// Light gold tint (#FFF2C6)
  static const Color goldLight2 = Color(0xFFFFF2C6);

  /// Light blue tint (#EBF4FF)
  static const Color blueLight2 = Color(0xFFEBF4FF);

  /// Light gray border (#E5E5E5)
  static const Color borderE5E5E5 = Color(0xFFE5E5E5);

  /// Error border pink (#FDA29B)
  static const Color errorBorderPink = Color(0xFFFDA29B);

  /// Gray border (#ECECEC)
  static const Color borderECECEC = Color(0xFFECECEC);

  /// Nav muted text (#6B6965)
  static const Color textNavMuted = Color(0xFF6B6965);

  /// Subtle gray surface (#F0EDED)
  static const Color surfaceF0EDED = Color(0xFFF0EDED);

  /// Border (#F0EBE1)
  static const Color borderF0EBE1 = Color(0xFFF0EBE1);

  /// Border (#DFDFDF)
  static const Color borderDFDFDF = Color(0xFFDFDFDF);

  /// Border (#F3ECE1)
  static const Color borderF3ECE1 = Color(0xFFF3ECE1);

  /// Orange surface tint (#FFF7ED)
  static const Color orangeSurfaceTint = Color(0xFFFFF7ED);

  /// Surface (#F8F8F8)
  static const Color surfaceF8F8F8 = Color(0xFFF8F8F8);

  /// Surface (#F8F7F4)
  static const Color surfaceF8F7F4 = Color(0xFFF8F7F4);

  /// Dark text (#292524)
  static const Color textDark292524 = Color(0xFF292524);

  /// Surface (#F2EFE9)
  static const Color surfaceF2EFE9 = Color(0xFFF2EFE9);

  /// Blue surface light (#E8F3FF)
  static const Color blueSurfaceLight = Color(0xFFE8F3FF);

  /// Error red surface light (#FEF2F2)
  static const Color errorRedSurfaceLight = Color(0xFFFEF2F2);

  /// Gold dark text (#5C3D00)
  static const Color goldDark5C3D00 = Color(0xFF5C3D00);

  /// Border gray (#E0E0E0)
  static const Color borderE0E0E0 = Color(0xFFE0E0E0);

  /// Blurry sheet background (#FCF9F8F2)
  static const Color surfaceBlurNav = Color(0xF2FCF9F8);

  /// Shadow 20%
  static const Color shadow20 = Color(0x20000000);

  /// Shadow 5%
  static const Color shadow05 = Color(0x05000000);

  /// Shadow 40%
  static const Color shadow40 = Color(0x40000000);

  /// Shadow 12%
  static const Color shadow1F = Color(0x1F000000);

  /// Shadow 8%
  static const Color shadow14 = Color(0x14000000);
}
