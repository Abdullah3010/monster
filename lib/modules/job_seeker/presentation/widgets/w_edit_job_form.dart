import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';

class WEditJobFrom extends StatefulWidget {
  const WEditJobFrom({super.key});

  @override
  State<WEditJobFrom> createState() => _WEditJobFromState();
}

class _WEditJobFromState extends State<WEditJobFrom> {
  late JobSeekerCubit jobSeekerCubit;

  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fEditJob.init();
    jobSeekerCubit.fillEditJobForm();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 360.h,
        minHeight: 10,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 4.h,
        ),
        children: [
          jobSeekerCubit.fEditJob.currentJobField.buildField(context),
          16.verticalSpace,
          jobSeekerCubit.fEditJob.yearsOfExperienceField.buildField(context),
          16.verticalSpace,
          jobSeekerCubit.fEditJob.desiredJobField.buildField(context),
          16.verticalSpace,
          Row(
            children: [
              Expanded(child: jobSeekerCubit.fEditJob.salaryRangeFromField.buildField(context)),
              48.horizontalSpace,
              Expanded(child: jobSeekerCubit.fEditJob.salaryRangeToField.buildField(context)),
            ],
          ),
          16.verticalSpace,
          jobSeekerCubit.fEditJob.currencyField.buildField(context),
        ],
      ),
    );
  }
}
