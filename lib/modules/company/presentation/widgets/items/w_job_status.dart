import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/enums.dart';

class WJobStatus extends StatefulWidget {
  const WJobStatus({
    super.key,
    required this.status,
  });

  final ENJobStatus status;

  @override
  State<WJobStatus> createState() => _WJobStatusState();
}

class _WJobStatusState extends State<WJobStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color: colorStatus(),
      ),
      child: Text(
        widget.status.name,
        style: context.textTheme.white14w600,
      ),
    );
  }

  Color colorStatus() {
    switch (widget.status) {
      case ENJobStatus.Open:
        return context.theme.colorScheme.lightGreen;
      case ENJobStatus.Draft:
        return context.theme.colorScheme.orange;
      case ENJobStatus.Closed:
        return context.theme.colorScheme.black;
    }
  }
}
