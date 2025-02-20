import 'package:monster/modules/company/data/models/m_basic_info.dart';
import 'package:monster/modules/company/data/models/m_job_post.dart';
import 'package:monster/modules/company/data/models/m_social_links.dart';
import 'package:monster/modules/company/domain/entities/params_add_jop.dart';
import 'package:monster/modules/company/domain/entities/params_edit_basic_info.dart';
import 'package:monster/modules/company/domain/entities/params_edit_social_links.dart';

abstract class RCompany {
  /// [Basic Info]
  Future<bool> editBasicInfo(ParamsEditBasicInfo params);
  Future<MBasicInfo?> getBasicInfo();

  /// [Social Links]
  Future<bool> editSocialLinks(ParamsEditSocialLinks params);
  Future<List<MSocialLinks>?> getSocialLinks();

  /// [Jops]
  Future<bool> addNewJob(ParamsAddJop params);
  Future<List<MJobPost>?> getAllJobs();
}
