import 'package:flutter/material.dart';
import 'package:monster/core/constants/constants.dart';
import 'package:monster/core/widgets/w_app_bottom_sheet.dart';
import 'package:monster/core/widgets/w_app_dialog.dart';

class AppDialogs {
  static void showBottomSheet({
    required String mainActionTitle,
    required void Function() onMainAction,
    required Widget child,
    String? titleText,
    Widget? titleWidget,
  }) {
    try {
      showModalBottomSheet(
        context: Constants.navigatorKey.currentContext!,
        backgroundColor: Colors.transparent,
        elevation: 0,
        isScrollControlled: true,
        builder: (context) {
          return WAppBottomSheet(
            mainActionTitle: mainActionTitle,
            onMainAction: onMainAction,
            titleText: titleText,
            titleWidget: titleWidget,
            child: child,
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static void dialog({
    required String mainActionTitle,
    required String secondActionTitle,
    required void Function() onMainAction,
    required void Function() onSecondAction,
    String? titleText,
    String? description,
    bool? withExit,
    double? radius,
    EdgeInsetsGeometry? padding,
  }) {
    showDialog(
      context: Constants.navigatorKey.currentContext!,
      barrierDismissible: !(withExit ?? false),
      builder: (context) {
        return WAppDialog(
          mainActionTitle: mainActionTitle,
          secondActionTitle: secondActionTitle,
          onMainAction: onMainAction,
          onSecondAction: onSecondAction,
          titleText: titleText,
          description: description,
          radius: radius,
          withExit: withExit ?? true,
          padding: padding,
        );
      },
    );
  }
}
