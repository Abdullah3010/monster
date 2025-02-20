import 'package:firebase_auth/firebase_auth.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/domain/entities/params_login_user.dart';
import 'package:monster/modules/auth/domain/entities/params_register_user.dart';

abstract class DSAuthRemote {
  Future<UserCredential?> register(ParamsRegisterUser params);
  Future<UserCredential?> login(ParamsLoginUser params);
  Future<void> saveUserData(MUser user);
  Future<MUser?> getUser(String uid);
  Future<bool> logout();
}
