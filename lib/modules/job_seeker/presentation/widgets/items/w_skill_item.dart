import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WSkillItem extends StatelessWidget {
  const WSkillItem({
    super.key,
    required this.skill,
    required this.rating,
  });

  final String skill;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          skill,
          style: context.textTheme.navyBlue16w600,
        ),
        const Spacer(),
        ...List.generate(
          5,
          (index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: index < rating
                  ? SvgPicture.asset(
                      Assets.icons.orangeCircle.path,
                    )
                  : SvgPicture.asset(
                      Assets.icons.greyCircle.path,
                    ),
            );
          },
        ),
      ],
    );
  }
}
