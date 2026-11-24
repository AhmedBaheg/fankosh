import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/cache_helper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    // Do not redirect if SplashView is not the top-most visible route
    final isCurrent = ModalRoute.of(context)?.isCurrent ?? true;
    if (!isCurrent) return;

    final isOnboardingCompleted = await CacheHelper.isOnboardingCompleted();
    final isUserLoggedIn = await CacheHelper.isUserLoggedIn();

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    // Check again before navigating
    final isStillCurrent = ModalRoute.of(context)?.isCurrent ?? true;
    if (!isStillCurrent) return;

    if (!isOnboardingCompleted) {
      // 1. First time app open -> Onboarding
      Navigator.pushReplacementNamed(context, Routes.onBoardingView);
    } else if (isUserLoggedIn) {
      // 2. User logged in & session cached -> HomeView
      Navigator.pushReplacementNamed(context, Routes.homeView);
    } else {
      // 3. Onboarding completed but not logged in -> LoginView
      Navigator.pushReplacementNamed(context, Routes.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Splash background artwork
        Image.asset(
          AppAssets.splachBg,
          width: 1.sw,
          height: 1.sh,
          fit: BoxFit.cover,
        ),

        // 2. App Logo positioned responsively according to Figma (top: 222 on 844h)
        Positioned(
          top: 222.h,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              AppAssets.logoApp,
              width: 286.w,
              height: 113.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
