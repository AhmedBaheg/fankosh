import 'package:flutter/material.dart';

import '../../features/attempts/presentation/views/attempts_exhausted_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/recognition/presentation/views/recognition_processing_view.dart';
import '../../features/recognition/presentation/views/recognition_response_view.dart';
import '../../features/recording/presentation/views/recording_view.dart';
import '../../features/recording_result/presentation/views/recording_result_view.dart';
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
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case Routes.recordingView:
        return MaterialPageRoute(builder: (context) => const RecordingView());
      case Routes.recordingResultView:
        return MaterialPageRoute(
          builder: (context) => const RecordingResultView(),
        );
      case Routes.recognitionProcessingView:
        return MaterialPageRoute(
          builder: (context) => const RecognitionProcessingView(),
        );
      case Routes.recognitionResponseView:
        return MaterialPageRoute(
          builder: (context) => const RecognitionResponseView(),
        );
      case Routes.attemptsExhaustedView:
        return MaterialPageRoute(
          builder: (context) => const AttemptsExhaustedView(),
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
