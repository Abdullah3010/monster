import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';

class WEditBasicInfo extends StatefulWidget {
  const WEditBasicInfo({super.key});

  @override
  State<WEditBasicInfo> createState() => _WEditBasicInfoState();
}

class _WEditBasicInfoState extends State<WEditBasicInfo> {
  late CompanyCubit companyCubit;

  @override
  void initState() {
    super.initState();
    companyCubit = Modular.get<CompanyCubit>();
    companyCubit.fEditBasicInfo.init();
    companyCubit.fillEditBasicInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 330.h,
        minHeight: 10,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 4.h,
        ),
        children: [
          companyCubit.fEditBasicInfo.nameField.buildField(context),
          16.verticalSpace,
          companyCubit.fEditBasicInfo.descriptionField.buildField(context),
          16.verticalSpace,
          companyCubit.fEditBasicInfo.industryField.buildField(
            context,
            param: ParamsCustomInput(
              values: companyCubit.basicInfo?.industry,
            ),
          ),
          16.verticalSpace,
          companyCubit.fEditBasicInfo.locationField.buildField(context),
          16.verticalSpace,
          Row(
            children: [
              Expanded(child: companyCubit.fEditBasicInfo.sizeFromField.buildField(context)),
              48.horizontalSpace,
              Expanded(child: companyCubit.fEditBasicInfo.sizeToField.buildField(context)),
            ],
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
