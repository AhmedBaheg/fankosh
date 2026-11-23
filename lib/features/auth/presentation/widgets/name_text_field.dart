import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/validation.dart';
import '../../../../l10n/app_localizations.dart';

/// Small modular name text field component using standard Validation class.
class NameTextField extends StatelessWidget {
  const NameTextField({
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
      label: l10n.nameLabel,
      hintText: l10n.nameHint,
      prefixIcon: AppAssets.userIcon,
      keyboardType: TextInputType.name,
      textInputAction: textInputAction,
      validator: (value) => Validation.validateName(value ?? ''),
    );
  }
}
