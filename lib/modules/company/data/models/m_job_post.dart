import 'package:monster/core/utils/enums.dart';

class MJobPost {
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

  MJobPost({
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

  factory MJobPost.fromJson(Map<String, dynamic>? json) {
    return MJobPost(
      title: json?['title'],
      description: json?['description'],
      skills: List<String>.from(json?['skills'] ?? []),
      experience: json?['experience'],
      qualification: json?['qualification'],
      location: json?['location'],
      fromSalary: json?['fromSalary'],
      toSalary: json?['toSalary'],
      jobType: List<String>.from(json?['jobType'] ?? []),
      applicationDeadline: json?['applicationDeadline'],
      numberOfCandidates: json?['numberOfCandidates'],
      status: ENJobStatus.values.firstWhere(
        (element) => element.name == json?['status'],
        orElse: () => ENJobStatus.Open,
      ),
    );
  }
}
