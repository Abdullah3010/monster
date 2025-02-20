import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/modules/auth/presentation/screens/sn_login.dart';
import 'package:monster/modules/auth/presentation/screens/sn_register.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/presentation/screens/sn_add_job.dart';
import 'package:monster/modules/core/presentation/screens/sn_onboarding.dart';
import 'package:monster/modules/core/presentation/screens/sn_splash.dart';
import 'package:monster/modules/home/presentation/screens/sn_home_main.dart';

/// [Routes] is a class that contains all the routes in the app.
class Routes {
  /// [buildRoutes] is a function that build all the routes in the app.
  static void buildRoutes(RouteManager r) {
    /// ================= Core ================= ///
    r.child(
      RoutesNames.core.splash,
      transition: TransitionType.fadeIn,
      child: (_) => const SNSplash(),
    );
    r.child(
      RoutesNames.core.onboarding,
      transition: TransitionType.fadeIn,
      child: (_) => const SNOnboarding(),
    );

    /// ================= Auth ================= ///
    r.child(
      RoutesNames.auth.login,
      transition: TransitionType.fadeIn,
      child: (_) => const SNLogin(),
    );
    r.child(
      RoutesNames.auth.register,
      transition: TransitionType.fadeIn,
      child: (_) => const SNRegister(),
    );

    /// ================= Home ================= ///
    r.child(
      RoutesNames.home.homeMain,
      transition: TransitionType.fadeIn,
      child: (_) => const SNHomeMain(),
    );

    r.child(
      RoutesNames.home.addJob,
      transition: TransitionType.fadeIn,
      child: (_) => SnAddJob(
        job: r.args.data as MJobPost?,
      ),
    );
  }
}
