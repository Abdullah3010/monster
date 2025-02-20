import 'package:flutter/services.dart';
import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/utils/input_field_validator.dart';
import 'package:monster/core/utils/input_formatters/ensure_english_number_formater.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';

class FEditEducation extends BaseFormController {
  late WTextField nameField;
  late WTextField yearFromField;
  late WTextField yearToField;

  @override
  void init() {
    nameField = WTextField(
      label: 'Name',
      hint: 'Enter Your Education',
      isRequired: true,
    );

    yearFromField = WTextField(
      label: 'Year',
      hint: 'From',
      isRequired: true,
      validators: [InputFieldValidator.validateYear],
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        EnsureEnglishNumberFormater(),
      ],
    );

    yearToField = WTextField(
      label: '',
      hint: 'To',
      isRequired: true,
      validators: [InputFieldValidator.validateYear],
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        EnsureEnglishNumberFormater(),
      ],
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    nameField.clear();
    yearFromField.clear();
    yearToField.clear();
  }
}
