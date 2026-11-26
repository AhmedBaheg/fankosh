import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../manager/auth_bloc/auth_bloc.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';
import 'remember_me_and_forgot_password_row.dart';

/// Form component for Login view wired with [AuthBloc].
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
            AuthEventLogin(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          await CacheHelper.setUserLoggedIn(loggedIn: true);
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.subscriptionPlansView);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

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
                isLoading: isLoading,
                hasShadow: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
