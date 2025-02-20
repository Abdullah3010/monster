import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/modules/company/presentation/widgets/items/w_job_status.dart';

class WJobItem extends StatelessWidget {
  const WJobItem({
    super.key,
    required this.jobName,
    required this.numberOfCandidates,
    required this.status,
  });

  final String jobName;
  final String numberOfCandidates;
  final ENJobStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobName,
                style: context.textTheme.navyBlue16w900,
              ),
              4.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.people.path,
                  ),
                  4.horizontalSpace,
                  Text(
                    '$numberOfCandidates Candidates',
                    style: context.textTheme.blue14w400,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          WJobStatus(status: status),
        ],
      ),
    );
  }
}
