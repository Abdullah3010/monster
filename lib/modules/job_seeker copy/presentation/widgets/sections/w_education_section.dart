import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/items/w_education_item.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_education.dart';

class WEducationSection extends StatefulWidget {
  const WEducationSection({super.key});

  @override
  State<WEducationSection> createState() => _WEducationSectionState();
}

class _WEducationSectionState extends State<WEducationSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getEducation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobSeekerCubit, JobSeekerState>(
      bloc: jobSeekerCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Education',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editEducation();
                        await jobSeekerCubit.getEducation();
                        Modular.to.pop();
                      },
                      child: const WEditEducation(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.education == null ? 'Add' : 'Edit',
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
                  if ((jobSeekerCubit.education?.length ?? 0) == 0)
                    Text(
                      'No Educations Added',
                      style: context.textTheme.navyBlue14w300,
                    )
                  else
                    ...jobSeekerCubit.education?.map((education) {
                          return WEducationItem(
                            name: education.name ?? '',
                            from: education.from ?? '',
                            to: education.to ?? '',
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
