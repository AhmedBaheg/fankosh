import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../l10n/app_localizations.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';
import 'remember_me_and_forgot_password_row.dart';

/// Form component for Login view matching Figma Frame 1 composed of small widgets.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      await CacheHelper.setUserLoggedIn(loggedIn: true);
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, Routes.subscriptionPlansView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Modular Email Field
          EmailTextField(
            controller: _emailController,
          ),
          SizedBox(height: 16.h),

          // 2. Modular Password Field
          PasswordTextField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _onLoginPressed(),
          ),
          SizedBox(height: 16.h),

          // 3. Remember Me & Forgot Password Row
          const RememberMeAndForgotPasswordRow(),
          SizedBox(height: 52.h),

          // 4. Primary Login CTA Button
          PrimaryButton(
            text: l10n.loginButton,
            onPressed: _onLoginPressed,
            icon: AppAssets.icLogin,
            isLoading: _isLoading,
            hasShadow: false,
          ),
        ],
      ),
    );
  }
}
