import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/data/sources/local/ds_auth_local.dart';
import 'package:monster/modules/auth/data/sources/local/h_box_user.dart';

class DSAuthLocalImp implements DSAuthLocal {
  HBoxUser user = HBoxUser();

  @override
  MUser? read() => user.box.get(0);

  @override
  Future<void> createUpdate(MUser data) async {
    await user.box.put(0, data);
  }

  @override
  Future<bool> clear() async {
    await user.box.clear();
    return true;
  }
}
