import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/utils/input_field_validator.dart';
import 'package:monster/core/utils/input_formatters/date_formatter.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WDateField extends BaseFormField {
  WDateField({
    super.isRequired = true,
    super.hint = '',
    super.label = '',
    super.validators = const [
      InputFieldValidator.validateDateRequired,
      InputFieldValidator.validateDate,
    ],
    super.fieldName = '',
  });

  @override
  Widget buildField(BuildContext context, {ParamsCustomInput? param}) {
    return WSharedField(
      validatorKey: fieldKey,
      controller: controller,
      focusNode: focusNode,
      hint: hint,
      label: label,
      onValidate: validate,
      enabled: param?.enabled,
      keyboardType: TextInputType.datetime,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(Assets.icons.calendarDeadline.path),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
        const DateFormatter(),
      ],
    );
  }
}
