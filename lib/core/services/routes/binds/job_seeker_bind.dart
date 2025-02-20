import 'package:flutter_modular/flutter_modular.dart';
import 'package:monster/modules/job_seeker/data/repo_imp/r_job_seeker_imp.dart';
import 'package:monster/modules/job_seeker/data/sources/remote/ds_job_seeker_remote.dart';
import 'package:monster/modules/job_seeker/data/sources/remote/ds_job_seeker_remote_imp.dart';
import 'package:monster/modules/job_seeker/domain/repos/r_job_seeker.dart';
import 'package:monster/modules/job_seeker/presentation/cubit/job_seeker_cubit.dart';

class JobSeekerBind {
  static void binds(Injector i) {
    /// [Data Sources]
    i.add<DSJobSeekerRemote>(DSJobSeekerRemoteImp.new);

    /// [Repo]
    i.add<RJobSeeker>(RJobSeekerImp.new);

    i.addLazySingleton(JobSeekerCubit.new);
  }
}
