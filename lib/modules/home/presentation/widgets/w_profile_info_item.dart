import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WProfileInfoItem extends StatelessWidget {
  const WProfileInfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.emptyStateMessage,
    this.value,
  });

  final String icon;
  final String title;
  final String emptyStateMessage;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: 20.w,
          height: 20.h,
        ),
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.blue14w400,
            ),
            SizedBox(
              width: context.width * 0.75,
              child: Text(
                (value?.isEmpty ?? true) ? emptyStateMessage : value ?? '',
                style: (value?.isEmpty ?? true) ? context.textTheme.navyBlue14w300 : context.textTheme.navyBlue16w400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
