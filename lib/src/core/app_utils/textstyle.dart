import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/font_family.dart';

textStyleNormal(
    {Color? color = AppColors.colorGrey,
    double? fontsize,
    double? letterSpacing,
    String? fontFamily,
    double? height,
    FontWeight? fontWeight}) {
  return TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: fontFamily ?? FontFamily.mazzard,
      letterSpacing: letterSpacing);
}

/* ===================================================== Text Style Medium ===================================================*/

TextStyle textStyleMedium(
    {Color? color = AppColors.colorGrey,
    double? fontsize = 14,
    double? letterSpacing,
    FontWeight? weight = FontWeight.w500,
    String? fontFamily,
    textBaseline,
    decoration}) {
  return TextStyle(
      fontSize: fontsize,
      color: color,
      decoration: decoration,
      fontWeight: weight,
      fontFamily: fontFamily ?? FontFamily.mazzard,
      letterSpacing: letterSpacing ?? 0,
      textBaseline: textBaseline);
}

/* ===================================================== Text Style SemiBold ===================================================*/

TextStyle textStyleSemiBold(
    {Color? color = Colors.black,
    double? fontsize = 14,
    double? letterSpacing,
    FontWeight? weight = FontWeight.w600,
    String? fontFamily,
    textBaseline,
    decoration}) {
  return TextStyle(
      fontSize: fontsize,
      color: color,
      decoration: decoration,
      fontWeight: weight,
      fontFamily: fontFamily ?? FontFamily.mazzard,
      letterSpacing: letterSpacing ?? 0,
      textBaseline: textBaseline);
}

/* ===================================================== Text Style Bold ===================================================*/

textStyleBold(
    {Color? color,
    double? fontsize,
    double? letterSpacing,
    String? fontFamily,
    double? height,
    decoration,
    FontWeight? fontWeight}) {
  return TextStyle(
      fontSize: fontsize,
      color: color,
      decoration: decoration,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontFamily: fontFamily ?? FontFamily.mazzard,
      letterSpacing: letterSpacing ?? 0);
}
