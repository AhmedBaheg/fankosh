import 'package:shared_preferences/shared_preferences.dart';

/// Centralized local persistent storage helper for app settings and first-launch flags.
abstract final class CacheHelper {
  static const String _isOnboardingCompletedKey = 'is_onboarding_completed';

  /// Saves the onboarding completion status flag to local persistent storage.
  static Future<bool> setOnboardingCompleted({bool completed = true}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isOnboardingCompletedKey, completed);
  }

  /// Checks if the user has already completed onboarding on first launch.
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isOnboardingCompletedKey) ?? false;
  }
}
