import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'mic_permission_dialog.dart';

/// Central interactive microphone recording button component (Figma Frame 4 & Frame 5).
/// Features cross-platform Android/iOS microphone permission dialog flow and icon-only pulsing animation.
class MicRecordingButton extends StatefulWidget {
  const MicRecordingButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  State<MicRecordingButton> createState() => _MicRecordingButtonState();
}

class _MicRecordingButtonState extends State<MicRecordingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  /// Requests microphone permission via custom Frame 5 modal dialog and navigates to recording view.
  Future<void> _handleMicPermissionAndTap() async {
    PermissionStatus status = await Permission.microphone.status;

    if (status.isDenied) {
      if (!mounted) return;
      final allowed = await MicPermissionDialog.show(context);
      if (allowed == true) {
        status = await Permission.microphone.request();
      } else {
        return;
      }
    }

    if (status.isGranted || status.isLimited) {
      if (!mounted) return;
      if (widget.onTap != null) {
        widget.onTap!();
      } else {
        Navigator.pushNamed(context, Routes.recordingView);
      }
    } else if (status.isPermanentlyDenied || status.isRestricted) {
      if (mounted) {
        final allowed = await MicPermissionDialog.show(context);
        if (allowed == true) {
          openAppSettings();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // Static yellow golden mic container with animation on mic icon ONLY
        GestureDetector(
          onTap: _handleMicPermissionAndTap,
          child: Container(
            width: 160.w,
            height: 160.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryLight.withValues(alpha: 0.35),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(alpha: 0.3),
                  blurRadius: 24,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Center(
              // Animation applied to mic icon ONLY
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SvgPicture.asset(
                  AppAssets.icMic,
                  width: 140.w,
                  height: 140.h,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),

        // "أضغط لبدء التسجيل" Helper Label
        Text(
          l10n.tapToRecord,
          style: AppTextStyles.buttonMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
