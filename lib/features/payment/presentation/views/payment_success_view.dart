import 'package:flutter/material.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/payment_success_view_body.dart';

/// Screen view displayed upon successful payment completion ("عاش يا نجم! 🎉").
class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({
    super.key,
    this.plan,
  });

  final SubscriptionPlanModel? plan;

  static const defaultPlan = SubscriptionPlanModel(
    id: 'plus',
    title: 'فانكوش بلس',
    price: 350,
    attempts: 40,
    validityDays: 30,
    badgeTag: 'الأكثر اختيارًا',
    isPopular: true,
    featureHighlight: 'بحث أسرع و افيهات اكتر',
  );

  @override
  Widget build(BuildContext context) {
    final effectivePlan = plan ?? defaultPlan;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PaymentSuccessViewBody(plan: effectivePlan),
      ),
    );
  }
}
