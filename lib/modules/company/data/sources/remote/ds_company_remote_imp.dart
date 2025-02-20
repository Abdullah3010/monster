import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
import 'package:monster/modules/company/data/models/m_basic_info.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/data/models/m_social_links.dart';
import 'package:monster/modules/company/data/sources/remote/ds_company_remote.dart';
import 'package:monster/modules/company/domain/entities/params_add_jop.dart';
import 'package:monster/modules/company/domain/entities/params_edit_basic_info.dart';
import 'package:monster/modules/company/domain/entities/params_edit_social_links.dart';

class DSCompanyRemoteImp implements DSCompanyRemote {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> editBasicInfo(ParamsEditBasicInfo params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profile)
          .doc(Constants.collections.basicInfo)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.editBasicInfo',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<MBasicInfo?> getBasicInfo(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> basicInfo = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profile)
          .doc(Constants.collections.basicInfo)
          .get();
      if (basicInfo.exists) {
        return MBasicInfo.fromJson(basicInfo.data());
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.getBasicInfo',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editSocialLinks(ParamsEditSocialLinks params) async {
    try {
      await firestore
          .collection(Constants.collections.users)
          .doc(params.uid)
          .collection(Constants.collections.profile)
          .doc(Constants.collections.socialLinks)
          .set(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.editSocialLinks',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MSocialLinks>?> getSocialLinks(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> socialLinks = await firestore
          .collection(Constants.collections.users)
          .doc(uid)
          .collection(Constants.collections.profile)
          .doc(Constants.collections.socialLinks)
          .get();
      if (socialLinks.exists) {
        return List<MSocialLinks>.from(
          socialLinks.data()![Constants.collections.socialLinks]?.map((e) => MSocialLinks.fromJson(e)),
        );
      }
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.getSocialLinks',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> addNewJob(ParamsAddJop params) async {
    try {
      await firestore
          .collection(Constants.collections.jobPosts)
          .doc(params.uid)
          .collection(Constants.collections.jobs)
          .add(params.toJson());
      return true;
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.addNewJob',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MJobPost>?> getAllJobs(String uid) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> jobPosts = await firestore
          .collection(Constants.collections.jobPosts)
          .doc(uid)
          .collection(Constants.collections.jobs)
          .get();
      return List<MJobPost>.from(
        jobPosts.docs.map((e) => MJobPost.fromJson(e.data())),
      );
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'DSCompanyRemoteImp.getAllJobs',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }
}
