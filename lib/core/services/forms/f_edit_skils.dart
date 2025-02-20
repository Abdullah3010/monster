import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/widgets/forms/w_text_field_with_list_vertical.dart';

class FEditSkils extends BaseFormController {
  late WTextFieldWithListVertical skillField;

  @override
  void init() {
    skillField = WTextFieldWithListVertical(
      label: 'Skill',
      hint: 'Search skills',
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    skillField.clear();
  }
}
