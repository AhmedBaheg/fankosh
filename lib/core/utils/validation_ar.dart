import 'package:flutter/cupertino.dart';

/// Centralized Arabic form validation logic.
class ValidationAr {
  ValidationAr._();

  static String? validateName(String value) {
    if (value.trim().isEmpty) {
      return 'يرجى إدخال الاسم';
    }
    return null;
  }

  static bool _isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    } else if (!_isEmailValid(value.trim())) {
      return 'يرجى إدخال بريد إلكتروني صالح';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    } else if (value.length < 8) {
      return 'كلمة المرور يجب ألا تقل عن 8 أحرف';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String value, {
    TextEditingController? passwordController,
  }) {
    if (value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    } else if (value.length < 8) {
      return 'كلمة المرور يجب ألا تقل عن 8 أحرف';
    } else if (value != passwordController?.text) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    } else if (!_isValidPhoneNumber(value.trim())) {
      return 'يرجى إدخال رقم هاتف صالح';
    }
    return null;
  }

  static bool _isValidPhoneNumber(String phoneNumber) {
    const pattern = r'^[+]?[0-9]{10,13}$';
    return RegExp(pattern).hasMatch(phoneNumber);
  }

  static String? validateDropdown(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى اختيار أحد الخيارات';
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (!RegExp(r'^\d$').hasMatch(value)) {
      return 'يجب أن يكون رقماً';
    }
    return null;
  }
}
