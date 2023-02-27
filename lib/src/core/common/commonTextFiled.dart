import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';

class CommonTextFiled extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController? controller;
  final Widget suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnabled;
  final int maxLine;
  final Color? fillColor;

  const CommonTextFiled(
      {super.key,
      this.controller,
      this.maxLine = 1,
      required this.hintText,
      required this.name,
      required this.validator,
      this.suffixIcon = const SizedBox(),
      this.prefixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.emailAddress,
      this.textInputAction = TextInputAction.next,
      this.inputFormatters,
      this.isEnabled = true,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        enabled: isEnabled,
        maxLines: maxLine,
        controller: controller,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            fillColor: fillColor ?? null,
            filled: fillColor != null,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon ?? null,
            hintText: hintText,
            hintStyle:
                TextStyle(fontFamily: FontFamily.lexendRegular),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15),
                borderSide: const BorderSide(
                    color: AppColors.lightestGreyColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15),
                borderSide: const BorderSide(
                    color: AppColors.lightestGreyColor)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15),
                borderSide: const BorderSide(
                    color: AppColors.lightestGreyColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15),
                borderSide:
                    const BorderSide(color: AppColors.darkPinkColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius_15),
                borderSide:
                    const BorderSide(color: AppColors.colorPink))),
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        name: name);
  }
}
