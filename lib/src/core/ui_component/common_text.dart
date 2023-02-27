import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/font_family.dart';

class CommonText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final bool isBold;
  final double? height;
  const CommonText(this.text,
      {Key? key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textOverflow = TextOverflow.ellipsis,
      this.textAlign = TextAlign.center,
      this.isBold = false,
      this.height,
      this.fontFamily = FontFamily.lexendRegular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
        style: TextStyle(
          height: height,
          fontFamily: fontFamily,
          color:
              color ?? Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: isBold
              ? FontWeight.w800
              : fontWeight ??
                  Theme.of(context).textTheme.bodyLarge?.fontWeight,
          fontSize: fontSize ??
              Theme.of(context).textTheme.bodyLarge?.fontSize,
        ));
  }
}
