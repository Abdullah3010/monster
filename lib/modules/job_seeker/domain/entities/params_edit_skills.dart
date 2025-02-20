import 'package:monster/core/constants/constants.dart';
import 'package:monster/modules/job_seeker/data/models/m_skill.dart';

class ParamsEditSkills {
  final String? uid;
  final List<MSkill>? skills;

  ParamsEditSkills({
    this.uid,
    this.skills,
  });

  Map<String, dynamic> toJson() {
    return {
      Constants.collections.skills: skills?.map((e) => e.toJson()).toList(),
    };
  }
}
