import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/forms/f_edit_education.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_remove_icon.dart';

class WEditEducation extends StatefulWidget {
  const WEditEducation({super.key});

  @override
  State<WEditEducation> createState() => _WEditEducationState();
}

class _WEditEducationState extends State<WEditEducation> {
  late JobSeekerCubit jobSeekerCubit;

  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fillEducationForms();
    jobSeekerCubit.fEditEducation.init();
    jobSeekerCubit.educationsForms.add(jobSeekerCubit.fEditEducation);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: jobSeekerCubit.educationsForms.length > 1
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
          ...jobSeekerCubit.educationsForms.map((education) {
            return Column(
              spacing: 16.h,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: education.nameField.buildField(context),
                    ),
                    12.horizontalSpace,
                    InkWell(
                      onTap: () {
                        setState(() {
                          jobSeekerCubit.educationsForms.remove(education);
                        });
                      },
                      child: const WRemoveIcon(),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: education.yearFromField.buildField(context)),
                    48.horizontalSpace,
                    Expanded(child: education.yearToField.buildField(context)),
                  ],
                ),
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
                jobSeekerCubit.educationsForms.add(FEditEducation()..init());
              });
            },
          ),
        ],
      ),
    );
  }
}
