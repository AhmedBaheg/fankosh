import 'package:flutter/cupertino.dart';
import 'validation_ar.dart';

/// Centralized locale-aware form validation logic.
class Validation {
  static bool _isArabic(BuildContext? context) {
    if (context == null) return true; // Default to Arabic for Fankosh
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static String? validateName(String value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.validateName(value);
    }
    if (value.trim().isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static bool _isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  static String? validateEmail(String value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.validateEmail(value);
    }
    if (value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!_isEmailValid(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.validatePassword(value);
    }
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String value, {
    TextEditingController? passwordController,
    BuildContext? context,
  }) {
    if (_isArabic(context)) {
      return ValidationAr.validateConfirmPassword(
        value,
        passwordController: passwordController,
      );
    }
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (value != passwordController?.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.validatePhone(value);
    }
    if (value.trim().isEmpty) {
      return 'Please enter your phone number';
    } else if (!_isValidPhoneNumber(value.trim())) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static bool _isValidPhoneNumber(String phoneNumber) {
    const pattern = r'^[+]?[0-9]{10,13}$';
    return RegExp(pattern).hasMatch(phoneNumber);
  }

  static String? validateDropdown(String? value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.validateDropdown(value);
    }
    if (value == null || value.trim().isEmpty) {
      return 'Please select an option';
    }
    return null;
  }

  static String? otpValidator(String? value, [BuildContext? context]) {
    if (_isArabic(context)) {
      return ValidationAr.otpValidator(value);
    }
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^\d$').hasMatch(value)) {
      return 'Must be a digit';
    }
    return null;
  }
}
