import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';

class CommonChip extends StatelessWidget {
  final String text;
  final Function? onDeleted;
  final Color color;
  final Color? textColor;
  const CommonChip(
      {super.key,
      required this.text,
      this.onDeleted,
      this.color = AppColors.lighterPinkColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDeleted?.call();
      },
      child: Chip(
          padding: const EdgeInsets.all(5),
          backgroundColor: color,
          label: CommonText(text, fontSize: 12, color: textColor)),
    );
  }
}
