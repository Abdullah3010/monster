import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/modules/company/presentation/cubit/company_cubit.dart';
import 'package:monster/modules/company/presentation/widgets/items/w_job_item.dart';

class WJobs extends StatefulWidget {
  const WJobs({super.key});

  @override
  State<WJobs> createState() => _WJobsState();
}

class _WJobsState extends State<WJobs> {
  final CompanyCubit companyCubit = Modular.get<CompanyCubit>();

  @override
  void initState() {
    super.initState();
    companyCubit.getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      bloc: companyCubit,
      builder: (context, state) {
        return Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: context.height * 0.7,
                child: ListView.builder(
                  itemCount: companyCubit.jobPosts?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Modular.to.pushNamed(
                          RoutesNames.home.addJob,
                          arguments: companyCubit.jobPosts?[index],
                        );
                      },
                      child: WJobItem(
                        jobName: companyCubit.jobPosts?[index].title ?? '',
                        numberOfCandidates: '$index',
                        status: companyCubit.jobPosts?[index].status ?? ENJobStatus.Draft,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 160.h,
                right: 15.w,
                child: InkWell(
                  onTap: () => Modular.to.pushNamed(RoutesNames.home.addJob),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.orange,
                    ),
                    child: Icon(
                      Icons.add,
                      color: context.theme.colorScheme.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
