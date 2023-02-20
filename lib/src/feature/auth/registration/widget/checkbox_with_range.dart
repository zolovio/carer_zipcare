import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';

class CheckboxWithRange extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool isCheck;
  final RangeValues range;
  final Function onChange;

  const CheckboxWithRange(
      {super.key,
      required this.isCheck,
      required this.title,
      required this.onTap,
      required this.range,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: isCheck,
            activeColor: AppColors.darkPinkColor,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              onTap();
            },
            title: Text("${title}")),
        !isCheck
            ? SizedBox()
            : Column(
                children: [
                  RangeSlider(
                      activeColor: AppColors.darkPinkColor,
                      values: range,
                      divisions: 5,
                      labels: RangeLabels(
                          range.start.round().toString(),
                          range.end.round().toString()),
                      onChanged: (values) => onChange(values),
                      min: 1,
                      max: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText("Least Confident", fontSize: 12),
                      CommonText("Very Confident", fontSize: 12),
                    ],
                  )
                ],
              ),
      ],
    );
  }
}
