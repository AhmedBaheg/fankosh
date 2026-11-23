import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/onboarding_page_model.dart';
import 'onboarding_page_item.dart';
import 'onboarding_pagination_dots.dart';

/// Main body widget for the Onboarding screen managing state, PageView, and controls.
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed(int pagesCount) {
    if (_currentIndex < pagesCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onCompleteOnboarding();
    }
  }

  void _onSkipPressed(int pagesCount) {
    if (_currentIndex < pagesCount - 1) {
      _pageController.animateToPage(
        pagesCount - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onCompleteOnboarding();
    }
  }

  Future<void> _onCompleteOnboarding() async {
    await CacheHelper.setOnboardingCompleted(completed: true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.loginView);
  }

  List<OnBoardingPageModel> _getPages(AppLocalizations l10n) {
    return [
      // Frame 22: Screen 1 (Node 1:5373)
      OnBoardingPageModel(
        imagePath: AppAssets.onboard1,
        imageWidth: 345,
        imageHeight: 287,
        title: l10n.onboarding1Title,
        highlightText: l10n.onboarding1Highlight,
        isHighlightFirst: false, // "قول اللي" then "في بالك"
        subtitle: l10n.onboarding1Subtitle,
      ),
      // Frame 23: Screen 2 (Node 1:5407)
      OnBoardingPageModel(
        imagePath: AppAssets.onboard2,
        imageWidth: 360,
        imageHeight: 284,
        title: l10n.onboarding2Title,
        highlightText: l10n.onboarding2Highlight,
        isHighlightFirst: false, // In RTL: "القفشة الحلوة" then "تتشارك"
        subtitle: l10n.onboarding2Subtitle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pages = _getPages(l10n);
    final isLastPage = _currentIndex == pages.length - 1;

    return Column(
      children: [
        // 1. Top Bar: Skip Button (Figma node 1:5385 / 1:5419)
        // Positioned at top-right (x=333, width=41, 16px right margin)
        Padding(
          padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _onSkipPressed(pages.length),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                foregroundColor: AppColors.textSecondary,
                minimumSize: Size(41.w, 29.h),
              ),
              child: Text(
                l10n.skip,
                style: AppTextStyles.buttonSecondary.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),

        // 2. Central PageView carousel
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPageItem(
                model: pages[index],
              );
            },
          ),
        ),

        // 3. Bottom Controls Area: Pagination Dots & CTA Button
        // Pagination Dots Indicator (Figma node 1:5397 / 1:5430)
        OnBoardingPaginationDots(
          currentIndex: _currentIndex,
          count: pages.length,
        ),

        // Spacing between indicators and CTA button matching Figma (169.37 - 135.37 = 34px)
        SizedBox(height: 34.h),

        // Primary Action Button (Figma node 1:5400 / 1:5433)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: PrimaryButton(
            text: isLastPage ? l10n.letsStart : l10n.next,
            onPressed: () => _onNextPressed(pages.length),
            hasArrow: true,
          ),
        ),

        // Bottom padding matching Figma safe area (844 - 806.37 ≈ 38px total screen edge)
        SizedBox(height: 20.h),
      ],
    );
  }
}
