import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../l10n/app_localizations.dart';
import 'confirm_password_text_field.dart';
import 'country_dropdown.dart';
import 'email_text_field.dart';
import 'name_text_field.dart';
import 'password_text_field.dart';

/// Form component for Registration view composed of small widgets.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacementNamed(context, Routes.subscriptionPlansView);
      });
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
          // 1. Modular Name Input
          NameTextField(
            controller: _nameController,
          ),
          SizedBox(height: 16.h),

          // 2. Modular Email Input
          EmailTextField(
            controller: _emailController,
          ),
          SizedBox(height: 16.h),

          // 3. Modular Country Selector Dropdown
          const CountryDropdown(),
          SizedBox(height: 16.h),

          // 4. Modular Password Input
          PasswordTextField(
            controller: _passwordController,
            label: l10n.passwordLabel,
            hintText: l10n.createPasswordHint,
            helperText: l10n.passwordLengthHelper,
          ),
          SizedBox(height: 16.h),

          // 5. Modular Confirm Password Input
          ConfirmPasswordTextField(
            controller: _confirmPasswordController,
            passwordController: _passwordController,
            onFieldSubmitted: (_) => _onRegisterPressed(),
          ),
          SizedBox(height: 54.h),

          // 6. Register Primary CTA Button
          PrimaryButton(
            text: l10n.registerButton,
            onPressed: _onRegisterPressed,
            hasArrow: true,
            isLoading: _isLoading,
            hasShadow: false,
          ),
        ],
      ),
    );
  }
}
