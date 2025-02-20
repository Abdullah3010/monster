import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_job_section.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/sections/w_preferences_section.dart';

class WProfilePreferences extends StatelessWidget {
  const WProfilePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const WJobSection(),
        24.verticalSpace,
        const WPreferencesSection(),
      ],
    );
  }
}
