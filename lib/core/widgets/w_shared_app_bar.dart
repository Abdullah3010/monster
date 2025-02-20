import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';

class WSharedAppBar extends StatelessWidget {
  const WSharedAppBar({
    super.key,
    this.leading,
    this.title,
    this.withBack = false,
  });

  final Widget? leading;
  final String? title;
  final bool withBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (withBack) ...[
          InkWell(
            onTap: () {
              Modular.to.pop();
            },
            child: SvgPicture.asset(
              Assets.icons.backArrow.path,
            ),
          ),
          8.horizontalSpace,
        ],
        if (leading != null)
          leading ?? Container()
        else if (leading == null && title != null)
          Text(
            title ?? '',
            style: context.textTheme.navyBlue16w900,
          ),
        const Spacer(),
        InkWell(
          onTap: () {
            Modular.to.pushNamed(RoutesNames.profile.profile);
          },
          child: Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.navyBlue,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: SvgPicture.asset(
              Assets.icons.user.path,
            ),
          ),
        )
      ],
    );
  }
}
