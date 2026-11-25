import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/subscription_details_model.dart';
import '../widgets/plan_details_view_body.dart';

/// Standalone screen view for Plan Details (تفاصيل الباقة).
class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({
    super.key,
    this.details = const SubscriptionDetailsModel(),
  });

  final SubscriptionDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PlanDetailsViewBody(details: details),
    );
  }
}
