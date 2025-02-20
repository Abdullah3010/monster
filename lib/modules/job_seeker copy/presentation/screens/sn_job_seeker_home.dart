import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_professional_details.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/w_profile_preferences.dart';

class SNJobSeekerHome extends StatefulWidget {
  const SNJobSeekerHome({super.key});

  @override
  State<SNJobSeekerHome> createState() => _SNJobSeekerHomeState();
}

class _SNJobSeekerHomeState extends State<SNJobSeekerHome> {
  int currentTap = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentTap = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 12.w,
                ),
                decoration: BoxDecoration(
                  color: currentTap == 1 ? context.theme.colorScheme.orange : null,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(
                  'Profile & Preferences',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: currentTap == 1 ? FontWeight.w600 : null,
                    color: currentTap == 1 ? context.theme.colorScheme.white : context.theme.colorScheme.grey,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentTap = 2;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 12.w,
                ),
                decoration: BoxDecoration(
                  color: currentTap == 2 ? context.theme.colorScheme.orange : null,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(
                  'Professional Details',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: currentTap == 2 ? FontWeight.w600 : null,
                    color: currentTap == 2 ? context.theme.colorScheme.white : context.theme.colorScheme.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        currentTap == 1 ? const WProfilePreferences() : const WProfessionalDetails(),
        24.verticalSpace,
      ],
    );
  }
}
