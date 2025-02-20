import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/widgets/forms/w_email_field.dart';
import 'package:monster/core/widgets/forms/w_password_field.dart';

class FLogin extends BaseFormController {
  late WEmailField emailField;
  late WPasswordField passwordField;

  @override
  void init() {
    emailField = WEmailField(
      label: 'Email',
      hint: 'Enter your email',
      isRequired: true,
    );

    passwordField = WPasswordField(
      label: 'Password',
      hint: 'Enter your password',
      isRequired: true,
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    emailField.clear();
    passwordField.clear();
  }
}
