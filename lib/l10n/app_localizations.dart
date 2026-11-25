import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Fankosh'**
  String get appName;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Your premier audio and podcast entertainment destination.'**
  String get appDescription;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get letsStart;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search podcasts, creators, or episodes...'**
  String get searchHint;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Speak what\'s on'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Highlight.
  ///
  /// In en, this message translates to:
  /// **'your mind'**
  String get onboarding1Highlight;

  /// No description provided for @onboarding1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Say whatever is on your mind, and Fankosh will hit you back with a hilarious punchline!'**
  String get onboarding1Subtitle;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'the good laughs'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Highlight.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get onboarding2Highlight;

  /// No description provided for @onboarding2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Listen to Fankosh\'s reply and share your recording and laughs with your friends!'**
  String get onboarding2Subtitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back to Fankosh! 🎬'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in and continue your laughs.'**
  String get loginSubtitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get passwordHint;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginButton;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// No description provided for @googleSignIn.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get googleSignIn;

  /// No description provided for @facebookSignIn.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookSignIn;

  /// No description provided for @appleSignIn.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get appleSignIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerNow;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get you into the laughs! 🎬'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account and let the fun begin with Fankosh.'**
  String get registerSubtitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// No description provided for @countryLabel.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryLabel;

  /// No description provided for @countryDefault.
  ///
  /// In en, this message translates to:
  /// **'Egypt 🇪🇬'**
  String get countryDefault;

  /// No description provided for @createPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createPasswordHint;

  /// No description provided for @passwordLengthHelper.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters.'**
  String get passwordLengthHelper;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get confirmPasswordHint;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerButton;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @skipNow.
  ///
  /// In en, this message translates to:
  /// **'Skip Now'**
  String get skipNow;

  /// No description provided for @plansTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your plan & keep laughing! 🎬'**
  String get plansTitle;

  /// No description provided for @plansSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try Fankosh for free, or choose a plan and enjoy more jokes!'**
  String get plansSubtitle;

  /// No description provided for @egpCurrency.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egpCurrency;

  /// No description provided for @egpShort.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egpShort;

  /// No description provided for @bestValueBadge.
  ///
  /// In en, this message translates to:
  /// **'Best Value'**
  String get bestValueBadge;

  /// No description provided for @mostPopularBadge.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopularBadge;

  /// No description provided for @fankoshLite.
  ///
  /// In en, this message translates to:
  /// **'Fankosh Lite'**
  String get fankoshLite;

  /// No description provided for @fankoshPlus.
  ///
  /// In en, this message translates to:
  /// **'Fankosh Plus'**
  String get fankoshPlus;

  /// No description provided for @fankoshPro.
  ///
  /// In en, this message translates to:
  /// **'Fankosh Pro'**
  String get fankoshPro;

  /// No description provided for @liteFeature.
  ///
  /// In en, this message translates to:
  /// **'⚡ Faster search & more laughs'**
  String get liteFeature;

  /// No description provided for @plusFeature.
  ///
  /// In en, this message translates to:
  /// **'👑⚡ Faster search & top punchlines'**
  String get plusFeature;

  /// No description provided for @proFeature.
  ///
  /// In en, this message translates to:
  /// **'⚡ Faster search'**
  String get proFeature;

  /// No description provided for @quotaFormat.
  ///
  /// In en, this message translates to:
  /// **'{attempts} attempts • Valid for {days} days'**
  String quotaFormat(Object attempts, Object days);

  /// No description provided for @continueToPayment.
  ///
  /// In en, this message translates to:
  /// **'Continue to Pay ({price} EGP)'**
  String continueToPayment(Object price);

  /// No description provided for @tryFankoshFree.
  ///
  /// In en, this message translates to:
  /// **'Try Fankosh for Free'**
  String get tryFankoshFree;

  /// No description provided for @attemptsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Attempts'**
  String attemptsCount(Object count);

  /// No description provided for @homeBubbleLine1.
  ///
  /// In en, this message translates to:
  /// **'Say anything... Fankosh'**
  String get homeBubbleLine1;

  /// No description provided for @homeBubbleLine2.
  ///
  /// In en, this message translates to:
  /// **'will reply with a punchline! 😂'**
  String get homeBubbleLine2;

  /// No description provided for @tapToRecord.
  ///
  /// In en, this message translates to:
  /// **'Tap to start recording'**
  String get tapToRecord;

  /// No description provided for @orUploadAudio.
  ///
  /// In en, this message translates to:
  /// **'Or upload an audio clip'**
  String get orUploadAudio;

  /// No description provided for @tabPackages.
  ///
  /// In en, this message translates to:
  /// **'Plans'**
  String get tabPackages;

  /// No description provided for @micPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'We want to hear you'**
  String get micPermissionTitle;

  /// No description provided for @micPermissionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The app needs microphone permission so you can record the punchline you remember and bring it up in a second.'**
  String get micPermissionSubtitle;

  /// No description provided for @allowAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allowAccess;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @recordingTitleLine1.
  ///
  /// In en, this message translates to:
  /// **'Say what\'s on your mind..'**
  String get recordingTitleLine1;

  /// No description provided for @recordingTitleLine2.
  ///
  /// In en, this message translates to:
  /// **'We are listening!'**
  String get recordingTitleLine2;

  /// No description provided for @recordingInProgress.
  ///
  /// In en, this message translates to:
  /// **'Recording in progress...'**
  String get recordingInProgress;

  /// No description provided for @tapToStopRecording.
  ///
  /// In en, this message translates to:
  /// **'Tap to stop recording'**
  String get tapToStopRecording;

  /// No description provided for @maxRecordingDuration.
  ///
  /// In en, this message translates to:
  /// **'Max recording duration: {seconds} seconds'**
  String maxRecordingDuration(Object seconds);

  /// No description provided for @recordingResultTitle.
  ///
  /// In en, this message translates to:
  /// **'This is your recording!'**
  String get recordingResultTitle;

  /// No description provided for @recordingResultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Listen to it, or record again if you like'**
  String get recordingResultSubtitle;

  /// No description provided for @deleteRecording.
  ///
  /// In en, this message translates to:
  /// **'Delete Recording'**
  String get deleteRecording;

  /// No description provided for @recordAgain.
  ///
  /// In en, this message translates to:
  /// **'Record Again'**
  String get recordAgain;

  /// No description provided for @findPunchline.
  ///
  /// In en, this message translates to:
  /// **'Let\'s find the punchline!'**
  String get findPunchline;

  /// No description provided for @processingTitle.
  ///
  /// In en, this message translates to:
  /// **'Fankosh is preparing your reply! 🍿'**
  String get processingTitle;

  /// No description provided for @smartFankoshBadge.
  ///
  /// In en, this message translates to:
  /// **'Smart Fankosh ✨'**
  String get smartFankoshBadge;

  /// No description provided for @recognizingStatus.
  ///
  /// In en, this message translates to:
  /// **'Recognizing'**
  String get recognizingStatus;

  /// No description provided for @waitTitle.
  ///
  /// In en, this message translates to:
  /// **'Hold on..'**
  String get waitTitle;

  /// No description provided for @preparingReplySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Preparing a awesome reply for you! 🎬'**
  String get preparingReplySubtitle;

  /// No description provided for @searchingForPunchline.
  ///
  /// In en, this message translates to:
  /// **'Searching for the right punchline..'**
  String get searchingForPunchline;

  /// No description provided for @searchingStatus.
  ///
  /// In en, this message translates to:
  /// **'Searching'**
  String get searchingStatus;

  /// No description provided for @foundPunchlineTitle.
  ///
  /// In en, this message translates to:
  /// **'Yesss! Caught the punchline! 😍'**
  String get foundPunchlineTitle;

  /// No description provided for @listenToThisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Wait for it... Listen to this! 😂'**
  String get listenToThisSubtitle;

  /// No description provided for @takePunchlineHere.
  ///
  /// In en, this message translates to:
  /// **'Take this punchline with you! 🎧'**
  String get takePunchlineHere;

  /// No description provided for @shareDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Did you like Fankosh\'s reply? 😂'**
  String get shareDialogTitle;

  /// No description provided for @shareDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share your voice and Fankosh\'s reply with your friends!'**
  String get shareDialogSubtitle;

  /// No description provided for @yourVoiceAndFankosh.
  ///
  /// In en, this message translates to:
  /// **'Your voice + Fankosh reply'**
  String get yourVoiceAndFankosh;

  /// No description provided for @sharePunchline.
  ///
  /// In en, this message translates to:
  /// **'Share Punchline'**
  String get sharePunchline;

  /// No description provided for @attemptsExhaustedTitle.
  ///
  /// In en, this message translates to:
  /// **'Free punchlines are over!'**
  String get attemptsExhaustedTitle;

  /// No description provided for @attemptsExhaustedSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'But we still have plenty of laughs!'**
  String get attemptsExhaustedSubtitle1;

  /// No description provided for @attemptsExhaustedSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Choose your plan and keep going with Fankosh.'**
  String get attemptsExhaustedSubtitle2;

  /// No description provided for @benefitContinuedLaughs.
  ///
  /// In en, this message translates to:
  /// **'Non-stop Laughs'**
  String get benefitContinuedLaughs;

  /// No description provided for @benefitMoreAttempts.
  ///
  /// In en, this message translates to:
  /// **'More Attempts'**
  String get benefitMoreAttempts;

  /// No description provided for @benefitMorePunchlines.
  ///
  /// In en, this message translates to:
  /// **'More Punchlines'**
  String get benefitMorePunchlines;

  /// No description provided for @explorePlans.
  ///
  /// In en, this message translates to:
  /// **'Explore Plans'**
  String get explorePlans;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get fullNameHint;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'010xxxxxxxx'**
  String get phoneHint;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email address to receive a verification code.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @sendCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendCodeButton;

  /// No description provided for @verificationCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCodeTitle;

  /// No description provided for @verificationCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the 4-digit code sent to your email.'**
  String get verificationCodeSubtitle;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @verifyButton.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyButton;

  /// No description provided for @newPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get newPasswordTitle;

  /// No description provided for @newPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a strong new password different from previous passwords.'**
  String get newPasswordSubtitle;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @confirmNewPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPasswordLabel;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get resetPasswordButton;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully!'**
  String get passwordChangedSuccess;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get tabExplore;

  /// No description provided for @tabLibrary.
  ///
  /// In en, this message translates to:
  /// **'My Library'**
  String get tabLibrary;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @trendingEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Trending Episodes'**
  String get trendingEpisodes;

  /// No description provided for @popularPodcasts.
  ///
  /// In en, this message translates to:
  /// **'Popular Podcasts'**
  String get popularPodcasts;

  /// No description provided for @topCreators.
  ///
  /// In en, this message translates to:
  /// **'Top Creators'**
  String get topCreators;

  /// No description provided for @recentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Recently Played'**
  String get recentlyPlayed;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended For You'**
  String get recommendedForYou;

  /// No description provided for @episode.
  ///
  /// In en, this message translates to:
  /// **'Episode'**
  String get episode;

  /// No description provided for @episodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @addComment.
  ///
  /// In en, this message translates to:
  /// **'Write a comment...'**
  String get addComment;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get nowPlaying;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @helpAndSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupport;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @profileHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything about your account in one place'**
  String get profileHeaderSubtitle;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @mySubscriptionPrefix.
  ///
  /// In en, this message translates to:
  /// **'My Subscription:'**
  String get mySubscriptionPrefix;

  /// No description provided for @viewMyPlan.
  ///
  /// In en, this message translates to:
  /// **'View My Plan'**
  String get viewMyPlan;

  /// No description provided for @attemptsRemainingThisMonth.
  ///
  /// In en, this message translates to:
  /// **'attempts remaining this month'**
  String get attemptsRemainingThisMonth;

  /// No description provided for @settingsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsSectionTitle;

  /// No description provided for @birthDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthDateTitle;

  /// No description provided for @addBirthDateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your birth date'**
  String get addBirthDateSubtitle;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Fankosh notifications'**
  String get notificationsSubtitle;

  /// No description provided for @countryTitle.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get countryTitle;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @privacyAndSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get privacyAndSecurityTitle;

  /// No description provided for @privacyAndSecuritySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Security and privacy settings'**
  String get privacyAndSecuritySubtitle;

  /// No description provided for @helpAndSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Need help? We are here'**
  String get helpAndSupportSubtitle;

  /// No description provided for @aboutFankoshTitle.
  ///
  /// In en, this message translates to:
  /// **'About Fankosh'**
  String get aboutFankoshTitle;

  /// No description provided for @aboutFankoshSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App information & version 1.4'**
  String get aboutFankoshSubtitle;

  /// No description provided for @chooseCountryTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your country 🌍'**
  String get chooseCountryTitle;

  /// No description provided for @chooseCountrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the country you use Fankosh from.'**
  String get chooseCountrySubtitle;

  /// No description provided for @searchCountryHint.
  ///
  /// In en, this message translates to:
  /// **'Search country...'**
  String get searchCountryHint;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @chooseLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguageTitle;

  /// No description provided for @chooseLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select application display language.'**
  String get chooseLanguageSubtitle;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @planActivatedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your plan is active! 🎉'**
  String get planActivatedTitle;

  /// No description provided for @planActivatedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your subscription is ready... let\'s keep the laughs rolling!'**
  String get planActivatedSubtitle;

  /// No description provided for @attemptsRunningLowTitle.
  ///
  /// In en, this message translates to:
  /// **'Your attempts are running low!'**
  String get attemptsRunningLowTitle;

  /// No description provided for @attemptsRunningLowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only 2 attempts left!'**
  String get attemptsRunningLowSubtitle;

  /// No description provided for @tapToChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Tap to change photo'**
  String get tapToChangePhoto;

  /// No description provided for @birthDatePrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We only use your birthday to celebrate your special day.'**
  String get birthDatePrivacyNote;

  /// No description provided for @planDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan Details'**
  String get planDetailsTitle;

  /// No description provided for @planDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Everything about your current subscription'**
  String get planDetailsSubtitle;

  /// No description provided for @attemptsBalanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Attempts Balance'**
  String get attemptsBalanceTitle;

  /// No description provided for @attemptsRemainingOutOf.
  ///
  /// In en, this message translates to:
  /// **'attempts remaining out of'**
  String get attemptsRemainingOutOf;

  /// No description provided for @useAttemptsBeforeExpiry.
  ///
  /// In en, this message translates to:
  /// **'Use your attempts before plan expiry.'**
  String get useAttemptsBeforeExpiry;

  /// No description provided for @activationDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Activation Date'**
  String get activationDateTitle;

  /// No description provided for @expiryDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDateTitle;

  /// No description provided for @planDurationTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan Duration'**
  String get planDurationTitle;

  /// No description provided for @paidAmountTitle.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get paidAmountTitle;

  /// No description provided for @renewOrChangePlan.
  ///
  /// In en, this message translates to:
  /// **'Renew or Change Plan'**
  String get renewOrChangePlan;

  /// No description provided for @activeBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeBadge;

  /// No description provided for @chooseYourPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Plan'**
  String get chooseYourPlanTitle;

  /// No description provided for @chooseYourPlanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your laughs going with the right plan'**
  String get chooseYourPlanSubtitle;

  /// No description provided for @currentPlanBadge.
  ///
  /// In en, this message translates to:
  /// **'Your Current Plan'**
  String get currentPlanBadge;

  /// No description provided for @expiresOnPrefix.
  ///
  /// In en, this message translates to:
  /// **'Expires on'**
  String get expiresOnPrefix;

  /// No description provided for @availablePlansTitle.
  ///
  /// In en, this message translates to:
  /// **'Available Plans'**
  String get availablePlansTitle;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @secureEncryptedPaymentNote.
  ///
  /// In en, this message translates to:
  /// **'100% Secure & Encrypted Payment'**
  String get secureEncryptedPaymentNote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
