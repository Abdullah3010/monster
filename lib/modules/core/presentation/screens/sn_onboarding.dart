import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/string_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';

class SNOnboarding extends StatefulWidget {
  const SNOnboarding({super.key});

  @override
  State<SNOnboarding> createState() => _SNOnboardingState();
}

class _SNOnboardingState extends State<SNOnboarding> {
  int currentIndex = 0;
  final List<String> titles = [
    'Your Gateway to Top Talent',
    'stand Out to Employers',
    'Effortless Company Outreach',
  ];

  final List<String> descriptions = [
    'Monster connects companies with potential employees through smart matching, saving time and effort in finding the right fit',
    'Job seekers can showcase their skills, making it easy for top companies to discover and connect with them',
    'Companies can connect with pre-matched candidates directly, streamlining the recruitment process and fostering meaningful connections',
  ];

  final List<String> images = [
    Assets.images.onboarding1.path,
    Assets.images.onboarding2.path,
    Assets.images.onboarding3.path,
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  ...List.generate(
                    3,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: SvgPicture.asset(
                            index == currentIndex ? Assets.icons.currentStep.path : Assets.icons.step.path,
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  if (currentIndex == 2)
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: context.theme.colorScheme.grey,
                      ),
                    )
                  else
                    InkWell(
                      onTap: () {
                        Modular.to.navigate(RoutesNames.auth.login);
                      },
                      child: Text(
                        'Skip'.translated,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: context.theme.colorScheme.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Image.asset(
              images[currentIndex],
              width: context.width,
              height: 400.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.horizontalSpace,
                  SizedBox(
                    width: context.width * 0.7,
                    child: Text(
                      titles[currentIndex].translated,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.navyBlue,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    descriptions[currentIndex].translated,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.theme.colorScheme.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WAppButton(
                  title: currentIndex < (images.length - 1) ? 'Next' : 'Let’s Start',
                  width: 180.w,
                  onTap: () {
                    if (currentIndex == (images.length - 1)) {
                      Modular.to.navigate(RoutesNames.auth.login);
                      return;
                    }
                    setState(() {
                      currentIndex++;
                    });
                  },
                ),
                20.horizontalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
