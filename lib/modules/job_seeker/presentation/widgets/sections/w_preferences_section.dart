import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/modules/home/presentation/widgets/w_profile_info_item.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_edit_preferences_form.dart';

class WPreferencesSection extends StatefulWidget {
  const WPreferencesSection({super.key});

  @override
  State<WPreferencesSection> createState() => _WPreferencesSectionState();
}

class _WPreferencesSectionState extends State<WPreferencesSection> {
  final JobSeekerCubit jobSeekerCubit = Modular.get<JobSeekerCubit>();

  @override
  void initState() {
    super.initState();
    jobSeekerCubit.getPreferences();
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
                  'Preferences',
                  style: context.textTheme.navyBlue18w800Italic,
                ),
                InkWell(
                  onTap: () {
                    AppDialogs.showBottomSheet(
                      mainActionTitle: 'Save',
                      onMainAction: () async {
                        await jobSeekerCubit.editPreferences();
                        await jobSeekerCubit.getPreferences();
                        Modular.to.pop();
                      },
                      child: const WEditPreferencesFrom(),
                    );
                  },
                  child: Text(
                    jobSeekerCubit.preferences == null ? 'Add' : 'Edit',
                    style: context.textTheme.orange14w400,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Column(
                children: [
                  WProfileInfoItem(
                    icon: Assets.icons.location.path,
                    title: 'Location',
                    value: jobSeekerCubit.preferences?.location,
                    emptyStateMessage: 'No Location Selected',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.briefcase.path,
                    title: 'Job Type',
                    value: jobSeekerCubit.preferences?.jobType,
                    emptyStateMessage: 'No Type Selected',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.gps.path,
                    title: 'Remote Preference',
                    value: jobSeekerCubit.preferences?.remotePreference,
                    emptyStateMessage: 'No Preference Selected',
                  ),
                  12.verticalSpace,
                  WProfileInfoItem(
                    icon: Assets.icons.industry.path,
                    title: 'Job Type',
                    value: jobSeekerCubit.preferences?.industry,
                    emptyStateMessage: 'No Industry Selected',
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
