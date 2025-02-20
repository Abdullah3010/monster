import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';
import 'package:monster/modules/company/presentation/widgets/w_edit_basic_info.dart';
import 'package:monster/modules/home/presentation/widgets/w_profile_info_item.dart';

class WBasicInfoSection extends StatefulWidget {
  const WBasicInfoSection({super.key});

  @override
  State<WBasicInfoSection> createState() => _WBasicInfoSectionState();
}

class _WBasicInfoSectionState extends State<WBasicInfoSection> {
  final CompanyCubit companyCubit = Modular.get<CompanyCubit>();

  @override
  void initState() {
    super.initState();
    companyCubit.getBasicInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      bloc: companyCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Basic Info',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await companyCubit.editBasicInfo();
                        await companyCubit.getBasicInfo();
                        Modular.to.pop();
                      },
                      child: const WEditBasicInfo(),
                    );
                  },
                  child: Text(
                    companyCubit.basicInfo == null ? 'Add' : 'Edit',
                    style: context.textTheme.orange14w400,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Column(
                children: [
                  WProfileInfoItem(
                    icon: Assets.icons.tagUser.path,
                    title: 'Name',
                    value: companyCubit.basicInfo?.name,
                    emptyStateMessage: 'No Name Added',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.industry.path,
                    title: 'Description',
                    value: companyCubit.basicInfo?.description,
                    emptyStateMessage: 'No Description Added',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.briefcase.path,
                    title: 'Industry',
                    value: companyCubit.basicInfo?.industry?.join(', '),
                    emptyStateMessage: 'No Industry Selected',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.location.path,
                    title: 'Location',
                    value: companyCubit.basicInfo?.location,
                    emptyStateMessage: 'No Location Selected',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.people.path,
                    title: 'Size',
                    value: companyCubit.basicInfo?.size,
                    emptyStateMessage: 'No Size Added',
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
