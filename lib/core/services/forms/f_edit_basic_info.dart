import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/utils/input_formatters/ensure_english_number_formater.dart';
import 'package:monster/core/widgets/forms/w_multi_line_field.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';
import 'package:monster/core/widgets/forms/w_text_field_with_list_horizontal.dart';

class FEditBasicInfo extends BaseFormController {
  late WTextField nameField;
  late WMultiLineField descriptionField;
  late WTextFieldWithListHorizontal industryField;
  late WTextField locationField;
  late WTextField sizeFromField;
  late WTextField sizeToField;

  @override
  void init() {
    nameField = WTextField(
      label: 'Name',
      hint: 'Enter Company Name',
      isRequired: true,
    );

    descriptionField = WMultiLineField(
      label: 'Description',
      hint: 'Enter Company Description',
      isRequired: true,
    );

    industryField = WTextFieldWithListHorizontal(
      label: 'Industry',
      hint: 'Enter Industry',
    );

    locationField = WTextField(
      label: 'Location',
      hint: 'Enter Location',
      isRequired: true,
    );

    sizeFromField = WTextField(
      label: 'Size',
      hint: 'From',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );

    sizeToField = WTextField(
      hint: 'To',
      inputFormatters: [EnsureEnglishNumberFormater()],
      isRequired: true,
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    nameField.clear();
    descriptionField.clear();
    industryField.clear();
    locationField.clear();
    sizeFromField.clear();
    sizeToField.clear();
  }
}
