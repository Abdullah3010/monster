import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';

class WEditPreferencesFrom extends StatefulWidget {
  const WEditPreferencesFrom({super.key});

  @override
  State<WEditPreferencesFrom> createState() => _WEditPreferencesFromState();
}

class _WEditPreferencesFromState extends State<WEditPreferencesFrom> {
  late JobSeekerCubit jobSeekerCubit;

  @override
  void initState() {
    super.initState();
    jobSeekerCubit = Modular.get<JobSeekerCubit>();
    jobSeekerCubit.fEditPreferences.init();
    jobSeekerCubit.fillEditPreferencesForm();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300.h,
        minHeight: 10,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 4.h,
        ),
        children: [
          jobSeekerCubit.fEditPreferences.preferredLocationsField.buildField(context),
          16.verticalSpace,
          jobSeekerCubit.fEditPreferences.jobTypeField.buildField(context),
          16.verticalSpace,
          jobSeekerCubit.fEditPreferences.remotePreferencesField.buildField(context),
          16.verticalSpace,
          jobSeekerCubit.fEditPreferences.industryField.buildField(context),
          16.verticalSpace,
        ],
      ),
    );
  }
}
