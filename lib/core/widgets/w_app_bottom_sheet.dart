import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/widgets/w_app_button.dart';

class WAppBottomSheet extends StatelessWidget {
  const WAppBottomSheet({
    super.key,
    required this.mainActionTitle,
    required this.onMainAction,
    this.titleText,
    this.titleWidget,
    required this.child,
  });

  final Widget child;
  final String mainActionTitle;
  final void Function() onMainAction;

  final String? titleText;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 10.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30.h,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 55.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.navyBlue,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Modular.to.pop(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.close.path,
                    colorFilter: ColorFilter.mode(
                      context.theme.colorScheme.navyBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (titleWidget != null) titleWidget ?? const SizedBox(),
          if (titleText != null && titleWidget == null && titleText?.isEmpty == false)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleText ?? '',
                  style: context.textTheme.navyBlue24w700,
                ),
              ],
            ),
          30.verticalSpace,
          child,
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: WAppButton(
                  title: mainActionTitle,
                  onTap: onMainAction,
                ),
              ),
              60.horizontalSpace,
              Expanded(
                child: WAppButton(
                  title: 'Cancel',
                  isFilled: false,
                  onTap: () {
                    Modular.to.pop();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
