import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';
import 'active_plan_overview_card.dart';
import 'bundles_bottom_action_bar.dart';
import 'selectable_bundle_card.dart';

/// Main body layout for "اختار باقتك" (Select Your Bundle) screen matching Figma:
/// - [AppHeaderBar] (Shared App Header)
/// - Back Button (40x40 circular white button) + Centered Title & Subtitle
/// - Section 1: [ActivePlanOverviewCard] (باقتك الحالية)
/// - Section 2: Header "الباقات المتاحة"
/// - Plan 1: "فانكوش لايت" (199 جنيه شهرياً)
/// - Plan 2: "فانكوش بلس" (350 جنيه) - Selected by default based on current bundle
/// - Bottom Action Button: "متابعة للدفع" with progression arrow
/// - Security Footnote: "دفع إلكتروني آمن ومشفّر 100%"
class BundlesViewBody extends StatefulWidget {
  const BundlesViewBody({
    super.key,
    this.currentPlanName = 'فانكوش بلس',
    this.remainingAttempts = 28,
    this.expiryDate = '15 نوفمبر',
    this.isActive = true,
  });

  final String currentPlanName;
  final int remainingAttempts;
  final String expiryDate;
  final bool isActive;

  @override
  State<BundlesViewBody> createState() => _BundlesViewBodyState();
}

class _BundlesViewBodyState extends State<BundlesViewBody> {
  late String _selectedPlanId;

  // Available plans list
  final List<SubscriptionPlanModel> _plans = const [
    SubscriptionPlanModel(
      id: 'lite',
      title: 'فانكوش لايت',
      price: 199,
      attempts: 20,
      validityDays: 30,
      featureHighlight: '20 محاولة • 30 يوم',
      badgeTag: 'شهرياً',
    ),
    SubscriptionPlanModel(
      id: 'plus',
      title: 'فانكوش بلس',
      price: 350,
      attempts: 40,
      validityDays: 30,
      featureHighlight: '40 محاولة • 30 يوم',
      badgeTag: 'الأكثر اختيارًا',
      isPopular: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Default selection is dependent on current bundle
    _selectedPlanId = widget.currentPlanName.contains('لايت') ? 'lite' : 'plus';
  }

  void _onProceedToPayment() {
    final selectedPlan = _plans.firstWhere(
      (p) => p.id == _selectedPlanId,
      orElse: () => _plans.last,
    );
    Navigator.pushNamed(
      context,
      Routes.reviewSubscriptionView,
      arguments: selectedPlan,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          // Top Header Bar
          const AppHeaderBar(),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Space 28
                  SizedBox(height: 28.h),

                  // Header Section: Back Button (right) + Centered Title & Subtitle
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered Titles
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.chooseYourPlanTitle,
                            style: AppStyles.alexandria(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textHeaderDark,
                              height: 30 / 22,
                              letterSpacing: -0.55,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            l10n.chooseYourPlanSubtitle,
                            style: AppStyles.alexandria(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrayBrown,
                              height: 22 / 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      // Right-aligned Circular Back Button (RTL)
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Navigator.maybePop(context),
                          borderRadius: BorderRadius.circular(9999),
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.borderLightMuted, // #E7E5E4B2
                                width: 1,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(
                                    0x0D000000,
                                  ), // 0px 1px 2px 0px #0000000D
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.chevronRightIcon,
                                width: 16.w,
                                height: 16.h,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.textHeaderDark,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Space 16
                  SizedBox(height: 16.h),

                  // Section 1: Active Plan Card (باقتك الحالية)
                  ActivePlanOverviewCard(
                    planName: widget.currentPlanName,
                    remainingAttempts: widget.remainingAttempts,
                    expiryDate: widget.expiryDate,
                    isActive: widget.isActive,
                  ),

                  // Space 26
                  SizedBox(height: 26.h),

                  // Section 2: Header "الباقات المتاحة"
                  Text(
                    l10n.availablePlansTitle,
                    style: AppStyles.alexandria(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textHeaderDark,
                      height: 26 / 18,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 12.h),

                  // PLAN 1: فانكوش لايت
                  SelectableBundleCard(
                    title: l10n.fankoshLite,
                    subtitle: '20 محاولة • 30 يوم',
                    price: '199',
                    currency: l10n.egpCurrency,
                    billingCycle: l10n.monthly,
                    isSelected: _selectedPlanId == 'lite',
                    onTap: () {
                      setState(() {
                        _selectedPlanId = 'lite';
                      });
                    },
                  ),
                  SizedBox(height: 12.h),

                  // PLAN 2: فانكوش بلس
                  SelectableBundleCard(
                    title: l10n.fankoshPlus,
                    subtitle: '40 محاولة • 30 يوم',
                    price: '350',
                    currency: l10n.egpCurrency,
                    isSelected: _selectedPlanId == 'plus',
                    onTap: () {
                      setState(() {
                        _selectedPlanId = 'plus';
                      });
                    },
                  ),

                  // Bottom padding inside scroll area
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          // Pinned Bottom Section (Button + Security Footnote docked at end of screen)
          BundlesBottomActionBar(
            buttonText: l10n.continueAction,
            securityNoteText: l10n.secureEncryptedPaymentNote,
            onProceed: _onProceedToPayment,
          ),
        ],
      ),
    );
  }
}
