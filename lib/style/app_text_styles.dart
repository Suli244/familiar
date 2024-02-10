import 'package:flutter/material.dart';

const fonst = 'Rubik-Regular';

abstract class AppTextStyles {
  static TextStyle s10Wbold({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
  static TextStyle s16W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );
  static TextStyle s21W600({Color? color}) => TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );
}
