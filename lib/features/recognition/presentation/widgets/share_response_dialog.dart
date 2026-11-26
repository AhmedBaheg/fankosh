import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'share_audio_preview_card.dart';
import 'share_dialog_action_buttons.dart';

/// Modal dialog component for sharing AI punchline matching Page 11 design:
/// - Dimensions: width: 325.w, minHeight: 445.5.h, borderRadius: 24.r, shadow: 0px 25px 50px -12px #00000040
/// - Top Center: Share circular badge (#FEF0CE) with dark gold share icon (#815600)
/// - Top Left: Circular close button with gray 'x' icon
/// - Title: "عجبك رد فانكوش؟ 😂" in Alexandria 20sp Bold, #150E16
/// - Subtitle: "شارك كلامك ورد فانكوش مع صحابك!" in Alexandria 14sp Regular, #4A454E
/// - Inner Card: bg: #F6F5F2, "صوتك + رد فانكوش" (#6B6572), total duration (#9C9484), two-tone waveform
/// - Primary Button: "شارك القفشة" in Alexandria 16sp Bold, #150E16 with share icon inside #FEC529 pill
/// - Secondary Button: "مش دلوقتي" in Alexandria 14sp SemiBold, #6B6572 inside #F0EFEF pill
class ShareResponseDialog extends StatelessWidget {
  const ShareResponseDialog({
    super.key,
    this.userRecordingSeconds = 5,
    this.responseAudioSeconds = 22,
  });

  final int userRecordingSeconds;
  final int responseAudioSeconds;

  static const List<double> _dialogWaveformHeights = [
    12, 22, 10, 18, 26, 14, 18, 28, 22, 16, 26, 32, 20, 28, 22, 32, 28, 18, 24, 16,
  ];

  static Future<void> show(
    BuildContext context, {
    int userRecordingSeconds = 5,
    int responseAudioSeconds = 22,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: ShareResponseDialog(
          userRecordingSeconds: userRecordingSeconds,
          responseAudioSeconds: responseAudioSeconds,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final titleText = l10n?.shareDialogTitle ?? 'عجبك رد فانكوش؟ 😂';
    final subtitleText = l10n?.shareDialogSubtitle ?? 'شارك كلامك ورد فانكوش مع\nصحابك!';
    final combinedDuration = userRecordingSeconds + responseAudioSeconds;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 325.w,
        constraints: BoxConstraints(minHeight: 445.5.h, maxWidth: 325.w),
        padding: EdgeInsets.only(
          top: 14.h,
          right: 18.w,
          bottom: 20.h,
          left: 18.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000), // 0px 25px 50px -12px #00000040
              blurRadius: 50,
              spreadRadius: -12,
              offset: Offset(0, 25),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 1. Top Row: Close Button on Left & Circular Share Icon in Center
            Stack(
              alignment: Alignment.center,
              children: [
                // Top-Left circular close button
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEFEFEF),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          size: 16.r,
                          color: AppColors.dialogMutedText,
                        ),
                      ),
                    ),
                  ),
                ),

                // Top-Center circular soft-yellow share badge
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFEF0CE), // Soft cream/yellow
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.shareNodesIcon,
                      width: 22.w,
                      height: 22.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryExtraDark, // #815600
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // 2. Dialog Title: "عجبك رد فانكوش؟ 😂" (Alexandria 20sp Bold, #150E16)
            Text(
              titleText,
              style: GoogleFonts.alexandria(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF150E16),
                height: 28 / 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6.h),

            // 3. Dialog Subtitle: "شارك كلامك ورد فانكوش مع صحابك!" (Alexandria 14sp Regular, #4A454E)
            Text(
              subtitleText,
              style: GoogleFonts.alexandria(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.dialogSubtitleText,
                height: 22.75 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),

            // 4. Inner Audio Preview Card (bg: #F6F5F2)
            ShareAudioPreviewCard(
              combinedDurationSeconds: combinedDuration,
              waveformHeights: _dialogWaveformHeights,
            ),
            SizedBox(height: 18.h),

            // 5. Action Buttons ("شارك القفشة" & "مش دلوقتي")
            ShareDialogActionButtons(
              onSharePressed: () => Navigator.pop(context),
              onCancelPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
