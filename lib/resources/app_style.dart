import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppStyle {

  // Gap
  static Gap gap(double size) => Gap(size);

  // Padding
  static EdgeInsets padding(double value) => EdgeInsets.all(value);
  static EdgeInsets paddingSymmetric({
    double horizontal = 0,
    double vertical = 0
  }) => EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  // Margin
  static EdgeInsets margin(double value) => EdgeInsets.all(value);
  static EdgeInsets marginSymmetric({
    double horizontal = 0,
    double vertical = 0
  }) => EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  // Border Radius
  static BorderRadius radius(double value) => BorderRadius.all(Radius.circular(value));

  static TextStyle textStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'anek',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );

  }

  static TextStyle boldTextStyle({
    double fontSize = 14,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'anek',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static double fontSize12 = 12.0;
  static double fontSize14 = 14.0;
  static double fontSize15 = 15.0;
  static double fontSize16 = 16.0;
  static double fontSize18 = 18.0;
}