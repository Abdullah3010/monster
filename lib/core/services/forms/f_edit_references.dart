import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';

class FEditReferences extends BaseFormController {
  late WTextField nameField;
  late WTextField linkField;

  @override
  void init() {
    nameField = WTextField(
      label: 'Name',
      hint: 'Enter Your Project',
      isRequired: true,
    );

    linkField = WTextField(
      label: 'Link',
      hint: 'link',
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
    linkField.clear();
  }
}
