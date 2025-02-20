import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
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

class DSJobSeekerRemoteImp implements DSJobSeekerRemote {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> editJob(ParamsEditJobs params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profilePreferences)
          .doc(Constants.collections.jobs)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editJob',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<MJob?> getJob(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> job = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profilePreferences)
          .doc(Constants.collections.jobs)
          .get();
      if (job.exists) {
        return MJob.fromJson(job.data());
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getJob',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editPreferences(ParamsEditPreferences params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profilePreferences)
          .doc(Constants.collections.preferences)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editPreferences',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<MPreferences?> getPreferences(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> preferences = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profilePreferences)
          .doc(Constants.collections.preferences)
          .get();
      if (preferences.exists) {
        return MPreferences.fromJson(preferences.data());
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getPreferences',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editSkills(ParamsEditSkills params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.skills)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editSkills',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MSkill>?> getSkills(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> skills = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.skills)
          .get();
      if (skills.exists) {
        return List<MSkill>.from(
          skills.data()![Constants.collections.skills]?.map((e) => MSkill.fromJson(e)),
        );
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getSkills',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editEducation(ParamsEditEducation params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.education)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editEducation',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MEducation>?> getEducation(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> educations = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.education)
          .get();
      if (educations.exists) {
        return List<MEducation>.from(
          educations.data()![Constants.collections.education]?.map((e) => MEducation.fromJson(e)),
        );
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getEducation',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editProject(ParamsEditProject params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.projects)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editProject',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MProject>?> getProject(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> projects = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.projects)
          .get();
      if (projects.exists) {
        return List<MProject>.from(
          projects.data()![Constants.collections.projects]?.map((e) => MProject.fromJson(e)),
        );
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getProject',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editReferences(ParamsEditReferences params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.references)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.editReferences',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MReferences>?> getReferences(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> references = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profissionalDetails)
          .doc(Constants.collections.references)
          .get();
      if (references.exists) {
        return List<MReferences>.from(
          references.data()![Constants.collections.references]?.map((e) => MReferences.fromJson(e)),
        );
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSJobSeekerRemoteImp.getReferences',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }
}
