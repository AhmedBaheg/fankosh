import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized typography definitions built using the [GoogleFonts] package.
///
/// Direct Google Fonts implementations:
/// - **Alexandria**: Used for Arabic headings, plan names, button labels, and hero copy.
/// - **Cairo**: Used extensively for Arabic body text, descriptions, lists, counters, and dialogs.
/// - **Noto Sans Arabic**: Used for status bar and system-level elements.
/// - **Inter**: Used for English numerals, badges, and technical specifications (e.g. "HQ • 320kbps").
abstract final class AppTextStyles {
  // ==========================================
  // DISPLAY & HERO STYLES (Alexandria)
  // ==========================================
  /// Main hero title (e.g. Onboarding headlines: "قول اللي في بالك")
  static final TextStyle displayLarge = GoogleFonts.alexandria(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.0,
  );

  /// Splash and greeting title (e.g. "يلا ندخلك جوا القفشات!")
  static final TextStyle displayMedium = GoogleFonts.alexandria(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.30,
    letterSpacing: 0.0,
  );

  /// Hero result headline (e.g. "أييوووه! قفشت الإفيه! 😂")
  static final TextStyle displaySmall = GoogleFonts.alexandria(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.35,
    letterSpacing: 0.0,
  );

  // ==========================================
  // HEADINGS (Alexandria & Cairo)
  // ==========================================
  /// Screen Section Heading (e.g. "اختار باقتك وكمّل الضحك! 🎬")
  static final TextStyle headlineLarge = GoogleFonts.alexandria(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.40,
    letterSpacing: 0.0,
  );

