import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WSharedField extends StatelessWidget {
  const WSharedField({
    required this.controller,
    this.hint,
    this.label,
    this.enabled = true,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.onValidate,
    this.textStyle,
    this.validatorKey,
    this.textDirection,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.onTap,
    this.obscureText,
    this.disabledBorder,
    super.key,
  });

  /// Controllers
  final TextEditingController controller;
  final GlobalKey<FormFieldState>? validatorKey;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hint;
  final String? label;
  final bool? obscureText;
  final bool? enabled;

  /// Text Field
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? inputFormatters;

  /// Icons
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  /// Actions
  final void Function()? onTap;
  final String? Function(String?)? onValidate;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  /// Borders
  final InputBorder? disabledBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: validatorKey,
      focusNode: focusNode,
      controller: controller,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.center,
      textDirection: textDirection ?? TextDirection.ltr,
      onTap: onTap,
      validator: onValidate,
      onChanged: onChanged,
      style: textStyle,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText ?? false,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        disabledBorder: disabledBorder,
      ),
    );
  }
}
