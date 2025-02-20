import 'package:flutter/material.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WTextField extends BaseFormField {
  WTextField({
    super.isRequired = true,
    super.hint = '',
    super.label = '',
    super.fieldName = '',
    super.validators,
    super.inputFormatters,
  });

  @override
  Widget buildField(BuildContext context, {ParamsCustomInput? param}) {
    return WSharedField(
      controller: controller,
      focusNode: focusNode,
      hint: hint,
      label: label,
      prefixIcon: param?.prefixIcon,
      suffixIcon: param?.suffixIcon,
      onValidate: validate,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      onChanged: param?.onChanged,
    );
  }
}
