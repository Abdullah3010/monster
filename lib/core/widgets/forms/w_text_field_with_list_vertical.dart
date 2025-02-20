import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WTextFieldWithListVertical extends BaseFormField {
  WTextFieldWithListVertical({
    super.isRequired = false,
    super.hint = '',
    super.label = '',
    super.fieldName = '',
  });

  final List<String> values = [];

  @override
  Widget buildField(BuildContext context, {ParamsCustomInput? param}) {
    if (param?.values != null) {
      values.addAll(param!.values!);
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            WSharedField(
              controller: controller,
              focusNode: focusNode,
              hint: hint,
              label: label,
              prefixIcon: param?.prefixIcon,
              suffixIcon: param?.suffixIcon,
              onValidate: validate,
              minLines: 1,
              maxLines: 3,
              keyboardType: TextInputType.text,
              textInputAction: textInputAction,
              onChanged: param?.onChanged,
              enabled: param?.enabled,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    values.add(value);
                    controller.clear();
                    FocusScope.of(context).requestFocus(focusNode);
                  });
                }
              },
            ),
            8.verticalSpace,
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        param?.listItemWidget?.call(values[index]) ?? Text(values[index]),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              values.removeAt(index);
                            });
                          },
                          child: SizedBox(
                            width: 30.w,
                            height: 10.w,
                            child: SvgPicture.asset(
                              Assets.icons.close.path,
                              width: 10.w,
                              height: 10.h,
                              colorFilter: ColorFilter.mode(
                                context.theme.colorScheme.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
