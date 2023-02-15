import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';

textFieldDecoration({String hintText = ""}) {
  return InputDecoration(
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