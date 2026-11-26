import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../manager/auth_bloc/auth_bloc.dart';
import '../widgets/login_view_body.dart';

/// Login view screen providing [AuthBloc] for authentication.
///
/// Corresponds to Figma Frame Node 1:5306 (Login Screen).
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
