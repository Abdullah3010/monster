import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExtension on TextTheme {
  /// [Navy Ble]
  TextStyle get navyBlue18w800Italic => TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18.sp,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.italic,
        color: const Color(0xff233B52),
      );

  TextStyle get navyBlue14w300 => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );
  TextStyle get navyBlue14w400 => TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );

  TextStyle get navyBlue16w400 => TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );

  TextStyle get navyBlue16w600 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );
  TextStyle get navyBlue16w900 => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );
  TextStyle get navyBlue24w700 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff233B52),
      );

  /// [Blue]
  TextStyle get blue14w400 => TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff5E9AD2),
      );

  /// [Orange]
  TextStyle get orange14w400 => TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xffF08C2B),
      );

  TextStyle get orange14w600 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xffF08C2B),
      );

  /// [White]
  TextStyle get white14w600 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        color: const Color(0xfff5f5f5),
      );

  TextStyle get white16w600 => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xfff5f5f5),
      );

  TextStyle get white18w700 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        fontFamily: 'Poppins',
        color: const Color(0xfff5f5f5),
      );

  /// [Grey]
  TextStyle get grey16w400 => TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff5E5E5E),
      );

  /// [Black]
  TextStyle get black16W400 => TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        color: const Color(0xff222222),
      );

  TextStyle get titleMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
      );

  TextStyle get titleRegular_18 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        fontFamily: 'Poppins',
      );

  /// [Body]
  TextStyle get bodyMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
      );

  TextStyle get bodyMedium_14 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        letterSpacing: -0.30.w,
      );

  TextStyle get bodyRegular_16 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
      );

  TextStyle get bodyRegular_14 => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        letterSpacing: -0.30.w,
        fontFamily: 'Poppins',
      );

  /// [Button]
  TextStyle get buttonMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
      );

  TextStyle get buttonMedium_14 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        letterSpacing: -0.30.w,
      );

  TextStyle get buttonMedium_12 => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        fontFamily: 'Poppins',
      );

  /// [Text line]
  TextStyle get textLineMedium_16 => TextStyle(
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
      );

  TextStyle get textLineRegular_14 => TextStyle(
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
      );
}
