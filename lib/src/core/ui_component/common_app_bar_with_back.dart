import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'common_text.dart';

class CommonAppBarWithBack extends StatelessWidget {
  final String title;
  final bool isBackActive;

  const CommonAppBarWithBack(
      {Key? key, required this.title, this.isBackActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isBackActive
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.blackColor,
                  ))
              : SizedBox(height: 50.0),
          Center(
              child: CommonText(title,
                  fontSize: 26.0, fontWeight: FontWeight.w500))
        ]);
  }
}
