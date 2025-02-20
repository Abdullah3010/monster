import 'package:flutter/material.dart';

class ParamsCustomInput {
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;
  final String? customRequiredMessage;
  final FocusNode? nextFocusNode;
  final List<String? Function(String?)?>? validators;
  final void Function(String)? onChanged;
  final Widget Function(String)? listItemWidget;
  final List<String>? values;

  const ParamsCustomInput({
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false,
    this.customRequiredMessage,
    this.nextFocusNode,
    this.validators,
    this.onChanged,
    this.listItemWidget,
    this.values,
  });
}
