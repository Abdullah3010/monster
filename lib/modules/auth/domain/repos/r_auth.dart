import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/domain/entities/params_login_user.dart';
import 'package:monster/modules/auth/domain/entities/params_register_user.dart';

abstract class RAuth {
  Future<bool> register(ParamsRegisterUser params);

  Future<bool> login(ParamsLoginUser params);

  MUser? getActiveUser();
}
