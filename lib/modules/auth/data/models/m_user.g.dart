// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MUserAdapter extends TypeAdapter<MUser> {
  @override
  final int typeId = 0;

  @override
  MUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MUser(
      uid: fields[0] as String?,
      fullName: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      email: fields[4] as String?,
      dateOfBirth: fields[5] as String?,
      address: fields[6] as String?,
      imageUrl: fields[7] as String?,
      userType: fields[1] as ENUserType?,
    );
  }

  @override
  void write(BinaryWriter writer, MUser obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.userType)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.dateOfBirth)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
