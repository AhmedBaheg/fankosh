import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'already_have_account_row.dart';
import 'register_form.dart';
import 'register_header.dart';

/// Main body layout for the Registration screen matching Figma Frame 2 (StatelessWidget).
class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. App Logo & Headline (Frame 2)
          const RegisterHeader(),
          SizedBox(height: 50.h),

          // 2. Registration Input Form (Name, Email, Country, Password, Confirm Password, CTA Button)
          const RegisterForm(),
          SizedBox(height: 16.h),

          // 3. Navigation Footer ("عندك حساب بالفعل؟ تسجيل الدخول")
          const AlreadyHaveAccountRow(),
        ],
      ),
    );
  }
}
