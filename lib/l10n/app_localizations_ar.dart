// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'فانكوش';

  @override
  String get appDescription =>
      'وجهتك الأولى للاستماع إلى أمتع البودكاست والمحتوى الصوتي.';

  @override
  String get next => 'التالي';

  @override
  String get back => 'رجوع';

  @override
  String get skip => 'تخطي';

  @override
  String get done => 'تم';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get save => 'حفظ';

  @override
  String get continueAction => 'متابعة';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get letsStart => 'يلا نبدأ';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get search => 'بحث';

  @override
  String get searchHint => 'ابحث عن برامج، حلقات، أو صناع محتوى...';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get close => 'إغلاق';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get onboarding1Title => 'قول اللي';

  @override
  String get onboarding1Highlight => 'في بالك!';

  @override
  String get onboarding1Subtitle =>
      'قول أي كلام، وفانكوش هيرد عليك بإفيه جامد!';

  @override
  String get onboarding2Title => 'القفشة الحلوة';

  @override
  String get onboarding2Highlight => 'تتشارك!';

  @override
  String get onboarding2Subtitle =>
      'اسمع رد فانكوش وشارك تسجيلك و القفشة مع صحابك !';

  @override
  String get loginTitle => 'نورت فانكوش تاني! 🎬';

  @override
  String get loginSubtitle => 'سجّل دخولك وكمّل قفشاتك.';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'ادخل كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get orContinueWith => 'أو المتابعة من خلال';

  @override
  String get googleSignIn => 'جوجل';

  @override
  String get facebookSignIn => 'فيسبوك';

  @override
  String get appleSignIn => 'أبل';

  @override
  String get dontHaveAccount => 'لسه معندكش حساب؟';

  @override
  String get registerNow => 'إنشاء حساب';

  @override
  String get registerTitle => 'يلا ندخلك جوا القفشات! 🎬';

  @override
  String get registerSubtitle => 'اعمل حسابك وخلي الضحك يبدأ مع فانكوش.';

  @override
  String get nameLabel => 'الاسم';

  @override
  String get nameHint => 'اكتب اسمك';

  @override
  String get countryLabel => 'الدولة';

  @override
  String get countryDefault => 'مصر 🇪🇬';

  @override
  String get createPasswordHint => 'أنشئ كلمة مرور';

  @override
  String get passwordLengthHelper => 'استخدم 8 أحرف على الأقل.';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أنشئ كلمة مرور';

  @override
  String get registerButton => 'إنشاء حساب';

  @override
  String get alreadyHaveAccount => 'عندك حساب بالفعل؟';

  @override
  String get skipNow => 'تخطي الآن';

  @override
  String get plansTitle => 'اختار باقتك وكمّل القفشات! 🎬';

  @override
  String get plansSubtitle =>
      'جرّب فانكوش مجانًا. أو اختار باقتك واستمتع \nبقفشات أكثر!';

  @override
  String get egpCurrency => 'جنيه';

  @override
  String get egpShort => 'جـ';

  @override
  String get bestValueBadge => 'الأوفر';

  @override
  String get mostPopularBadge => 'الأكثر اختيارًا';

  @override
  String get fankoshLite => 'فانكوش لايت';

  @override
  String get fankoshPlus => 'فانكوش بلس';

  @override
  String get fankoshPro => 'فانكوش برو';

  @override
  String get liteFeature => '⚡ بحث أسرع وضحك أكثر';

  @override
  String get plusFeature => '👑⚡ بحث أسرع وإفيهات أكثر';

  @override
  String get proFeature => '⚡ بحث أسرع';

  @override
  String quotaFormat(Object attempts, Object days) {
    return '$attempts محاولة • صالحة لمدة $days يوم';
  }

  @override
  String continueToPayment(Object price) {
    return 'متابعة للدفع ($price ج)';
  }

  @override
  String get tryFankoshFree => 'جرّب فانكوش مجانًا';

  @override
  String get fullNameLabel => 'الاسم الكامل';

  @override
  String get fullNameHint => 'أدخل اسمك بالكامل';

  @override
  String get phoneLabel => 'رقم الهاتف';

  @override
  String get phoneHint => '010xxxxxxxx';

  @override
  String get forgotPasswordTitle => 'استعادة كلمة المرور';

  @override
  String get forgotPasswordSubtitle =>
      'أدخل بريدك الإلكتروني المسجل وسنرسل لك رمز التحقق لإعادة تعيين كلمة المرور.';

  @override
  String get sendCodeButton => 'إرسال رمز التحقق';

  @override
  String get verificationCodeTitle => 'رمز التحقق';

  @override
  String get verificationCodeSubtitle =>
      'أدخل الرمز المكون من 4 أرقام المرسل إلى بريدك الإلكتروني.';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String get verifyButton => 'تأكيد الرمز';

  @override
  String get newPasswordTitle => 'تعيين كلمة مرور جديدة';

  @override
  String get newPasswordSubtitle =>
      'يرجى تعيين كلمة مرور قوية ومختلفة عن كلمات المرور السابقة.';

  @override
  String get newPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get confirmNewPasswordLabel => 'تأكيد كلمة المرور الجديدة';

  @override
  String get resetPasswordButton => 'تغيير كلمة المرور';

  @override
  String get passwordChangedSuccess => 'تم تحديث كلمة المرور بنجاح!';

  @override
  String get tabHome => 'الرئيسية';

  @override
  String get tabExplore => 'استكشف';

  @override
  String get tabLibrary => 'مكتبتي';

  @override
  String get tabProfile => 'حسابي';

  @override
  String get trendingEpisodes => 'الحلقات الرائجة';

  @override
  String get popularPodcasts => 'أشهر البرامج';

  @override
  String get topCreators => 'أبرز صناع المحتوى';

  @override
  String get recentlyPlayed => 'تم الاستماع مؤخراً';

  @override
  String get recommendedForYou => 'مقترح لك';

  @override
  String get episode => 'حلقة';

  @override
  String get episodes => 'حلقات';

  @override
  String get play => 'تشغيل';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get download => 'تحميل';

  @override
  String get share => 'مشاركة';

  @override
  String get comments => 'التعليقات';

  @override
  String get addComment => 'أضف تعليقاً...';

  @override
  String get nowPlaying => 'مشغل الآن';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get helpAndSupport => 'المساعدة والدعم';

  @override
  String get termsAndConditions => 'الشروط والأحكام';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get logoutConfirmation => 'هل أنت متأكد من رغبتك في تسجيل الخروج؟';

  @override
  String get errorOccurred => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get checkInternet => 'يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب.';

  @override
  String get invalidEmail => 'يرجى إدخال بريد إلكتروني صالح.';

  @override
  String get passwordTooShort => 'كلمة المرور يجب ألا تقل عن 8 أحرف.';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين.';
}
