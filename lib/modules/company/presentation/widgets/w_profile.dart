import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/modules/company/presentation/widgets/section/w_basic_info_section.dart';
import 'package:monster/modules/company/presentation/widgets/section/w_social_links_section.dart';

class WProfile extends StatelessWidget {
  const WProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const WBasicInfoSection(),
        24.verticalSpace,
        const WSocialLinksSection(),
      ],
    );
  }
}
