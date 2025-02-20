import 'package:flutter/material.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';

class WEducationItem extends StatelessWidget {
  const WEducationItem({
    super.key,
    required this.name,
    required this.from,
    required this.to,
  });

  final String name;
  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: context.textTheme.navyBlue16w600,
        ),
        Text(
          '$from-$to',
          style: context.textTheme.navyBlue16w400,
        ),
      ],
    );
  }
}
