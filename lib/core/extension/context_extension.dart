import 'package:flutter/material.dart';

/// [ContextExtension] is a class that contains all context extensions.
extension ContextExtension on BuildContext {
  /// [height] is a double that contains information about screen height.
  double get height => MediaQuery.of(this).size.height;

  /// [width] is a double that contains information about screen width.
  double get width => MediaQuery.of(this).size.width;

  /// [shortestSide] is a double that contains information about screen shortest side.
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  /// [longestSide] is a double that contains information about screen longest side.
  double get longestSide => MediaQuery.of(this).size.longestSide;

  /// [orientation] is a [Orientation] that contains information about screen orientation.
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// [theme] is a [ThemeData] that contains information about screen theme.
  ThemeData get theme => Theme.of(this);

  /// [textTheme] is a [TextTheme] that contains information about screen text theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [hideKeyBoard] is a Void to close opening keyboard when the user click on any empty space in the screen
  void get hideKeyBoard => FocusScope.of(this).requestFocus(FocusNode());
}
