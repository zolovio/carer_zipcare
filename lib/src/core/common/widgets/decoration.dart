import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';

textFieldDecoration(
    {String hintText = "", suffix = null, prefix = null}) {
  return InputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix,
      hintText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_15),
          borderSide:
              const BorderSide(color: AppColors.lightestGreyColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_15)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_15),
          borderSide:
              const BorderSide(color: AppColors.lightestGreyColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_15),
          borderSide:
              const BorderSide(color: AppColors.darkPinkColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_15),
          borderSide: const BorderSide(color: AppColors.colorPink)));
}

TextStyle textDecoration = TextStyle(
    fontFamily: FontFamily.lexendRegular,
    color: AppColors.blueGreyColor,
    fontSize: 15.sp);
