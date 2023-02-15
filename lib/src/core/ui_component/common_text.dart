import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/font_family.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final bool isBold;
  const CommonText(this.text,
      {Key? key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.textOverflow = TextOverflow.ellipsis,
      this.textAlign = TextAlign.center,
      this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: FontFamily.lexendRegular,
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
