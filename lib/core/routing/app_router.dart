import 'package:flutter/material.dart';

import '../../core/models/subscription_plan_model.dart';
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
import '../../features/subscription_plans/presentation/views/bundles_view.dart';
import '../../features/subscription_plans/presentation/views/review_subscription_view.dart';
import '../../features/subscription_plans/presentation/views/subscription_plans_view.dart';
import '../../features/payment/presentation/views/card_payment_view.dart';
import '../../features/payment/presentation/views/payment_success_view.dart';
import '../../features/payment/presentation/views/payment_view.dart';
import '../../features/payment/presentation/views/wallet_payment_view.dart';
import '../../features/my_bundle/data/models/subscription_details_model.dart';
import '../../features/my_bundle/presentation/views/my_bundle_view.dart';
import '../../features/my_bundle/presentation/views/plan_details_view.dart';
import '../../features/profile/presentation/views/edit_profile_view.dart';
import '../../features/profile/presentation/views/notifications_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import 'routes.dart';

/// Centralized route generator following standard Flutter navigation and clean architecture.
abstract final class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OnBoardingView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginView(),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RegisterView(),
        );
      case Routes.subscriptionPlansView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SubscriptionPlansView(),
        );
      case Routes.bundlesView:
        final args = settings.arguments;
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => BundlesView(
              currentPlanName: args['currentPlanName'] ?? 'فانكوش بلس',
              remainingAttempts: args['remainingAttempts'] ?? 28,
              expiryDate: args['expiryDate'] ?? '15 نوفمبر',
              isActive: args['isActive'] ?? true,
            ),
          );
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const BundlesView(),
        );
      case Routes.myBundleView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MyBundleView(),
        );
      case Routes.bundleDetailsView:
        final details = settings.arguments is SubscriptionDetailsModel
            ? settings.arguments as SubscriptionDetailsModel
            : const SubscriptionDetailsModel();
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PlanDetailsView(details: details),
        );
      case Routes.reviewSubscriptionView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ReviewSubscriptionView(
            plan: settings.arguments as SubscriptionPlanModel?,
          ),
        );
      case Routes.paymentView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PaymentView(
            plan: settings.arguments as SubscriptionPlanModel?,
          ),
        );
      case Routes.cardPaymentView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CardPaymentView(
            plan: settings.arguments as SubscriptionPlanModel?,
          ),
        );
      case Routes.walletPaymentView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => WalletPaymentView(
            plan: settings.arguments as SubscriptionPlanModel?,
          ),
        );
      case Routes.paymentSuccessView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PaymentSuccessView(
            plan: settings.arguments as SubscriptionPlanModel?,
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );
      case Routes.recordingView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RecordingView(),
        );
      case Routes.recordingResultView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RecordingResultView(),
        );
      case Routes.recognitionProcessingView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RecognitionProcessingView(),
        );
      case Routes.recognitionResponseView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RecognitionResponseView(),
        );
      case Routes.attemptsExhaustedView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AttemptsExhaustedView(),
        );
      case Routes.profileView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProfileView(),
        );
      case Routes.notificationsView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const NotificationsView(),
        );
      case Routes.editProfileView:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const EditProfileView(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
