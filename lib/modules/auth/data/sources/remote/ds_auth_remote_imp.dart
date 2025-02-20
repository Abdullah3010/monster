import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/data/sources/remote/ds_auth_remote.dart';
import 'package:monster/modules/auth/domain/entities/params_login_user.dart';
import 'package:monster/modules/auth/domain/entities/params_register_user.dart';

class DSAuthRemoteImp implements DSAuthRemote {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential?> register(ParamsRegisterUser params) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: params.email ?? '',
        password: params.password ?? '',
      );
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSAuthRemoteImpl.register',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<UserCredential?> login(ParamsLoginUser params) async {
    try {
      return await auth.signInWithEmailAndPassword(
        email: params.email ?? '',
        password: params.password ?? '',
      );
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSAuthRemoteImpl.login',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<MUser?> getUser(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> user =
          await firestore.collection(Constants.collections.users).doc(uid).get();
      if (user.exists) {
        return MUser.fromJson(user.data());
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSAuthRemoteImpl.getUser',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<void> saveUserData(MUser user) async {
    try {
      await firestore.collection(Constants.collections.users).doc(user.uid).set(user.toJson());
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSAuthRemoteImpl.saveUserData',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await auth.signOut();
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSAuthRemoteImpl.logout',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }
}
