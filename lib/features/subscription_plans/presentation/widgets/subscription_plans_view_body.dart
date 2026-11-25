import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/subscription_plan_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/shared_widgets/subscription_plan_card.dart';
import 'pay_button.dart';
import 'subscription_plans_header.dart';
import 'try_free_button.dart';

/// Main interactive body layout for Subscription Plans view matching Figma Frame 3.
class SubscriptionPlansViewBody extends StatefulWidget {
  const SubscriptionPlansViewBody({super.key});

  @override
  State<SubscriptionPlansViewBody> createState() =>
      _SubscriptionPlansViewBodyState();
}

class _SubscriptionPlansViewBodyState
    extends State<SubscriptionPlansViewBody> {
  late final List<SubscriptionPlanModel> _plans;
  late SubscriptionPlanModel _selectedPlan;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _plans = const [
      SubscriptionPlanModel(
        id: 'lite',
        title: 'فانكوش لايت',
        price: 290,
        attempts: 20,
        validityDays: 30,
        badgeTag: 'الأوفر',
        featureHighlight: '⚡ بحث أسرع وضحك أكثر',
      ),
      SubscriptionPlanModel(
        id: 'plus',
        title: 'فانكوش بلس',
        price: 350,
        attempts: 40,
        validityDays: 30,
        badgeTag: '⭐ الأكثر اختيارًا',
        isPopular: true,
        featureHighlight: '👑 بحث أسرع وإفيهات أكثر',
      ),
      SubscriptionPlanModel(
        id: 'pro',
        title: 'فانكوش برو',
        price: 599,
        attempts: 100,
        validityDays: 30,
        featureHighlight: '⚡ بحث أسرع',
      ),
    ];
    // Default selected plan is Fankosh Plus (Frame 3)
    _selectedPlan = _plans[1];
  }

  void _onPayPressed() {
    setState(() {
      _isProcessing = true;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() {
        _isProcessing = false;
      });
      Navigator.pushReplacementNamed(context, Routes.homeView);
    });
  }

  void _onSkipPressed() {
    Navigator.pushReplacementNamed(context, Routes.homeView);
  }

  void _onTryFreePressed() {
    Navigator.pushReplacementNamed(context, Routes.homeView);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header (Logo, "تخطي الآن", Title, Subtitle)
          SubscriptionPlansHeader(
            onSkipPressed: _onSkipPressed,
          ),
          SizedBox(height: 28.h),

          // 2. Subscription Plan Cards List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _plans.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final plan = _plans[index];
              return SubscriptionPlanCard(
                plan: plan,
                isSelected: plan.id == _selectedPlan.id,
                onTap: () {
                  setState(() {
                    _selectedPlan = plan;
                  });
                },
              );
            },
          ),
          SizedBox(height: 32.h),

          // 3. Primary Pay Button (Dynamic Price)
          PayButton(
            price: _selectedPlan.price,
            onPressed: _onPayPressed,
            isLoading: _isProcessing,
          ),
          SizedBox(height: 12.h),

          // 4. Secondary Try Free Button
          TryFreeButton(
            onPressed: _onTryFreePressed,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
