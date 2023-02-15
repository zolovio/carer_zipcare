import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zip_care/src/core/constants/colors.dart';

import '../app_utils/textstyle.dart';
import '../constants/dimens.dart';
import 'common_widget.dart';

class CommonTextField extends StatelessWidget {
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatter;
  final Color? borderColor;
  final Color? fillColor;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function onFieldSubmitted;
  final TextInputAction? inputAction;
  final Widget? prefixIcon;
  final Widget? sufixWiget;
  final double? fontSize;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final Function? passwordShow;
  final Function onEditingComplete;
  final Function onChanged;
  final bool? obsecure;
  final int? minlines;
  final int? maxlines;
  final int? maxlength;
  final Function validate;
  final Function onTap;
  final double vertical;
  final double horizontalPadding;
  final double horizontal;
  final String? hint;
  final Color? hintTextColor;

  const CommonTextField(
      {Key? key,
      required this.readOnly,
      this.inputFormatter,
      this.borderColor,
      this.fillColor,
      this.inputType,
      this.textController,
      this.focusNode,
      required this.onFieldSubmitted,
      this.inputAction,
      this.prefixIcon,
      this.sufixWiget,
      this.fontSize,
      this.textAlign,
      this.suffixIcon,
      required this.passwordShow,
      required this.onEditingComplete,
      required this.onChanged,
      this.obsecure,
      this.minlines,
      this.maxlines,
      this.maxlength,
      required this.validate,
      required this.onTap,
      required this.vertical,
      required this.horizontalPadding,
      required this.horizontal,
      this.hint,
      this.hintTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: readOnly,
        cursorColor: AppColors.darkPinkColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatter ??
            [
              FilteringTextInputFormatter(
                  RegExp(
                      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                  allow: false),
            ],
        controller: textController,
        focusNode: focusNode,
        minLines: minlines ?? 1,
        maxLength: maxlength,
        maxLines: maxlines ?? 1,
        textAlign: textAlign ?? TextAlign.left,
        keyboardType: inputType,
        textInputAction: inputAction,
        obscureText: obsecure ?? false,
        onTap: onTap.call() ?? () {},
        validator: (value) => validate(value),
        onFieldSubmitted: (value) => onFieldSubmitted(value),
        onChanged: (value) => onChanged(value),
        onEditingComplete: () => onEditingComplete,
        style: textStyleMedium(
            color: AppColors.colorGrey, fontsize: fontSize ?? font_13),
        decoration: InputDecoration(
          counterText: "",
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(left: margin_15, right: margin_7),
                  child: prefixIcon,
                )
              : null,
          suffix: sufixWiget,
          suffixIcon: suffixIcon != null
              ? InkWell(
                  onTap: passwordShow?.call() ?? () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: margin_5, right: horizontal ?? margin_10),
                    child: suffixIcon,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? width_25,
              vertical: vertical ?? height_15),
          hintText: hint,
          filled: true,
          focusColor: fillColor ?? Colors.white,
          fillColor: fillColor ?? Colors.white,
          hintStyle: TextStyle(
              fontSize: fontSize ?? font_13,
              color: hintTextColor ?? AppColors.blueGreyColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 0),
          labelStyle: TextStyle(
              fontSize: fontSize ?? font_13,
              color: hintTextColor ?? AppColors.blueGreyColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_15),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.lightestGreyColor)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius_15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_15),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.lightestGreyColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_15),
              borderSide: const BorderSide(color: AppColors.darkPinkColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius_15),
              borderSide: const BorderSide(color: AppColors.colorPink)),
        ));
  }
}

class CommonTextFieldWithPrefix extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;
  final String? label;
  final int maxLines;
  final Function? validator;
  final Function? onChange;
  final Function? onFieldSubmitted;
  final Function? onEditingComplete;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Widget? prefix;
  const CommonTextFieldWithPrefix(
      {Key? key,
      required this.controller,
      required this.focusNode,
      this.hintText,
      this.label,
      this.maxLines = 1,
      this.validator,
      this.onChange,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.prefix,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        if (label != null) vGap(4),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: (value) => validator!(value),
          onChanged: (value) => onChange!(value),
          onFieldSubmitted: (value) => onFieldSubmitted!(value),
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines,
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
              color: Colors.grey),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: margin_10),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight),
            helperStyle: TextStyle(
              color: Colors.grey,
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
            ),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
            ),
            prefixStyle: TextStyle(
              color: Colors.grey,
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
            ),
            fillColor: Colors.white,
            prefixIcon: prefix,
          ),
        ),
      ],
    );
  }
}
