import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/validation.dart';
import '../../../../l10n/app_localizations.dart';

/// Small modular email text field component using standard Validation class.
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.controller,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController? controller;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomTextField(
      controller: controller,
      label: l10n.emailLabel,
      hintText: l10n.emailHint,
      prefixIcon: AppAssets.icEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      validator: (value) => Validation.validateEmail(value ?? ''),
    );
  }
}
