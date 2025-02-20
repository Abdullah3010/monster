import 'package:monster/core/constants/constants.dart';
import 'package:monster/modules/job_seeker/data/models/m_education.dart';

class ParamsEditEducation {
  final String? uid;
  final List<MEducation>? educations;

  ParamsEditEducation({
    this.uid,
    this.educations,
  });

  Map<String, dynamic> toJson() {
    educations?.removeWhere((element) => element.isValid == false);
    return {
      Constants.collections.education: educations?.map((e) => e.toJson()).toList(),
    };
  }
}
