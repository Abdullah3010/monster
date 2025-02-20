import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/items/w_skill_item.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_skills.dart';

class WSkillSection extends StatefulWidget {
  const WSkillSection({super.key});

  @override
  State<WSkillSection> createState() => _WSkillSectionState();
}

class _WSkillSectionState extends State<WSkillSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getSkills();
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
                  'Skills',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editSkills();
                        await jobSeekerCubit.getSkills();
                        Modular.to.pop();
                      },
                      child: const WEditSkills(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.skills == null ? 'Add' : 'Edit',
                    style: context.textTheme.orange14w400,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Container(
              width: context.width,
              constraints: BoxConstraints(
                maxHeight: 225.h,
                minHeight: 10.h,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: (jobSeekerCubit.skills?.length ?? 0) == 0
                  ? Text(
                      'No Skills Added',
                      style: context.textTheme.navyBlue14w300,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: jobSeekerCubit.skills?.length ?? 0,
                      itemBuilder: (context, index) {
                        return WSkillItem(
                          skill: jobSeekerCubit.skills?[index].name ?? '',
                          rating: 0,
                        );
                      },
                    ),
            ),
            24.verticalSpace,
          ],
        );
      },
    );
  }
}
