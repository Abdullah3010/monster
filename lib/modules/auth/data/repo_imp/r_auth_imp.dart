import 'package:firebase_auth/firebase_auth.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/data/sources/local/ds_auth_local.dart';
import 'package:monster/modules/auth/data/sources/remote/ds_auth_remote.dart';
import 'package:monster/modules/auth/domain/entities/params_login_user.dart';
import 'package:monster/modules/auth/domain/entities/params_register_user.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';

class RAuthImp extends RAuth {
  final DSAuthLocal local;
  final DSAuthRemote remote;

  RAuthImp({
    required this.local,
    required this.remote,
  });

  @override
  Future<bool> register(ParamsRegisterUser params) async {
    try {
      final UserCredential? user = await remote.register(params);
      if (user != null) {
        params.uid = user.user?.uid;
        await local.createUpdate(params.toModel());
        await remote.saveUserData(params.toModel());
        return true;
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RAuthImp.register',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<bool> login(ParamsLoginUser params) async {
    try {
      final UserCredential? user = await remote.login(params);
      if (user != null) {
        final MUser? userDate = await remote.getUser(user.user?.uid ?? '');
        if (userDate != null) {
          await local.createUpdate(userDate);
        }
        return true;
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RAuthImp.login',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  MUser? getActiveUser() {
    try {
      return local.read();
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RAuthImp.getActiveUser',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }
}
