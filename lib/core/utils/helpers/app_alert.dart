import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:toastification/toastification.dart';

class AppAlert {
  static void success(String text) {}

  static Future<void> error(
    String message, {
    Color backgroundColor = Colors.red,
    int seconds = 3,
  }) async {
    toastification.show(
      title: Text(message, textAlign: TextAlign.center, maxLines: 2),
      borderRadius: BorderRadius.circular(50.r),
      primaryColor: Constants.navigatorKey.currentContext?.theme.colorScheme.white,
      foregroundColor: Constants.navigatorKey.currentContext?.theme.colorScheme.white,
      backgroundColor: backgroundColor.withValues(alpha: .75),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: Duration(seconds: seconds),
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      closeButtonShowType: CloseButtonShowType.none,
      showProgressBar: false,
      closeOnClick: true,
      icon: const Icon(
        Icons.error,
      ),
      callbacks: const ToastificationCallbacks(),
    );
  }
}
