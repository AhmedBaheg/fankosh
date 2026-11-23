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
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    final isOnboardingCompleted = await CacheHelper.isOnboardingCompleted();
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    if (isOnboardingCompleted) {
      Navigator.pushReplacementNamed(context, Routes.loginView);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingView);
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
