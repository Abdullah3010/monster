import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/modules/job_seeker/presentation/widgets/items/w_certifecate_item.dart';

class WCertificationsSection extends StatelessWidget {
  const WCertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Certifications',
              style: context.textTheme.navyBlue18w800Italic,
            ),
            Text(
              'Add',
              style: context.textTheme.orange14w400,
            )
          ],
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 12.w,
          ),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.white,
            borderRadius: BorderRadius.circular(2.r),
          ),
          child: Column(
            children: [
              const WCertifecateItem(
                certifecate: 'UI UX Course.pdf',
              ),
              16.verticalSpace,
              const WCertifecateItem(
                certifecate: 'Project Management.pdf',
              ),
              16.verticalSpace,
              const WCertifecateItem(
                certifecate: 'Loremipsum lorem ipsum lore ipsum.pdf',
              ),
            ],
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
