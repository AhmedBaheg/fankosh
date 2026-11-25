import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/assets.dart';
import 'subscription_details_card.dart';

/// Main body layout for Payment Success screen ("عاش يا نجم! 🎉") matching exact Figma specs.
class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Shared App Header Bar
        const AppHeaderBar(),

        // 2. Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 8.h),

                // 2.1 Character Celebration Illustration
                Center(
                  child: Image.asset(
                    AppAssets.paymentSuccessCelebration,
                    width: 175.w,
                    height: 175.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 12.h),

                // 2.2 Headline: "عاش يا نجم! 🎉"
                Text(
                  'عاش يا نجم! 🎉',
                  style: AppStyles.alexandria(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 36 / 28,
                    letterSpacing: -0.28,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 8.h),

                // 2.3 Subtitle: "الدفع تم بنجاح، وباقتك اتفعّلت.\nجاهز نكمّل ؟"
                Text(
                  'الدفع تم بنجاح، وباقتك اتفعّلت.\nجاهز نكمّل ؟',
                  style: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 26 / 16,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 32.h),

                // 2.4 Subscription Details Card
                SubscriptionDetailsCard(plan: plan),
                SizedBox(height: 28.h),

                // 2.5 Primary Action Button: "يلا نكمّل قفشات!"
                PrimaryButton(
                  text: 'يلا نكمّل قفشات!',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.homeView,
                      (route) => false,
                    );
                  },
                  height: 52.h,
                  borderRadius: 99999.r,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.textHeaderDark,
                  textStyle: AppStyles.alexandria(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 24 / 16,
                  ),
                ),
                SizedBox(height: 14.h),

                // 2.6 Secondary Action Text: "عرض اشتراكي"
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.bundlesView);
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      child: Text(
                        'عرض اشتراكي',
                        style: AppStyles.alexandria(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textHeaderDark,
                          height: 20 / 14,
                          letterSpacing: 0.14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
