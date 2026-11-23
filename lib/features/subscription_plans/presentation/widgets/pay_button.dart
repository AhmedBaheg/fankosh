import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/assets.dart';
import '../../../../l10n/app_localizations.dart';

/// Primary pay CTA button showing dynamic localized price matching Figma Frame 3.
class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.price,
    required this.onPressed,
    this.isLoading = false,
  });

  final int price;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PrimaryButton(
      text: l10n.continueToPayment(price),
      onPressed: onPressed,
      icon: AppAssets.arrowBackIcon,
      isLoading: isLoading,
    );
  }
}
