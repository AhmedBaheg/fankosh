import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/audio_helper.dart';
import '../../../../l10n/app_localizations.dart';

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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.dialogCardBg, // #F6F5F2
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // Header Row inside card: "صوتك + رد فانكوش" on Right, Duration on Left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mic_none_rounded,
                            size: 15.r,
                            color: AppColors.primaryDark,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '+',
                            style: GoogleFonts.alexandria(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.dialogMutedText,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Icon(
                            Icons.movie_creation_outlined,
                            size: 15.r,
                            color: AppColors.primaryExtraDark,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'صوتك + رد فانكوش',
                            style: GoogleFonts.alexandria(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.dialogMutedText, // #6B6572
                              height: 16 / 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        AudioHelper.formatDuration(combinedDuration), // e.g. "00:27"
                        style: GoogleFonts.alexandria(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.dialogTimestampText, // #9C9484
                          height: 16 / 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Waveform and Play Button Row
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      // Circular yellow play button on Right in RTL
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: SvgPicture.asset(
                              AppAssets.playIcon,
                              width: 12.w,
                              height: 14.h,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryExtraDark, // #815600
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),

                      // Two-tone Waveform (User voice: #815600, Fankoosh response: #FEC529)
                      Expanded(
                        child: SizedBox(
                          height: 34.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                              _dialogWaveformHeights.length,
                              (index) {
                                // First 6 bars: user recording portion (#815600)
                                // Remaining 14 bars: Fankoosh AI response (#FEC529)
                                final isUserVoicePortion = index < 6;
                                final barColor = isUserVoicePortion
                                    ? AppColors.primaryExtraDark // #815600
                                    : AppColors.primary; // #FEC529

                                return Container(
                                  width: 2.8.w,
                                  height: _dialogWaveformHeights[index].h,
                                  decoration: BoxDecoration(
                                    color: barColor,
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),

            // 5. Primary Share Button: "شارك القفشة" in #FEC529 pill
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.primary, // #FEC529
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.shareNodesIcon,
                      width: 18.w,
                      height: 18.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF150E16),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'شارك القفشة',
                      style: GoogleFonts.alexandria(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF150E16),
                        height: 24 / 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // 6. Secondary Cancel Button: "مش دلوقتي" in #F0EFEF pill
            GestureDetector(
              onTap: () => Navigator.pop(context),
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.dialogBtnSecondaryBg, // #F0EFEF
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Center(
                  child: Text(
                    'مش دلوقتي',
                    style: GoogleFonts.alexandria(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dialogMutedText, // #6B6572
                      height: 20 / 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
