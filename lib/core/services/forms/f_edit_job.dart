import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/utils/input_formatters/ensure_english_number_formater.dart';
import 'package:monster/core/widgets/forms/w_dropdown_field.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';

class FEditJob extends BaseFormController {
  late WTextField currentJobField;
  late WTextField yearsOfExperienceField;
  late WTextField desiredJobField;
  late WTextField salaryRangeFromField;
  late WTextField salaryRangeToField;
  late WDropdownField<String> currencyField;

  @override
  void init() {
    currentJobField = WTextField(
      label: 'Current Job',
      hint: 'Enter Your Job',
      isRequired: true,
    );

    yearsOfExperienceField = WTextField(
      label: 'Years of Experience',
      hint: 'Enter Years of Experience',
      isRequired: true,
    );

    desiredJobField = WTextField(
      label: 'Desired Job',
      hint: 'Enter Desired Job',
      isRequired: true,
    );

    salaryRangeFromField = WTextField(
      label: 'Salary Range',
      hint: 'From',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );

    salaryRangeToField = WTextField(
      label: '',
      hint: 'To',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );

    currencyField = WDropdownField<String>(
      items: ['USD', 'EUR', 'GBP', 'EUR', 'GBP', 'EUR', 'GBP', 'EUR', 'GBP', 'EUR', 'GBP'],
      label: 'Currency',
      hint: 'Enter Desired Currency',
      isRequired: true,
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    currentJobField.clear();
    yearsOfExperienceField.clear();
    desiredJobField.clear();
    salaryRangeFromField.clear();
    salaryRangeToField.clear();
    currencyField.clear();
  }
}
