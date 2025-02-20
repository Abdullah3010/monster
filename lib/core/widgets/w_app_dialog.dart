import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/widgets/w_app_button.dart';

class WAppDialog extends StatelessWidget {
  const WAppDialog({
    super.key,
    required this.mainActionTitle,
    required this.secondActionTitle,
    required this.onMainAction,
    required this.onSecondAction,
    this.withExit = true,
    this.titleText,
    this.description,
    this.radius,
    this.padding,
  });

  final String mainActionTitle;
  final String secondActionTitle;
  final void Function() onMainAction;
  final void Function() onSecondAction;
  final String? titleText;
  final String? description;
  final bool withExit;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 340.w,
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 15.h,
                ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.white,
              borderRadius: BorderRadius.circular(radius ?? 20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                30.verticalSpace,
                Text(
                  titleText ?? '',
                  textAlign: TextAlign.center,
                  style: context.textTheme.navyBlue16w400,
                ),
                if (description != null) ...[
                  20.verticalSpace,
                  Text(
                    description ?? '',
                    textAlign: TextAlign.center,
                    style: context.textTheme.grey16w400,
                  ),
                ],
                50.verticalSpace
              ],
            ),
          ),
          if (withExit)
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () {
                  Modular.to.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    Assets.icons.close.path,
                    colorFilter: ColorFilter.mode(
                      context.theme.colorScheme.navyBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: -50,
            child: SizedBox(
              width: 330.w,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WAppButton(
                    width: 120.w,
                    title: mainActionTitle,
                    onTap: onMainAction,
                    bottonColor: context.theme.colorScheme.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                  14.horizontalSpace,
                  WAppButton(
                    width: 120.w,
                    title: secondActionTitle,
                    isFilled: false,
                    onTap: onSecondAction,
                    bottonColor: context.theme.colorScheme.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