  /// Dialog and Card Heading (e.g. "فانكوش عايز يعرف عيد ميلادك! 🎂")
  static final TextStyle headlineMedium = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.33,
    letterSpacing: 0.0,
  );

  /// Sheet & Summary Sub-heading (e.g. "أحدث العمليات", "بيانات المقطع")
  static final TextStyle headlineSmall = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.40,
    letterSpacing: 0.0,
  );

  // ==========================================
  // TITLES & PLAN HEADINGS (Alexandria)
  // ==========================================
  /// Plan and Feature Title (e.g. "فانكوش بلس", "الباقة المجانية")
  static final TextStyle titleLarge = GoogleFonts.alexandria(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimaryDark,
    height: 1.40,
    letterSpacing: 0.1,
  );

  /// Navigation Bar and Card Header Title (e.g. "حسابي", "باقتي", "الرئيسية")
  static final TextStyle titleMedium = GoogleFonts.alexandria(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.43,
    letterSpacing: 0.1,
  );

  /// Subsection Title (e.g. "إعدادات الأمان والخصوصية")
  static final TextStyle titleSmall = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.43,
    letterSpacing: 0.0,
  );

  // ==========================================
  // SUBTITLES & DESCRIPTIONS (Cairo)
  // ==========================================
  /// Onboarding & Dialog Description (e.g. "قول أي كلام، وفانكوش هيرد عليك بإفيه جامد!")
  static final TextStyle subtitleLarge = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.50,
    letterSpacing: 0.0,
  );

  /// Muted description (e.g. "كل حاجة تخص حسابك في مكان واحد")
  static final TextStyle subtitleMedium = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.46,
    letterSpacing: 0.0,
  );

  /// Feature bullets (e.g. "• صالحة لمدة 30 يوم", "3 محاولات صوتية")
  static final TextStyle subtitleSmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.40,
    letterSpacing: 0.0,
  );

  // ==========================================
  // BODY TEXT (Cairo & Alexandria)
  // ==========================================
  /// Standard Body Text
  static final TextStyle bodyLarge = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.50,
    letterSpacing: 0.0,
  );

  /// Secondary Body Text (e.g. "من الضحك والروقان")
  static final TextStyle bodyMedium = GoogleFonts.alexandria(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.54,
    letterSpacing: 0.0,
  );

  /// Compact Body / List item subtitle
  static final TextStyle bodySmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textTertiary,
    height: 1.33,
    letterSpacing: 0.0,
  );

  /// Extra small helper text (e.g. "+34 إفيه جديد")
  static final TextStyle bodyExtraSmall = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondaryVariant,
    height: 1.27,
    letterSpacing: 0.0,
  );

  // ==========================================
  // BUTTONS & CTA LABELS (Alexandria & Cairo)
  // ==========================================
  /// Primary Large Action Button (e.g. "يلا نبدأ", "تأكيد الاشتراك")
  static final TextStyle buttonLarge = GoogleFonts.alexandria(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: 0.0,
  );

  /// Medium Button (e.g. "أضغط لبدء التسجيل", "يلا نلاقي الإفيه!")
  static final TextStyle buttonMedium = GoogleFonts.alexandria(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.43,
    letterSpacing: 0.0,
  );

  /// Pill button / Secondary action (e.g. "رفع مقطع صوتي", "مش دلوقتي")
  static final TextStyle buttonSecondary = GoogleFonts.alexandria(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.38,
    letterSpacing: 0.0,
  );

  /// Destructive action button (e.g. "تسجيل الخروج", "حذف التسجيل")
  static final TextStyle buttonDestructive = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.error,
    height: 1.43,
    letterSpacing: 0.0,
  );

  // ==========================================
  // ATTEMPT COUNTER & PRICING
  // ==========================================
  /// Attempt Counter in Top Header (e.g. "40 محاولات", "3 محاولات")
  static final TextStyle counterBadge = GoogleFonts.cairo(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.20,
    letterSpacing: 0.0,
  );

  /// Pricing Display Number (e.g. "350")
  static final TextStyle priceValue = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.textPrimary,
    height: 1.20,
    letterSpacing: 0.0,
  );

  /// Currency unit (e.g. "جنيه")
  static final TextStyle priceCurrency = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.30,
    letterSpacing: 0.0,
  );

  // ==========================================
  // CAPTIONS, TIMESTAMPS & BADGES
  // ==========================================
  /// Timestamps (e.g. "10:30 ص", "أمس")
  static final TextStyle captionTimestamp = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.textTertiary,
    height: 1.63,
    letterSpacing: 0.0,
  );

  /// Audio duration ticker (e.g. "00:02")
  static final TextStyle audioTimer = GoogleFonts.cairo(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textTertiary,
    height: 1.0,
    letterSpacing: 0.0,
  );

  /// Audio quality spec (e.g. "HQ • 320kbps")
  static final TextStyle audioQualityBadge = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.textSecondary,
    height: 1.30,
    letterSpacing: 0.0,
  );

  /// Active status tag (e.g. "نشطة")
  static final TextStyle statusActive = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.success,
    height: 1.33,
    letterSpacing: 0.0,
  );

  /// Notification pill unread count (e.g. "+99")
  static final TextStyle notificationBadgeCount = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.textWhite,
    height: 1.50,
    letterSpacing: 0.0,
  );

  // ==========================================
  // BOTTOM NAVIGATION BAR LABELS
  // ==========================================
  /// Active bottom bar label (e.g. "الرئيسية" in blue)
  static final TextStyle navActive = GoogleFonts.alexandria(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: AppColors.secondary,
    height: 1.20,
    letterSpacing: 0.0,
  );

  /// Inactive bottom bar label (e.g. "باقتي", "حسابي" in neutral gray)
  static final TextStyle navInactive = GoogleFonts.alexandria(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.navInactive,
    height: 1.20,
    letterSpacing: 0.0,
  );

  // ==========================================
  // SYSTEM STATUS BAR
  // ==========================================
  /// Top status bar time indicator (e.g. "9:41")
  static final TextStyle statusBar = GoogleFonts.notoSansArabic(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColors.textDarkNeutral,
    height: 1.43,
    letterSpacing: 0.0,
  );
}

/// Convenience extensions for fluent styling
extension AppTextStyleExtensions on TextStyle {
  /// Returns a copy of the style with the given [color]
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Returns a copy of the style with the given [fontSize]
  TextStyle withSize(double fontSize) => copyWith(fontSize: fontSize);

  /// Returns a copy of the style with the given [fontWeight]
  TextStyle withWeight(FontWeight fontWeight) => copyWith(fontWeight: fontWeight);

  /// Returns a copy of the style with the given [letterSpacing]
  TextStyle withSpacing(double letterSpacing) => copyWith(letterSpacing: letterSpacing);

  /// Returns a copy of the style with the given [height]
  TextStyle withHeight(double height) => copyWith(height: height);
}
