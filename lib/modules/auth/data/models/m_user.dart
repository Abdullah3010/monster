import 'package:hive_flutter/hive_flutter.dart';
import 'package:monster/core/utils/enums.dart';
part 'm_user.g.dart';

@HiveType(typeId: 0)
class MUser {
  MUser({
    this.uid,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.dateOfBirth,
    this.address,
    this.imageUrl,
    this.userType,
  });

  factory MUser.fromJson(Map<String, dynamic>? json) {
    return MUser(
      uid: json?['uid'],
      fullName: json?['fullName'],
      phoneNumber: json?['phoneNumber'],
      email: json?['email'],
      dateOfBirth: json?['dateOfBirth'],
      address: json?['address'],
      imageUrl: json?['imageUrl'],
      userType: json?['userType'] != null
          ? ENUserType.values.firstWhere(
              (element) => element.name == json?['userType'],
              orElse: () => ENUserType.JobSeeker,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid ?? '',
      'userType': userType?.name ?? '',
      'fullName': fullName ?? '',
      'phoneNumber': phoneNumber ?? '',
      'email': email ?? '',
      'dateOfBirth': dateOfBirth ?? '',
      'address': address ?? '',
      'imageUrl': imageUrl ?? '',
    };
  }

  @HiveField(0)
  final String? uid;
  @HiveField(1)
  final ENUserType? userType;
  @HiveField(2)
  final String? fullName;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? dateOfBirth;
  @HiveField(6)
  final String? address;
  @HiveField(7)
  final String? imageUrl;
}
