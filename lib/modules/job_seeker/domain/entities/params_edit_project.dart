import 'package:monster/core/constants/constants.dart';
import 'package:monster/modules/job_seeker/data/models/m_project.dart';

class ParamsEditProject {
  final String? uid;
  final List<MProject>? projects;

  ParamsEditProject({
    this.uid,
    this.projects,
  });

  Map<String, dynamic> toJson() {
    projects?.removeWhere((element) => element.isValid == false);

    return {
      Constants.collections.projects: projects?.map((e) => e.toJson()).toList(),
    };
  }
}
