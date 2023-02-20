import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/font_family.dart';

class PageNumber extends StatelessWidget {
  final String no;
  final Color noColor;
  const PageNumber(
      {super.key, required this.no, this.noColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: RichText(
          text: TextSpan(
            text: '$no',
            style: TextStyle(
                color: noColor,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.lexendRegular,
                fontSize: 25.sp),
            children: const <TextSpan>[
              TextSpan(
                  text: '/9',
                  style: TextStyle(color: AppColors.darkPinkColor)),
            ],
          ),
        ),
      ),
    );
  }
}
