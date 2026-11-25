import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/audio_helper.dart';

/// Inner audio preview card for the share response dialog matching Page 11 design.
class ShareAudioPreviewCard extends StatelessWidget {
  const ShareAudioPreviewCard({
    super.key,
    required this.combinedDurationSeconds,
    required this.waveformHeights,
  });

  final int combinedDurationSeconds;
  final List<double> waveformHeights;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.dialogCardBg,
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
                    style: AppStyles.alexandria(
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
                    style: AppStyles.alexandria(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.dialogMutedText,
                      height: 16 / 12,
                    ),
                  ),
                ],
              ),
              Text(
                AudioHelper.formatDuration(combinedDurationSeconds),
                style: AppStyles.alexandria(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dialogTimestampText,
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
                        AppColors.primaryExtraDark,
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
                      waveformHeights.length,
                      (index) {
                        final isUserVoicePortion = index < 6;
                        final barColor = isUserVoicePortion
                            ? AppColors.primaryExtraDark
                            : AppColors.primary;

                        return Container(
                          width: 2.8.w,
                          height: waveformHeights[index].h,
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
    );
  }
}
