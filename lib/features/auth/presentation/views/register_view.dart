import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/register_view_body.dart';

/// Register view screen for new user account creation.
///
/// Corresponds to Figma Frame Page 2 (Registration Screen).
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RegisterViewBody(),
      ),
    );
  }
}
