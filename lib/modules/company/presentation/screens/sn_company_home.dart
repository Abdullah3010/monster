import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/modules/company/presentation/widgets/w_jobs.dart';
import 'package:monster/modules/company/presentation/widgets/w_profile.dart';

class SNCompanyHome extends StatefulWidget {
  const SNCompanyHome({super.key});

  @override
  State<SNCompanyHome> createState() => _SNCompanyHomeState();
}

class _SNCompanyHomeState extends State<SNCompanyHome> {
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    currentStep = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: currentStep == 1 ? context.theme.colorScheme.orange : null,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: currentStep == 1 ? FontWeight.w600 : null,
                      color: currentStep == 1 ? context.theme.colorScheme.white : context.theme.colorScheme.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentStep = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: currentStep == 2 ? context.theme.colorScheme.orange : null,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Text(
                    'Jobs',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: currentStep == 2 ? FontWeight.w600 : null,
                      color: currentStep == 2 ? context.theme.colorScheme.white : context.theme.colorScheme.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          currentStep == 1 ? const WProfile() : const WJobs(),
        ],
      ),
    );
  }
}
