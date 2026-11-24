import 'package:shared_preferences/shared_preferences.dart';

/// Centralized local persistent storage helper for onboarding flags, auth tokens, and session state.
abstract final class CacheHelper {
  static const String _isOnboardingCompletedKey = 'is_onboarding_completed';
  static const String _isUserLoggedInKey = 'is_user_logged_in';
  static const String _userTokenKey = 'user_token';

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

  /// Saves the user authentication session flag.
  static Future<bool> setUserLoggedIn({bool loggedIn = true}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isUserLoggedInKey, loggedIn);
  }

  /// Checks if a user is currently logged in with a valid cached session.
  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isUserLoggedInKey) ?? false;
  }

  /// Saves the auth token string.
  static Future<bool> setUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userTokenKey, token);
  }

  /// Retrieves the cached auth token.
  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  /// Clears user authentication session data upon logout.
  static Future<bool> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isUserLoggedInKey);
    return prefs.remove(_userTokenKey);
  }
}
