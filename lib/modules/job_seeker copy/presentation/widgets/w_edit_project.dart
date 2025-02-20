import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/forms/f_edit_project.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_remove_icon.dart';

class WEditProject extends StatefulWidget {
  const WEditProject({super.key});

  @override
  State<WEditProject> createState() => _WEditProjectState();
}

class _WEditProjectState extends State<WEditProject> {
  late JobSeekerCubit jobSeekerCubit;
  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fillProjectsForms();
    jobSeekerCubit.fEditProject.init();
    jobSeekerCubit.projectForms.add(jobSeekerCubit.fEditProject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: jobSeekerCubit.projectForms.length > 1
            ? MediaQuery.of(context).viewInsets.bottom < 30
                ? 600.h
                : 330.h
            : 250.h,
        minHeight: 10,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 4.h,
        ),
        children: [
          ...jobSeekerCubit.projectForms.map((project) {
            return Column(
              spacing: 16.h,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: project.nameField.buildField(context),
                    ),
                    12.horizontalSpace,
                    InkWell(
                      onTap: () {
                        setState(() {
                          jobSeekerCubit.projectForms.remove(project);
                        });
                      },
                      child: const WRemoveIcon(),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: project.yearFromField.buildField(context)),
                    48.horizontalSpace,
                    Expanded(child: project.yearToField.buildField(context)),
                  ],
                ),
                project.linkField.buildField(context),
                32.verticalSpace,
              ],
            );
          }),
          WAppButton(
            title: 'Add New',
            isFilled: false,
            width: context.width,
            onTap: () {
              setState(() {
                jobSeekerCubit.projectForms.add(FEditProject()..init());
              });
            },
          ),
        ],
      ),
    );
  }
}
