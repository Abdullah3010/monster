import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/items/w_project_item.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_project.dart';

class WProjectSection extends StatefulWidget {
  const WProjectSection({super.key});

  @override
  State<WProjectSection> createState() => _WProjectSectionState();
}

class _WProjectSectionState extends State<WProjectSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getProject();
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
                  'Projects',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      titleText: 'Edit Project',
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editProject();
                        await jobSeekerCubit.getProject();
                        Modular.to.pop();
                      },
                      child: const WEditProject(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.projects == null ? 'Add' : 'Edit',
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
                  if ((jobSeekerCubit.projects?.length ?? 0) == 0)
                    Text(
                      'No Project Added',
                      style: context.textTheme.navyBlue14w300,
                    )
                  else
                    ...jobSeekerCubit.projects?.map((project) {
                          return WProjectItem(
                            name: project.name ?? '',
                            from: project.from ?? '',
                            to: project.to ?? '',
                            link: project.link ?? '',
                          );
                        }).toList() ??
                        []
                ],
              ),
            ),
            24.verticalSpace,
          ],
        );
      },
    );
  }
}
