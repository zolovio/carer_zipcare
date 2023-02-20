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
  final EdgeInsetsGeometry padding;
  final double textSize;

  final Widget icon;
  const CommonButtonWidget(
      {key,
      required this.onTap,
      required this.text,
      this.buttonColors = AppColors.darkPinkColor,
      this.textColors = Colors.white,
      this.buttonWidth,
      this.buttonHeight = 55,
      this.radius = 16,
      this.padding = const EdgeInsets.symmetric(horizontal: 20.0),
      this.textSize = 16,
      this.icon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: InkWell(
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
                child: Stack(children: [
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: icon)),
                  Center(
                      child: CommonText(text,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                          fontSize: 18.sp))
                ]))));
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
  final IconData icon;
  const CommonNextButtonWidget(
      {key,
      required this.onTap,
      required this.text,
      this.buttonColors = AppColors.darkPinkColor,
      this.textColors = Colors.white,
      this.buttonWidth,
      this.buttonHeight = 55,
      this.radius = 16,
      this.textSize = 16,
      this.icon = Icons.arrow_forward_ios});

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
                child: Icon(icon, color: textColors),
              ),
            ],
          ),
        ));
  }
}
