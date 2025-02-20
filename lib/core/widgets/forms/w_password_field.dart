import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WPasswordField extends BaseFormField {
  WPasswordField({
    super.isRequired = true,
    super.hint = '',
    super.label = '',
    super.fieldName = '',
  });

  @override
  Widget buildField(BuildContext context, {ParamsCustomInput? param}) {
    bool isObscure = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return WSharedField(
          controller: controller,
          focusNode: focusNode,
          hint: hint,
          label: label,
          onValidate: validate,
          keyboardType: TextInputType.text,
          textInputAction: textInputAction,
          onChanged: param?.onChanged,
          obscureText: isObscure,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Assets.icons.eye.path,
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
        );
      },
    );
  }
}
