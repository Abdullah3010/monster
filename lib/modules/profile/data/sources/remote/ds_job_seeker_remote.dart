import 'package:monster/modules/job_seeker/data/models/m_education.dart';
import 'package:monster/modules/job_seeker/data/models/m_job.dart';
import 'package:monster/modules/job_seeker/data/models/m_preferences.dart';
import 'package:monster/modules/job_seeker/data/models/m_project.dart';
import 'package:monster/modules/job_seeker/data/models/m_references.dart';
import 'package:monster/modules/job_seeker/data/models/m_skill.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_education.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_jobs.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_preferences.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_project.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_references.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_skills.dart';

abstract class DSJobSeekerRemote {
  /// [Job]
  Future<bool> editJob(ParamsEditJobs params);
  Future<MJob?> getJob(String uid);

  /// [Preferences]
  Future<bool> editPreferences(ParamsEditPreferences params);
  Future<MPreferences?> getPreferences(String uid);

  /// [Skills]
  Future<bool> editSkills(ParamsEditSkills params);
  Future<List<MSkill>?> getSkills(String uid);

  /// [Education]
  Future<bool> editEducation(ParamsEditEducation params);
  Future<List<MEducation>?> getEducation(String uid);

  /// [Project]
  Future<bool> editProject(ParamsEditProject params);
  Future<List<MProject>?> getProject(String uid);

  /// [References]
  Future<bool> editReferences(ParamsEditReferences params);
  Future<List<MReferences>?> getReferences(String uid);
}
