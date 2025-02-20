import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WTextFieldWithListHorizontal extends BaseFormField {
  WTextFieldWithListHorizontal({
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
              width: context.width,
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  ...values.map(
                    (value) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            values.remove(value);
                          });
                        },
                        child: param?.listItemWidget?.call(value) ??
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: context.width * 0.9,
                              ),
                              decoration: BoxDecoration(
                                color: context.theme.colorScheme.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 6.h,
                                horizontal: 8.w,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: context.width * 0.8,
                                    ),
                                    child: Text(
                                      value,
                                      style: context.textTheme.white16w600,
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  SvgPicture.asset(
                                    Assets.icons.close.path,
                                    width: 12.w,
                                    height: 12.h,
                                    colorFilter: ColorFilter.mode(
                                      context.theme.colorScheme.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
