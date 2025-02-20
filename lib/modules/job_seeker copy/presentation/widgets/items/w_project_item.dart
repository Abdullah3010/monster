import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WProjectItem extends StatelessWidget {
  const WProjectItem({
    super.key,
    required this.name,
    required this.from,
    required this.to,
    required this.link,
  });

  final String name;
  final String from;
  final String to;
  final String link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // link.launchURL();
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 280.w,
                child: Text(
                  name,
                  style: context.textTheme.navyBlue16w600,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$from-$to',
                style: context.textTheme.navyBlue16w400,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              Assets.icons.rightArrow.path,
            ),
          ),
        ],
      ),
    );
  }
}
