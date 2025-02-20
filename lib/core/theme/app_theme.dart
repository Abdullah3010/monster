import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  ThemeData get lightTheme => ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xffD9DCE1),
          brightness: Brightness.light,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.black54,
        ),
        scaffoldBackgroundColor: const Color(0xffD9DCE1),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff233B52),
          ),
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff5E5E5E),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.r),
            borderSide: const BorderSide(
              color: Color(0xff233B52),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.r),
            borderSide: const BorderSide(
              color: Color(0xff233B52),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.r),
            borderSide: const BorderSide(
              color: Color(0xff233B52),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.r),
            borderSide: const BorderSide(
              color: Color(0xffD51A52),
            ),
          ),
        ),
      );
}
