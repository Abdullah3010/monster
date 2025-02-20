// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

part 'enums.g.dart';

enum ErrorLevels {
  DEBUG,
  INFO,
  ERROR,
  CRITICAL,
}

enum ENJobStatus {
  Open,
  Draft,
  Closed,
}

@HiveType(typeId: 1)
enum ENUserType {
  @HiveField(0)
  JobSeeker,
  @HiveField(1)
  Company,
}
