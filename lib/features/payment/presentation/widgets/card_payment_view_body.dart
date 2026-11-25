import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import 'card_details_form.dart';
import 'card_payment_bottom_strip.dart';
import 'card_payment_header_section.dart';
import 'payment_plan_summary_card.dart';
import 'security_information_strip.dart';

/// Main body layout for Card Details Payment screen ("ادخل بيانات بطاقتك").
class CardPaymentViewBody extends StatefulWidget {
  const CardPaymentViewBody({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanModel plan;

  @override
  State<CardPaymentViewBody> createState() => _CardPaymentViewBodyState();
}

class _CardPaymentViewBodyState extends State<CardPaymentViewBody> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Shared App Header Bar
        const AppHeaderBar(),

        SizedBox(height: 24.h),

        // 2. Scrollable Body
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 2.1 Header Section
                const CardPaymentHeaderSection(),
                SizedBox(height: 20.h),

                // 2.2 Reused Plan Summary Card
                PaymentPlanSummaryCard(plan: widget.plan),
                SizedBox(height: 20.h),

                // 2.3 Card Details Form
                const CardDetailsForm(),
                SizedBox(height: 20.h),

                // 2.4 Security Information Strip
                const SecurityInformationStrip(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),

        // 3. Floating Sticky Bottom Payment Strip
        CardPaymentBottomStrip(
          price: widget.plan.price,
          onPayPressed: () {
            Navigator.pushNamed(
              context,
              Routes.paymentSuccessView,
              arguments: widget.plan,
            );
          },
          isLoading: false,
        ),
      ],
    );
  }
}
