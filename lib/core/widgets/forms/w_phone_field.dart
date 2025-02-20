import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/config/models/m_country_code.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/input_field_validator.dart';
import 'package:monster/core/utils/input_formatters/phone_number_formatter.dart';
import 'package:monster/core/widgets/forms/base_form_field.dart';
import 'package:monster/core/widgets/forms/w_shared_field.dart';

class WPhoneField extends BaseFormField {
  WPhoneField({
    super.isRequired = false,
    super.hint = '',
    super.label = '',
    super.validators = const [InputFieldValidator.validateOptionalPhoneNumber],
    super.fieldName = '',
  });

  @override
  Widget buildField(BuildContext context, {ParamsCustomInput? param}) {
    MCountryCode currentCountry = Constants.countries.firstOrNull ??
        MCountryCode(
          name: 'EG',
          code: '+20',
        );
    controller.text = currentCountry.code;
    return StatefulBuilder(
      builder: (context, setState) {
        return WSharedField(
          validatorKey: fieldKey,
          controller: controller,
          inputFormatters: [
            PhoneNumberFormatter(currentCountry.code),
          ],
          hint: hint,
          label: label,
          onValidate: (value) {
            return validate(value);
          },
          keyboardType: TextInputType.phone,
          textInputAction: textInputAction,
          onChanged: param?.onChanged,
          textDirection: TextDirection.ltr,
          prefixIcon: CInputCountryCodePrefix(
            onCountrySelected: (country) {
              setState(() {
                currentCountry = country;
                controller.text = country.code;
              });
            },
          ),
        );
      },
    );
  }
}

class CInputCountryCodePrefix extends StatefulWidget {
  const CInputCountryCodePrefix({
    super.key,
    this.onCountrySelected,
  });

  final Function(MCountryCode)? onCountrySelected;

  @override
  State<CInputCountryCodePrefix> createState() => _CInputCountryCodePrefixState();
}

class _CInputCountryCodePrefixState extends State<CInputCountryCodePrefix> {
  OverlayEntry? _overlayEntry;

  late String currentCountryPrefix;

  @override
  void initState() {
    super.initState();
    currentCountryPrefix = Constants.countries.firstOrNull?.name ?? '';
  }

  void _toggleMenu() {
    if (_overlayEntry != null) {
      _removeMenu();
    } else {
      _showMenu();
    }
  }

  void _showMenu() {
    final overlay = Overlay.of(context);
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _removeMenu,
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + renderBox.size.height,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: renderBox.size.width,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Constants.countries.map(_buildMenuItem).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuItem(MCountryCode country) {
    return InkWell(
      onTap: () {
        widget.onCountrySelected?.call(country);
        setState(() {
          currentCountryPrefix = country.name;
        });
        _removeMenu();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Text(
          country.name,
          style: Theme.of(context).textTheme.grey16w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleMenu,
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 6.w,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 35.w,
                child: Text(
                  currentCountryPrefix,
                  style: context.textTheme.grey16w400,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: context.theme.colorScheme.grey,
                size: 24.sp,
              ),
              VerticalDivider(
                color: context.theme.colorScheme.grey,
                width: 20.w,
                thickness: 1.5.w,
                indent: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
