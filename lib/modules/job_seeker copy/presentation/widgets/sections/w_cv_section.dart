import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/picker_helper.dart';

class WCvSection extends StatelessWidget {
  const WCvSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CV',
              style: context.textTheme.navyBlue18w800Italic,
            ),
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(7),
                child: SvgPicture.asset(
                  Assets.icons.doc.path,
                ),
              ),
              Text(
                'Dena Ghazi CV.pdf',
                style: context.textTheme.navyBlue14w300,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  PickerHelper.pickFile(allowedExtensions: ['pdf']);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.more.path,
                  ),
                ),
              ),
            ],
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
