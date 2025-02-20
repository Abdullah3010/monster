import 'package:monster/modules/auth/data/models/m_user.dart';

abstract class DSAuthLocal {
  MUser? read();

  Future<void> createUpdate(MUser data);

  Future<bool> clear();
}
