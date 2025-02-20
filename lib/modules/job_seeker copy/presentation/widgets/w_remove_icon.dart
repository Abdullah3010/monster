import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';

class WRemoveIcon extends StatelessWidget {
  const WRemoveIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.colorScheme.red,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Divider(
          color: context.theme.colorScheme.red,
          indent: 5.w,
          endIndent: 5.w,
        ),
      ),
    );
  }
}
