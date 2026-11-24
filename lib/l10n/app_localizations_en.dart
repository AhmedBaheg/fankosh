// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Fankosh';

  @override
  String get appDescription =>
      'Your premier audio and podcast entertainment destination.';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get skip => 'Skip';

  @override
  String get done => 'Done';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get save => 'Save';

  @override
  String get continueAction => 'Continue';

  @override
  String get getStarted => 'Get Started';

  @override
  String get letsStart => 'Let\'s Start';

  @override
  String get seeAll => 'See All';

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Search podcasts, creators, or episodes...';

  @override
  String get retry => 'Retry';

  @override
  String get close => 'Close';

  @override
  String get loading => 'Loading...';

  @override
  String get onboarding1Title => 'Speak what\'s on';

  @override
  String get onboarding1Highlight => 'your mind';

  @override
  String get onboarding1Subtitle =>
      'Say whatever is on your mind, and Fankosh will hit you back with a hilarious punchline!';

  @override
  String get onboarding2Title => 'the good laughs';

  @override
  String get onboarding2Highlight => 'Share';

  @override
  String get onboarding2Subtitle =>
      'Listen to Fankosh\'s reply and share your recording and laughs with your friends!';

  @override
  String get loginTitle => 'Welcome Back to Fankosh! 🎬';

  @override
  String get loginSubtitle => 'Log in and continue your laughs.';

  @override
  String get emailLabel => 'Email Address';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Log In';

  @override
  String get orContinueWith => 'Or continue with';

  @override
  String get googleSignIn => 'Google';

  @override
  String get facebookSignIn => 'Facebook';

  @override
  String get appleSignIn => 'Apple';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get registerNow => 'Create Account';

  @override
  String get registerTitle => 'Let\'s get you into the laughs! 🎬';

  @override
  String get registerSubtitle =>
      'Create your account and let the fun begin with Fankosh.';

  @override
  String get nameLabel => 'Name';

  @override
  String get nameHint => 'Enter your name';

  @override
  String get countryLabel => 'Country';

  @override
  String get countryDefault => 'Egypt 🇪🇬';

  @override
  String get createPasswordHint => 'Create a password';

  @override
  String get passwordLengthHelper => 'Use at least 8 characters.';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Create a password';

  @override
  String get registerButton => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get skipNow => 'Skip Now';

  @override
  String get plansTitle => 'Choose your plan & keep laughing! 🎬';

  @override
  String get plansSubtitle =>
      'Try Fankosh for free, or choose a plan and enjoy more jokes!';

  @override
  String get egpCurrency => 'EGP';

  @override
  String get egpShort => 'EGP';

  @override
  String get bestValueBadge => 'Best Value';

  @override
  String get mostPopularBadge => 'Most Popular';

  @override
  String get fankoshLite => 'Fankosh Lite';

  @override
  String get fankoshPlus => 'Fankosh Plus';

  @override
  String get fankoshPro => 'Fankosh Pro';

  @override
  String get liteFeature => '⚡ Faster search & more laughs';

  @override
  String get plusFeature => '👑⚡ Faster search & top punchlines';

  @override
  String get proFeature => '⚡ Faster search';

  @override
  String quotaFormat(Object attempts, Object days) {
    return '$attempts attempts • Valid for $days days';
  }

  @override
  String continueToPayment(Object price) {
    return 'Continue to Pay ($price EGP)';
  }

  @override
  String get tryFankoshFree => 'Try Fankosh for Free';

  @override
  String attemptsCount(Object count) {
    return '$count Attempts';
  }

  @override
  String get homeBubbleLine1 => 'Say anything... Fankosh';

  @override
  String get homeBubbleLine2 => 'will reply with a punchline! 😂';

  @override
  String get tapToRecord => 'Tap to start recording';

  @override
  String get orUploadAudio => 'Or upload an audio clip';

  @override
  String get tabPackages => 'Plans';

  @override
  String get micPermissionTitle => 'We want to hear you';

  @override
  String get micPermissionSubtitle =>
      'The app needs microphone permission so you can record the punchline you remember and bring it up in a second.';

  @override
  String get allowAccess => 'Allow';

  @override
  String get notNow => 'Not Now';

  @override
  String get recordingTitleLine1 => 'Say what\'s on your mind..';

  @override
  String get recordingTitleLine2 => 'We are listening!';

  @override
  String get recordingInProgress => 'Recording in progress...';

  @override
  String get tapToStopRecording => 'Tap to stop recording';

  @override
  String maxRecordingDuration(Object seconds) {
    return 'Max recording duration: $seconds seconds';
  }

  @override
  String get recordingResultTitle => 'This is your recording!';

  @override
  String get recordingResultSubtitle =>
      'Listen to it, or record again if you like';

  @override
  String get deleteRecording => 'Delete Recording';

  @override
  String get recordAgain => 'Record Again';

  @override
  String get findPunchline => 'Let\'s find the punchline!';

  @override
  String get processingTitle => 'Fankosh is preparing your reply! 🍿';

  @override
  String get smartFankoshBadge => 'Smart Fankosh ✨';

  @override
  String get recognizingStatus => 'Recognizing';

  @override
  String get waitTitle => 'Hold on..';

  @override
  String get preparingReplySubtitle => 'Preparing a awesome reply for you! 🎬';

  @override
  String get searchingForPunchline => 'Searching for the right punchline..';

  @override
  String get searchingStatus => 'Searching';

  @override
  String get foundPunchlineTitle => 'Yesss! Caught the punchline! 😍';

  @override
  String get listenToThisSubtitle => 'Wait for it... Listen to this! 😂';

  @override
  String get takePunchlineHere => 'Take this punchline with you! 🎧';

  @override
  String get shareDialogTitle => 'Did you like Fankosh\'s reply? 😂';

  @override
  String get shareDialogSubtitle =>
      'Share your voice and Fankosh\'s reply with your friends!';

  @override
  String get yourVoiceAndFankosh => 'Your voice + Fankosh reply';

  @override
  String get sharePunchline => 'Share Punchline';

  @override
  String get attemptsExhaustedTitle => 'Free punchlines are over!';

  @override
  String get attemptsExhaustedSubtitle1 =>
      'But we still have plenty of laughs!';

  @override
  String get attemptsExhaustedSubtitle2 =>
      'Choose your plan and keep going with Fankosh.';

  @override
  String get benefitContinuedLaughs => 'Non-stop Laughs';

  @override
  String get benefitMoreAttempts => 'More Attempts';

  @override
  String get benefitMorePunchlines => 'More Punchlines';

  @override
  String get explorePlans => 'Explore Plans';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'Enter your full name';

  @override
  String get phoneLabel => 'Phone Number';

  @override
  String get phoneHint => '010xxxxxxxx';

  @override
  String get forgotPasswordTitle => 'Reset Password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your registered email address to receive a verification code.';

  @override
  String get sendCodeButton => 'Send Verification Code';

  @override
  String get verificationCodeTitle => 'Verification Code';

  @override
  String get verificationCodeSubtitle =>
      'Enter the 4-digit code sent to your email.';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get verifyButton => 'Verify Code';

  @override
  String get newPasswordTitle => 'Set New Password';

  @override
  String get newPasswordSubtitle =>
      'Please enter a strong new password different from previous passwords.';

  @override
  String get newPasswordLabel => 'New Password';

  @override
  String get confirmNewPasswordLabel => 'Confirm New Password';

  @override
  String get resetPasswordButton => 'Change Password';

  @override
  String get passwordChangedSuccess => 'Password updated successfully!';

  @override
  String get tabHome => 'Home';

  @override
  String get tabExplore => 'Explore';

  @override
  String get tabLibrary => 'My Library';

  @override
  String get tabProfile => 'Profile';

  @override
  String get trendingEpisodes => 'Trending Episodes';

  @override
  String get popularPodcasts => 'Popular Podcasts';

  @override
  String get topCreators => 'Top Creators';

  @override
  String get recentlyPlayed => 'Recently Played';

  @override
  String get recommendedForYou => 'Recommended For You';

  @override
  String get episode => 'Episode';

  @override
  String get episodes => 'Episodes';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get download => 'Download';

  @override
  String get share => 'Share';

  @override
  String get comments => 'Comments';

  @override
  String get addComment => 'Write a comment...';

  @override
  String get nowPlaying => 'Now Playing';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get notifications => 'Notifications';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get helpAndSupport => 'Help & Support';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get logout => 'Log Out';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';
}
