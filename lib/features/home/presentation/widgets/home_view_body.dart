import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/shared_widgets/attempts_badge.dart';
import '../../../../core/utils/assets.dart';
import 'mic_recording_button.dart';
import 'remaining_attempts_bottom_sheet.dart';
import 'upload_audio_button.dart';

/// Main body layout for Home view (Tab 0) matching Figma Frame 4.
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    this.onNavigateToBundles,
  });

  final VoidCallback? onNavigateToBundles;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Home Screen Full Background Image (home_bg.png) taking full height
        Positioned.fill(
          child: Image.asset(
            AppAssets.homeBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // 2. Foreground Main Content
        SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 90.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Header Bar (Notifications, Logo, Profile)
                const AppHeaderBar(),

                // Attempts Counter Badge ("3 محاولات")
                AttemptsBadge(
                  attemptsCount: 3,
                  onTap: () {
                    showRemainingAttemptsBottomSheet(
                      context,
                      remainingAttempts: 3,
                      onDiscoverPackages: onNavigateToBundles,
                    );
                  },
                ),
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
      ],
    );
  }
}
