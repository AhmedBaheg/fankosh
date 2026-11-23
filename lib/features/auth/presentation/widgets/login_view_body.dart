import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dont_have_account_row.dart';
import 'login_form.dart';
import 'login_header.dart';

/// Main body layout for the Login screen matching Figma Frame 1 (StatelessWidget).
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 57.h),
          // 1. App Logo & Welcome Headline (Frame 1)
          const LoginHeader(),
          SizedBox(height: 28.h),

          // 2. Login Input Form (Email, Password, Remember Me, Forgot Password, CTA Button)
          const LoginForm(),
          SizedBox(height: 16.h),

          // 3. Navigation Footer ("لسه معندكش حساب؟ إنشاء حساب")
          const DontHaveAccountRow(),
        ],
      ),
    );
  }
}
