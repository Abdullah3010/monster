import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_job_form.dart';

class WJobSection extends StatefulWidget {
  const WJobSection({super.key});

  @override
  State<WJobSection> createState() => _WJobSectionState();
}

class _WJobSectionState extends State<WJobSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getJob();
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
                  'Jobs',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editJob();
                        await jobSeekerCubit.getJob();
                        Modular.to.pop();
                      },
                      child: const WEditJobFrom(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.job == null ? 'Add' : 'Edit',
                    style: context.textTheme.orange14w400,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Container(
              width: context.width,
              height: 95.h,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Job',
                          style: context.textTheme.blue14w400,
                        ),
                        Text(
                          jobSeekerCubit.job?.currentJob ?? 'No Job Entered',
                          style: context.textTheme.navyBlue14w300,
                        ),
                        Text(
                          jobSeekerCubit.job?.yearsOfExperience ?? '-',
                          style: context.textTheme.navyBlue16w400,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: context.theme.colorScheme.orange,
                    thickness: 1,
                    width: 30.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Desired Job',
                          style: context.textTheme.blue14w400,
                        ),
                        Text(
                          jobSeekerCubit.job?.desiredJob ?? 'No Job Entered',
                          style: context.textTheme.navyBlue14w300,
                        ),
                        Text(
                          jobSeekerCubit.job?.salaryRange ?? '-',
                          style: context.textTheme.navyBlue16w400,
                        ),
                      ],
                    ),
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
