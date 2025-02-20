import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/services/routes/app_module.dart';
import 'package:monster/core/theme/app_theme.dart';
import 'package:monster/modules/auth/data/sources/local/h_box_user.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';
import 'package:toastification/toastification.dart';

class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    Future.wait([
      HBoxUser().init(),
    ]);
    WidgetsBinding.instance.addObserver(this);
    Modular.setNavigatorKey(Constants.navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Modular.get<AuthCubit>()),
        BlocProvider(create: (_) => Modular.get<JobSeekerCubit>()),
        BlocProvider(create: (_) => Modular.get<CompanyCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        enableScaleText: () => false,
        enableScaleWH: () => false,
        builder: (_, __) => ModularApp(
          module: AppModule(),
          child: LocalizedApp(
            child: ToastificationWrapper(
              config: ToastificationConfig(
                alignment: Alignment.topCenter,
                itemWidth: MediaQuery.sizeOf(context).width * 0.9,
              ),
              child: MaterialApp.router(
                title: 'Monster',
                debugShowCheckedModeBanner: false,
                locale: context.locale,
                localizationsDelegates: context.delegates,
                supportedLocales: context.supportedLocales,
                theme: AppTheme().lightTheme,
                routerConfig: Modular.routerConfig,
                builder: (ctx, child) => LocalizeAndTranslate.directionBuilder(context, child),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
