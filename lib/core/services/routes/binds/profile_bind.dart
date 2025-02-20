import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/modules/profile/presentation/cubit/profile_cubit.dart';

class ProfileBind {
  static void binds(Injector i) {
    /// [Data Sources]
    // i.add<DSAuthLocal>(DSAuthLocalImp.new);
    // i.add<DSAuthRemote>(DSAuthRemoteImp.new);

    /// [Repo]
    // i.add<RAuth>(RAuthImp.new);

    i.addLazySingleton(ProfileCubit.new);
  }
}
