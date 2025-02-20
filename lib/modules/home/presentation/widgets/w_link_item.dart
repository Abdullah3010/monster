import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WLinkItem extends StatelessWidget {
  const WLinkItem({
    super.key,
    required this.referenceName,
    required this.referenceUrl,
  });

  final String referenceName;
  final String referenceUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.icons.link.path,
          ),
        ),
        SizedBox(
          width: 250.w,
          child: Text(
            referenceName,
            style: context.textTheme.navyBlue16w400,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.icons.rightArrow.path,
          ),
        ),
      ],
    );
  }
}
