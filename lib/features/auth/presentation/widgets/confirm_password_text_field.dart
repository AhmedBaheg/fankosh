import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/shared_widgets/custom_text_field.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/validation.dart';
import '../../../../l10n/app_localizations.dart';

/// Small modular confirm password field using standard Validation class.
class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({
    super.key,
    this.controller,
    this.passwordController,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final TextEditingController? passwordController;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return CustomTextField(
      controller: widget.controller,
      label: l10n.confirmPasswordLabel,
      hintText: l10n.confirmPasswordHint,
      prefixIcon: AppAssets.icLock,
      obscureText: _isObscured,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      suffixIcon: IconButton(
        icon: SvgPicture.asset(
          _isObscured ? AppAssets.eyeOffIcon : AppAssets.eyeIcon,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      ),
      validator: (value) => Validation.validateConfirmPassword(
        value ?? '',
        passwordController: widget.passwordController,
      ),
    );
  }
}
