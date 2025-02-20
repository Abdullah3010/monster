import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/services/routes/binds/auth_bind.dart';
import 'package:monster/core/services/routes/binds/company_bind.dart';
import 'package:monster/core/services/routes/binds/job_seeker_bind.dart';
import 'package:monster/core/utils/box_app_config/box_app_config.dart';
import 'package:monster/core/utils/box_app_config/ds_app_config.dart';

/// [Binds] is a class that contains all the dependencies that will be used in the app.
class Binds {
  /// [binds] is a function that bind all dependencies.
  static void binds(Injector i) {
    i.addSingleton(BoxAppConfig.new);
    i.addSingleton(DSAppConfig.new);

    AuthBind.binds(i);
    JobSeekerBind.binds(i);
    CompanyBind.binds(i);
  }
}
