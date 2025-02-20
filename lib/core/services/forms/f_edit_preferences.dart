import 'package:monster/core/services/forms/base_form_controller.dart';
import 'package:monster/core/widgets/forms/w_dropdown_field.dart';
import 'package:monster/core/widgets/forms/w_text_field.dart';

class FEditPreferences extends BaseFormController {
  late WTextField preferredLocationsField;
  late WDropdownField<String> jobTypeField;
  late WDropdownField<String> remotePreferencesField;
  late WTextField industryField;

  @override
  void init() {
    preferredLocationsField = WTextField(
      label: 'Preferred Locations',
      hint: 'Search locations',
      isRequired: true,
    );

    jobTypeField = WDropdownField<String>(
      items: ['Full Time', 'Part Time', 'Contract', 'Internship'],
      label: 'Job Type',
      hint: 'Select Job Type',
      isRequired: true,
    );

    remotePreferencesField = WDropdownField<String>(
      items: ['Remote', 'Onsite', 'Hybrid'],
      label: 'Remote Preferences',
      hint: 'Choose Remote Preferences',
      isRequired: true,
    );

    industryField = WTextField(
      label: 'Industry',
      hint: 'Search Industries',
      isRequired: true,
    );
  }

  @override
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void clear() {
    preferredLocationsField.clear();
    jobTypeField.clear();
    remotePreferencesField.clear();
    industryField.clear();
  }
}
