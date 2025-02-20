import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/modules/auth/data/repo_imp/r_auth_imp.dart';
import 'package:monster/modules/auth/data/sources/local/ds_auth_local.dart';
import 'package:monster/modules/auth/data/sources/local/ds_auth_local_imp.dart';
import 'package:monster/modules/auth/data/sources/remote/ds_auth_remote.dart';
import 'package:monster/modules/auth/data/sources/remote/ds_auth_remote_imp.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';

class AuthBind {
  static void binds(Injector i) {
    /// [Data Sources]
    i.add<DSAuthLocal>(DSAuthLocalImp.new);
    i.add<DSAuthRemote>(DSAuthRemoteImp.new);

    /// [Repo]
    i.add<RAuth>(RAuthImp.new);

    i.addLazySingleton(AuthCubit.new);
  }
}
