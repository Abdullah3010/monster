// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ENUserTypeAdapter extends TypeAdapter<ENUserType> {
  @override
  final int typeId = 1;

  @override
  ENUserType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ENUserType.JobSeeker;
      case 1:
        return ENUserType.Company;
      default:
        return ENUserType.JobSeeker;
    }
  }

  @override
  void write(BinaryWriter writer, ENUserType obj) {
    switch (obj) {
      case ENUserType.JobSeeker:
        writer.writeByte(0);
        break;
      case ENUserType.Company:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ENUserTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
