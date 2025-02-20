import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox createHorizontalGep() {
    return SizedBox(
      width: toDouble(),
    );
  }

  SizedBox createVerticalGep() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
