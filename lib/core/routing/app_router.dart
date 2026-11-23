import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/subscription_plans/presentation/views/subscription_plans_view.dart';
import 'routes.dart';

/// Centralized route generator following standard Flutter navigation and clean architecture.
abstract final class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.subscriptionPlansView:
        return MaterialPageRoute(
          builder: (context) => const SubscriptionPlansView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
