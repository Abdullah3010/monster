import 'package:monster/core/utils/helpers/hive_box_base.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';

class HBoxUser extends HiveBoxBase<MUser> {
  HBoxUser() : super('user', MUserAdapter());
}
