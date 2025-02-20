import 'package:monster/core/utils/enums.dart';

class ParamsAddJop {
  final String? uid;
  final String? title;
  final String? description;
  final List<String>? skills;
  final String? experience;
  final String? qualification;
  final String? location;
  final String? fromSalary;
  final String? toSalary;
  final List<String>? jobType;
  final String? applicationDeadline;
  final String? numberOfCandidates;
  final ENJobStatus? status;

  ParamsAddJop({
    this.uid,
    this.title,
    this.description,
    this.skills,
    this.experience,
    this.qualification,
    this.location,
    this.fromSalary,
    this.toSalary,
    this.jobType,
    this.applicationDeadline,
    this.numberOfCandidates,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'skills': skills,
      'experience': experience,
      'qualification': qualification,
      'location': location,
      'fromSalary': fromSalary,
      'toSalary': toSalary,
      'jobType': jobType,
      'applicationDeadline': applicationDeadline,
      'status': status?.name ?? ENJobStatus.Draft.name,
      'numberOfCandidates': numberOfCandidates,
    };
  }
}
