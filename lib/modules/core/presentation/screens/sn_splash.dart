import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/utils/box_app_config/ds_app_config.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';

class SNSplash extends StatefulWidget {
  const SNSplash({super.key});

  @override
  State<SNSplash> createState() => _SNSplashState();
}

class _SNSplashState extends State<SNSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (DSAppConfig.getConfigValue(Constants.configKeys.isFirstTime) == null) {
          await DSAppConfig.setConfigValue(Constants.configKeys.isFirstTime, 'false');
          Modular.to.pushNamed(RoutesNames.core.onboarding);
          return;
        }
        Modular.to.pushNamed(RoutesNames.auth.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.icons.appLogo.path,
              width: context.width,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
          16.verticalSpace,
          Text(
            'Streamlining \nTalent Outreach',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
              color: context.theme.colorScheme.navyBlue,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
