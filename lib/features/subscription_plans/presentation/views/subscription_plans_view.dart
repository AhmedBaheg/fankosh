import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/subscription_plans_view_body.dart';

/// Main screen view for Subscription Plans selection.
///
/// Corresponds to Figma Frame 3 (Subscription Plans Screen).
class SubscriptionPlansView extends StatelessWidget {
  const SubscriptionPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SubscriptionPlansViewBody(),
      ),
    );
  }
}
