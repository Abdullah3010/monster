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
import 'package:monster/modules/company/presentation/widgets/w_edit_social_links.dart';
import 'package:monster/modules/home/presentation/widgets/w_link_item.dart';
import 'package:monster/modules/home/presentation/widgets/w_profile_info_item.dart';

class WSocialLinksSection extends StatefulWidget {
  const WSocialLinksSection({super.key});

  @override
  State<WSocialLinksSection> createState() => _WSocialLinksSectionState();
}

class _WSocialLinksSectionState extends State<WSocialLinksSection> {
  final CompanyCubit companyCubit = Modular.get<CompanyCubit>();

  @override
  void initState() {
    super.initState();
    companyCubit.getSocialLinks();
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
                  'Social Links',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await companyCubit.editSocialLinks();
                        await companyCubit.getSocialLinks();
                        Modular.to.pop();
                      },
                      child: const WEditSocialLinks(),
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
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: (companyCubit.socialLinks?.length ?? 0) == 0
                  ? WProfileInfoItem(
                      icon: Assets.icons.link.path,
                      title: 'Link',
                      value: '',
                      emptyStateMessage: 'No Links Added',
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12.h,
                      children: companyCubit.socialLinks?.map((reference) {
                            return WLinkItem(
                              referenceName: reference.name ?? '',
                              referenceUrl: reference.link ?? '',
                            );
                          }).toList() ??
                          [],
                    ),
            ),
          ],
        );
      },
    );
  }
}
