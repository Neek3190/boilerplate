import 'package:flutter/material.dart';

import 'app_color.dart';

appTextStyle({
  required double fontSize,
  bool isBold = false,
  Color? colour,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
  TextDecoration? textDecoration,
  TextOverflow? textOverflow,
  double height = 0.0,
}) =>
    TextStyle(
      decoration: textDecoration,
      overflow: textOverflow,
      fontSize: fontSize,
      color: colour ?? AppColor.white,
      fontStyle: fontStyle,
      height: height,
      fontWeight: isBold == true ? FontWeight.bold : fontWeight,
    );
