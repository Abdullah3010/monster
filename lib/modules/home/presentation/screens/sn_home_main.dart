import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/core/widgets/w_shared_app_bar.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';
import 'package:monster/modules/auth/data/models/m_user.dart';
import 'package:monster/modules/auth/domain/repos/r_auth.dart';
import 'package:monster/modules/company/presentation/screens/sn_company_home.dart';
import 'package:monster/modules/job_seeker/presentation/screens/sn_job_seeker_home.dart';

class SNHomeMain extends StatefulWidget {
  const SNHomeMain({super.key});

  @override
  State<SNHomeMain> createState() => _SNHomeMainState();
}

class _SNHomeMainState extends State<SNHomeMain> {
  late MUser? user;
  @override
  void initState() {
    super.initState();
    user = Modular.get<RAuth>().getActiveUser();
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      appBar: WSharedAppBar(
        leading: Text.rich(
          TextSpan(
            text: 'Welcome ',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: context.theme.colorScheme.navyBlue,
            ),
            children: [
              TextSpan(
                text: user?.fullName?.split(' ').elementAtOrNull(0) ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  color: context.theme.colorScheme.orange,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              user?.userType == ENUserType.JobSeeker ? const SNJobSeekerHome() : const SNCompanyHome(),
            ],
          ),
        ),
      ),
    );
  }
}
