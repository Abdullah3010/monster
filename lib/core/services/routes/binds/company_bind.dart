import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/modules/company/data/repo_imp/r_company_imp.dart';
import 'package:monster/modules/company/data/sources/remote/ds_company_remote.dart';
import 'package:monster/modules/company/data/sources/remote/ds_company_remote_imp.dart';
import 'package:monster/modules/company/domain/repos/r_company.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';

class CompanyBind {
  static void binds(Injector i) {
    /// [Data Sources]
    i.add<DSCompanyRemote>(DSCompanyRemoteImp.new);

    /// [Repo]
    i.add<RCompany>(RCompanyImp.new);

    i.addLazySingleton(CompanyCubit.new);
  }
}
