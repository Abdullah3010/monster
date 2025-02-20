import 'package:monster/core/utils/enums.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';

class ParamsRegisterUser {
  ParamsRegisterUser({
    this.userType,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.password,
    this.dateOfBirth,
    this.address,
    this.imageUrl,
  });

  final ENUserType? userType;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? dateOfBirth;
  final String? address;
  final String? imageUrl;
  String? uid;

  MUser toModel() {
    return MUser(
      uid: uid,
      userType: userType,
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
      dateOfBirth: dateOfBirth,
      address: address,
      imageUrl: imageUrl,
    );
  }
}
