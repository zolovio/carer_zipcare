/*
 *  @copyright : Ozvid Technologies Pvt. Ltd. < www.ozvid.com >
 *  @author     : Shiv Charan Panjeta < shiv@ozvid.com >
 *  All Rights Reserved.
 *  Proprietary and confidential :  All information contained herein is, and remains
 *  the property of Ozvid Technologies Pvt. Ltd. and its partners.
 *  Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:flutter/material.dart';

import '../app_utils/textstyle.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../constants/font_family.dart';
import 'bounce_widget.dart';

Widget cbtnTextButton(
        {required void Function() onPressed,
        required String label,
        OutlinedBorder? shape,
        Color? backgroundColor,
        Color? foregroundColor,
        Color? shadowColor,
        double? height,
        EdgeInsetsGeometry? padding,
        Color textColor = Colors.black,
        TextStyle? textStyle}) =>
    FractionallySizedBox(
      child: SizedBox(
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: shape,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: padding,
              shadowColor: shadowColor,
              textStyle: textStyle),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
        ),
      ),
    );

Widget cbtnTextButtonWithIcon(
        {required void Function() onPressed,
        required String label,
        required IconData icon,
        Color textColor = Colors.black,
        OutlinedBorder? shape,
        Color? backgroundColor,
        Color? foregroundColor,
        double? height,
        Color? shadowColor,
        EdgeInsetsGeometry? padding,
        TextStyle? textStyle}) =>
    FractionallySizedBox(
      child: SizedBox(
        height: height,
        child: TextButton.icon(
          onPressed: onPressed,
          label: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
          icon: Icon(icon),
          style: TextButton.styleFrom(
              shape: shape,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: padding,
              shadowColor: shadowColor,
              textStyle: textStyle),
        ),
      ),
    );

Widget getInkWell({required Widget widget, required Function() onTap}) =>
    InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: widget,
    );

Widget cbtnTextButton1({
  String? buttonText,
  Color? textColor,
  onPressed,
  height,
  width,
  double? fontsize,
  Color? start,
  textSize,
  roundedSize,
  Color? end,
  weight,
  Color? buttonColor,
  Widget? icon,
}) =>
    BouncingWidget(
        onPressed: onPressed,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: elvation_5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedSize ?? radius_10),
          ),
          child: Container(
            width: width ?? width_150,
            height: height ?? height_50,
            padding: EdgeInsets.symmetric(vertical: margin_10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: buttonColor ?? AppColors.darkPinkColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(roundedSize ?? radius_10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? Container(),
                icon != null ? SizedBox(width: width_10) : Container(),
                Text(
                  buttonText ?? "",
                  style: textStyleBold(
                      color: textColor ?? AppColors.whiteColor,
                      fontsize: textSize ?? font_15,
                      fontWeight: weight),
                ),
              ],
            ),
          ),
        ));

decorationBox({backgroundColor, cornerRaduis, borderColor, borderWidth}) {
  return BoxDecoration(
    color: backgroundColor,
    border: Border.all(color: borderColor, width: borderWidth),
    borderRadius: BorderRadius.all(Radius.circular(cornerRaduis ?? 100.0)
        //
        ),
  );
}

decorationBorderRaduisOnly(
    {backgroundColor,
    borderColor,
    borderWidth,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight}) {
  return BoxDecoration(
    color: backgroundColor,
    border: Border.all(color: borderColor, width: borderWidth),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? 0),
        topRight: Radius.circular(topRight ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? 0),
        bottomRight: Radius.circular(bottomRight ?? 0)
        //
        ),
  );
}

Widget cbtnElevatedButton(
        {required void Function() onPressed,
        required String label,
        Color textColor = Colors.white,
        OutlinedBorder? shape,
        Color? backgroundColor,
        double? height,
        Color? foregroundColor,
        Color? shadowColor,
        EdgeInsetsGeometry? padding,
        TextStyle? textStyle}) =>
    FractionallySizedBox(
      widthFactor: 1,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: shape,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shadowColor: shadowColor,
            textStyle: textStyle,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
        ),
      ),
    );

Widget cbtnElevatedButtonWithIcon(
        {required void Function() onPressed,
        required String label,
        required IconData icon,
        Color textColor = Colors.white,
        OutlinedBorder? shape,
        Color? backgroundColor,
        double? height,
        Color? foregroundColor,
        Color? shadowColor,
        EdgeInsetsGeometry? padding,
        TextStyle? textStyle}) =>
    FractionallySizedBox(
      child: SizedBox(
        height: height,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          label: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
          icon: Icon(icon),
          style: ElevatedButton.styleFrom(
            shape: shape,
            backgroundColor: backgroundColor,
            padding: padding ?? EdgeInsets.all(margin_12),
            foregroundColor: foregroundColor,
            shadowColor: shadowColor,
            textStyle: textStyle,
          ),
        ),
      ),
    );

Widget cbtnOutlinedButton({
  required void Function() onPressed,
  required String label,
  Color textColor = Colors.white,
  OutlinedBorder? shape,
  Color? backgroundColor,
  double? height,
  Color? foregroundColor,
  Color? shadowColor,
  EdgeInsetsGeometry? padding,
  TextStyle? textStyle,
}) =>
    FractionallySizedBox(
      child: SizedBox(
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              shape: shape,
              backgroundColor: backgroundColor,
              padding: padding,
              foregroundColor: foregroundColor,
              shadowColor: shadowColor,
              textStyle: textStyle),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
        ),
      ),
    );

Widget cbtnOutlinedButtonWithIcon(
        {required void Function() onPressed,
        required String label,
        required IconData icon,
        Color textColor = Colors.white,
        OutlinedBorder? shape,
        Color? backgroundColor,
        double? height,
        Color? foregroundColor,
        Color? shadowColor,
        EdgeInsetsGeometry? padding,
        TextStyle? textStyle}) =>
    FractionallySizedBox(
      child: SizedBox(
        height: height,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          label: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: font_16,
                  fontFamily: FontFamily.mazzard),
            ),
          ),
          icon: Icon(icon),
          style: OutlinedButton.styleFrom(
              shape: shape,
              backgroundColor: backgroundColor,
              padding: padding,
              onSurface: foregroundColor,
              shadowColor: shadowColor,
              textStyle: textStyle),
        ),
      ),
    );

Widget cbtnGestureDetector({
  required void Function() onPressed,
  required Widget child,
}) =>
    GestureDetector(
      onTap: onPressed,
      child: child,
    );
