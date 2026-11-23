import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/login_view_body.dart';

/// Login view screen for user authentication.
///
/// Corresponds to Figma Frame Node 1:5306 (Login Screen).
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}
