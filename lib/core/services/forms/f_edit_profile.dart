import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/widgets/forms/w_date_field.dart';
import 'package:monster/core/widgets/forms/w_phone_field.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';

class FEditProfile extends BaseFormController {
  String imageUrl = '';
  late WTextField fullNameField;
  late WPhoneField phoneField;
  late WDateField dateOfBirthField;
  late WTextField addressField;

  @override
  void init() {
    fullNameField = WTextField(
      label: 'Full Name',
      hint: 'Enter Your Name',
      isRequired: true,
    );

    phoneField = WPhoneField(
      label: 'Phone',
      hint: 'Enter Your Phone Number',
      isRequired: true,
    );

    dateOfBirthField = WDateField(
      label: 'Date of Birth',
      hint: 'DD/MM/YYYY',
      isRequired: true,
    );

    addressField = WTextField(
      label: 'Address',
      hint: 'Enter Your Address',
      isRequired: true,
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    fullNameField.clear();
    phoneField.clear();
    dateOfBirthField.clear();
    addressField.clear();
    imageUrl = '';
  }
}
