import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/job_seeker/data/models/m_education.dart';
import 'package:monster/modules/job_seeker/data/models/m_job.dart';
import 'package:monster/modules/job_seeker/data/models/m_preferences.dart';
import 'package:monster/modules/job_seeker/data/models/m_project.dart';
import 'package:monster/modules/job_seeker/data/models/m_references.dart';
import 'package:monster/modules/job_seeker/data/models/m_skill.dart';
import 'package:monster/modules/job_seeker/data/sources/remote/ds_job_seeker_remote.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_education.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_jobs.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_preferences.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_project.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_references.dart';
import 'package:monster/modules/job_seeker/domain/entities/params_edit_skills.dart';
import 'package:monster/modules/job_seeker/domain/repos/r_job_seeker.dart';

class RJobSeekerImp extends RJobSeeker {
  final DSJobSeekerRemote remote;

  RJobSeekerImp({
    required this.remote,
  });

  @override
  Future<bool> editJob(ParamsEditJobs params) async {
    try {
      return await remote.editJob(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editJob',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<MJob?> getJob() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getJob(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getJob',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editPreferences(ParamsEditPreferences params) async {
    try {
      return await remote.editPreferences(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editPreferences',
        error: e,
        stackTrace: st,
      );
    }

    return false;
  }

  @override
  Future<MPreferences?> getPreferences() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getPreferences(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getPreferences',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editSkills(ParamsEditSkills params) async {
    try {
      return await remote.editSkills(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editSkills',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MSkill>?> getSkills() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getSkills(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getSkills',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editEducation(ParamsEditEducation params) async {
    try {
      return await remote.editEducation(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editEducation',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MEducation>?> getEducation() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getEducation(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getEducation',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editProject(ParamsEditProject params) async {
    try {
      return await remote.editProject(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editProject',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MProject>?> getProject() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getProject(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getProject',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editReferences(ParamsEditReferences params) async {
    try {
      return await remote.editReferences(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.editReferences',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MReferences>?> getReferences() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getReferences(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RJobSeekerImp.getReferences',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }
}
