import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WCertifecateItem extends StatelessWidget {
  const WCertifecateItem({
    super.key,
    required this.certifecate,
  });

  final String certifecate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(7),
          child: SvgPicture.asset(
            Assets.icons.doc.path,
          ),
        ),
        SizedBox(
          width: 200.w,
          child: Text(
            certifecate,
            style: context.textTheme.navyBlue14w300,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.icons.more.path,
        ),
      ],
    );
  }
}
