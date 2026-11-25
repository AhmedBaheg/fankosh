import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Bottom Search Input Bar with cyan searching pill badge matching Figma Page 8:
/// - Blue Searching Badge: width: 74.w, height: 30.h, bg: #43BDFD, text: "جارٍ البحث"
/// - Search Bar: width: 262.w, height: 48.h, pill rounded, shadow: 0px 8px 24px -4px #0000001F
/// - Microphone Button: 36x36, #FEC529, shadow: 0px 1px 2px #0000000D
/// - Placeholder Text: "قول أي حاجة..." in Alexandria 12sp Regular, #807660CC
/// - Upload Audio Button: 18x36 with document upload icon
class BottomSearchInputBar extends StatelessWidget {
  const BottomSearchInputBar({
    super.key,
    this.isSearching = true,
    this.onMicPressed,
    this.onUploadPressed,
  });

  final bool isSearching;
  final VoidCallback? onMicPressed;
  final VoidCallback? onUploadPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final placeholderText = l10n?.homeBubbleLine1.split('...').first ?? 'قول أي حاجة...';
    final searchingText = 'جارٍ البحث';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          // 1. Blue Searching Pill Badge on Right in RTL (width: 74, height: 30, #43BDFD)
          if (isSearching) ...[
            Container(
              width: 74.w,
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.searchingBadgeBlue, // #43BDFD
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Center(
                child: Text(
                  searchingText,
                  style: AppStyles.alexandria(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.background,
                    height: 16.5 / 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],

          // 2. Main Search Input Pill Container (width: 262, height: 48)
          Expanded(
            child: Container(
              height: 48.h,
              constraints: BoxConstraints(maxWidth: 262.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: AppColors.surfaceF2EFE9,
                  width: 1.0,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow1F, // 0px 8px 24px -4px #0000001F
                    blurRadius: 24,
                    spreadRadius: -4,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Microphone Button on Right in RTL (36x36, #FEC529, shadow 0px 1px 2px #0000000D)
                  GestureDetector(
                    onTap: onMicPressed,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.9), // #FEC529 with 0.9 opacity
                        borderRadius: BorderRadius.circular(9999),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadowSubtleBlack, // 0px 1px 2px 0px #0000000D
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.micSymbolIcon,
                          width: 16.w,
                          height: 18.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.textSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // Placeholder Text ("قول أي حاجة...", Alexandria 12sp Regular, #807660CC)
                  Expanded(
                    child: Text(
                      placeholderText.contains('...')
                          ? placeholderText
                          : '$placeholderText...',
                      style: AppStyles.alexandria(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrayBrown.withValues(alpha: 0.8), // #807660CC
                        height: 22 / 12,
                      ),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // Upload Button on Left in RTL (18x36 with ic_document_upload)
                  GestureDetector(
                    onTap: onUploadPressed,
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 28.w,
                      height: 36.h,
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.documentUploadIcon,
                          width: 18.w,
                          height: 22.h,
                          colorFilter: const ColorFilter.mode(
                            AppColors.textMuted,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
