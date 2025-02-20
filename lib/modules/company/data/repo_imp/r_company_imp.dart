import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/core/utils/helpers/error_helper.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/company/data/models/m_basic_info.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/data/models/m_social_links.dart';
import 'package:monster/modules/company/data/sources/remote/ds_company_remote.dart';
import 'package:monster/modules/company/domain/entities/params_add_jop.dart';
import 'package:monster/modules/company/domain/entities/params_edit_basic_info.dart';
import 'package:monster/modules/company/domain/entities/params_edit_social_links.dart';
import 'package:monster/modules/company/domain/repos/r_company.dart';

class RCompanyImp extends RCompany {
  final DSCompanyRemote remote;

  RCompanyImp({
    required this.remote,
  });

  @override
  Future<bool> editBasicInfo(ParamsEditBasicInfo params) async {
    try {
      return await remote.editBasicInfo(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.editBasicInfo',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<MBasicInfo?> getBasicInfo() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getBasicInfo(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.getBasicInfo',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> editSocialLinks(ParamsEditSocialLinks params) async {
    try {
      return await remote.editSocialLinks(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.editSocialLinks',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MSocialLinks>?> getSocialLinks() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getSocialLinks(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.getSocialLinks',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }

  @override
  Future<bool> addNewJob(ParamsAddJop params) async {
    try {
      return await remote.addNewJob(params);
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.addNewJob',
        error: e,
        stackTrace: st,
      );
    }
    return false;
  }

  @override
  Future<List<MJobPost>?> getAllJobs() async {
    try {
      final MUser? user = Modular.get<RAuth>().getActiveUser();
      if (user == null) {
        return null;
      }
      return await remote.getAllJobs(user.uid ?? '');
    } catch (e, st) {
      ErrorHelper.printDebugError(
        name: 'RCompanyImp.getAllJobs',
        error: e,
        stackTrace: st,
      );
    }
    return null;
  }
}
