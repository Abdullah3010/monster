import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/utils/input_field_validator.dart';
import 'package:monster/core/utils/input_formatters/ensure_english_number_formater.dart';
import 'package:monster/core/widgets/forms/w_date_field.dart';
import 'package:monster/core/widgets/forms/w_multi_line_field.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';
import 'package:monster/core/widgets/forms/w_text_field_with_list_horizontal.dart';

class FAddJob extends BaseFormController {
  late WTextField titleField;
  late WMultiLineField descriptionField;
  late WTextFieldWithListHorizontal skillsField;
  late WMultiLineField experienceField;
  late WMultiLineField qualificationField;
  late WTextField locationField;
  late WTextField fromSalaryField;
  late WTextField toSalaryField;
  late WTextFieldWithListHorizontal jobTypeField;
  late WDateField applicationDeadlineField;

  @override
  void init() {
    titleField = WTextField(
      label: 'Title',
      hint: 'Enter Job’s title',
      isRequired: true,
    );

    descriptionField = WMultiLineField(
      label: 'Description',
      hint: 'Enter Description',
      isRequired: true,
    );

    skillsField = WTextFieldWithListHorizontal(
      label: 'Skills',
      hint: 'Search skills',
    );

    experienceField = WMultiLineField(
      label: 'Experience',
      hint: 'Enter required experience',
      isRequired: true,
    );

    qualificationField = WMultiLineField(
      label: 'Qualification',
      hint: 'Enter required qualifications',
      isRequired: true,
    );

    locationField = WTextField(
      label: 'Location',
      hint: 'Enter Location',
      isRequired: true,
    );

    fromSalaryField = WTextField(
      label: 'Salary Range',
      hint: 'From',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );

    toSalaryField = WTextField(
      hint: 'To',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );

    jobTypeField = WTextFieldWithListHorizontal(
      label: 'Job Type',
      hint: 'Search Job Type',
    );

    applicationDeadlineField = WDateField(
      label: 'Application Deadline',
      hint: 'Enter Deadline',
      isRequired: true,
      validators: [InputFieldValidator.validateDeadline],
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    titleField.clear();
    descriptionField.clear();
    skillsField.clear();
    experienceField.clear();
    qualificationField.clear();
    locationField.clear();
    fromSalaryField.clear();
    toSalaryField.clear();
    jobTypeField.clear();
    applicationDeadlineField.clear();
  }
}
