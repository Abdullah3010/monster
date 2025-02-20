import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/home/presentation/widgets/w_link_item.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_references.dart';

class WReferencesSection extends StatefulWidget {
  const WReferencesSection({super.key});

  @override
  State<WReferencesSection> createState() => _WReferencesSectionState();
}

class _WReferencesSectionState extends State<WReferencesSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getReferences();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobSeekerCubit, JobSeekerState>(
      bloc: jobSeekerCubit,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'References',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editReferences();
                        await jobSeekerCubit.getReferences();
                        Modular.to.pop();
                      },
                      child: const WEditReferences(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.references == null ? 'Add' : 'Edit',
                    style: context.textTheme.orange14w400,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.h,
                children: [
                  if ((jobSeekerCubit.references?.length ?? 0) == 0)
                    Text(
                      'No References Added',
                      style: context.textTheme.navyBlue14w300,
                    )
                  else
                    ...jobSeekerCubit.references?.map((reference) {
                          return WLinkItem(
                            referenceName: reference.name ?? '',
                            referenceUrl: reference.link ?? '',
                          );
                        }).toList() ??
                        []
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
