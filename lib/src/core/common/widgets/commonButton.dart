import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';

class CommonButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color buttonColors;
  final Color textColors;
  final double? buttonWidth;
  final double buttonHeight;
  final double radius;
  final double textSize;
  const CommonButtonWidget(
      {key,
      required this.onTap,
      required this.text,
      this.buttonColors = AppColors.darkPinkColor,
      this.textColors = Colors.white,
      this.buttonWidth,
      this.buttonHeight = 55,
      this.radius = 16,
      this.textSize = 16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          alignment: Alignment.center,
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
              color: buttonColors,
              borderRadius: BorderRadius.circular(radius)),
          child: CommonText(text,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
              fontSize: 18.sp),
        ));
  }
}

class CommonNextButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color buttonColors;
  final Color textColors;
  final double? buttonWidth;
  final double buttonHeight;
  final double radius;
  final double textSize;
  const CommonNextButtonWidget(
      {key,
      required this.onTap,
      required this.text,
      this.buttonColors = AppColors.darkPinkColor,
      this.textColors = Colors.white,
      this.buttonWidth,
      this.buttonHeight = 55,
      this.radius = 16,
      this.textSize = 16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          alignment: Alignment.center,
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
              color: buttonColors,
              borderRadius: BorderRadius.circular(radius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50),
              CommonText(text,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                  fontSize: 18.sp),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child:
                    Icon(Icons.arrow_forward_ios, color: textColors),
              ),
            ],
          ),
        ));
  }
}
