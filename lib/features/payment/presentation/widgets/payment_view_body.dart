import 'package:fankosh/core/theme/app_text_styles.dart';
import 'package:fankosh/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/app_header_bar.dart';
import '../../data/models/payment_method_model.dart';
import 'payment_bottom_bar.dart';
import 'payment_header_section.dart';
import 'payment_method_card.dart';
import 'payment_plan_summary_card.dart';

/// Main body layout for Payment screen ("اختار طريقة الدفع") matching exact Figma specs.
class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.plan});

  final SubscriptionPlanModel plan;

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  // Default unselected state (Option 1 selected on tap)
  PaymentMethodType? _selectedMethod;

  void _onPayPressed() {
    if (_selectedMethod == PaymentMethodType.bankCard) {
      Navigator.pushNamed(
        context,
        Routes.cardPaymentView,
        arguments: widget.plan,
      );
      return;
    }

    if (_selectedMethod == PaymentMethodType.electronicWallet) {
      Navigator.pushNamed(
        context,
        Routes.walletPaymentView,
        arguments: widget.plan,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Shared App Header Bar (Bell, Logo, Profile)
        const AppHeaderBar(),

        // 2. Scrollable Content Area
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 18.h),

                // 2.1 Header Section (Eyebrow + Back button & Title + Subtitle)
                const PaymentHeaderSection(),

                // space 20
                SizedBox(height: 20.h),

                // 2.2 Selected Plan Summary Card (350x75, padding 14)
                PaymentPlanSummaryCard(plan: widget.plan),

                // Space 20
                SizedBox(height: 20.h),

                // 2.3 Section Heading: "طرق الدفع المتاحة" (Alexandria, 14px, Bold, #1B1C1C)
                Text(
                  'طرق الدفع المتاحة',
                  style: AppStyles.alexandria(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHeaderDark,
                    height: 20 / 14,
                    letterSpacing: 0.14,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 12.h),

                // 2.4 Payment Methods List (350x64 cards)
                Column(
                  children: PaymentMethodModel.defaultMethods.map((method) {
                    final isSelected = _selectedMethod == method.type;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: PaymentMethodCard(
                        method: method,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            _selectedMethod = method.type;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),

        // 3. Bottom Sticky Bar (Total Due & Action CTA button)
        PaymentBottomBar(
          price: widget.plan.price,
          isEnabled: _selectedMethod != null,
          onPayPressed: _onPayPressed,
        ),
      ],
    );
  }
}
