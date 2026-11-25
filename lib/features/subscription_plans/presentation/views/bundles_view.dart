import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/bundles_view_body.dart';

/// Screen view for purchasing and choosing Bundles (اختار باقتك).
class BundlesView extends StatelessWidget {
  const BundlesView({
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BundlesViewBody(
        currentPlanName: currentPlanName,
        remainingAttempts: remainingAttempts,
        expiryDate: expiryDate,
        isActive: isActive,
      ),
    );
  }
}
