import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/utils/assets.dart';
import 'attempts_badge.dart';
import 'custom_bottom_nav_bar.dart';
import 'mic_recording_button.dart';
import 'upload_audio_button.dart';

/// Main body layout for Home view matching Figma Frame 4 (StatelessWidget).
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Home Screen Full Background Image (home_bg.png)
        Image.asset(
          AppAssets.homeBg,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),

        // 2. Foreground Main Content & Floating Bottom Navigation Bar
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Top Header Bar (Notifications, Logo, Profile)
                    const AppHeaderBar(),

                    // Attempts Counter Badge ("3 محاولات")
                    const AttemptsBadge(attemptsCount: 3),
                    SizedBox(height: 16.h),

                    // Hero Speech Bubble Character Sticker (mic_image.png)
                    Image.asset(
                      AppAssets.micImage,
                      width: 284.w,
                      height: 272.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 24.h),

                    // Central Microphone Recording Button & Helper Label
                    const MicRecordingButton(),
                    SizedBox(height: 20.h),

                    // Upload Audio File Action Pill Button
                    const UploadAudioButton(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            // Floating Pill Bottom Navigation Bar (Frame 4)
            const CustomBottomNavBar(currentIndex: 0),
          ],
        ),
      ],
    );
  }
}
