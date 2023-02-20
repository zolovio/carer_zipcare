import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'common_text.dart';

class CommonAppBarWithBack extends StatelessWidget {
  final String title;
  final bool isBackActive;
  final bool logo;
  final double fontSize;
  final bool isOnline;
  final bool isOffline;
  final bool nofi;
  final bool isSkip;
  final Function? onSkip;

  CommonAppBarWithBack({
    Key? key,
    this.title = "",
    this.isBackActive = false,
    this.logo = false,
    this.fontSize = 26.0,
    this.isOnline = false,
    this.nofi = false,
    this.isOffline = false,
    this.isSkip = false,
    this.onSkip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  !isBackActive && logo
                      ? imageAsset(splashLogoImage, height: height_30)
                      : Container(),
                  isBackActive
                      ? InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: imageAsset(ICON_back,
                              height: height_25))
                      : Container()
                ]),
                Row(children: [
                  isOffline
                      ? Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                              CommonText(strGoOffline_,
                                  fontSize: 14,
                                  fontFamily:
                                      FontFamily.lexendSemiBold),
                              imageAsset(iconOffline,
                                  height: height_40)
                            ])
                      : Container(),
                  isOnline
                      ? Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                              CommonText(strGoOnline_,
                                  fontSize: 14,
                                  fontFamily:
                                      FontFamily.lexendSemiBold),
                              imageAsset(iconOnline,
                                  height: height_40)
                            ])
                      : Container(),
                  nofi
                      ? imageAsset(notificationImage,
                          height: height_25)
                      : Container()
                ])
              ]),
          title.length > 0 ? SizedBox(height: 20) : Container(),
          title.length > 0
              ? Center(
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    CommonText(title,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500),
                    !isSkip
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              onSkip!();
                            },
                            child: CommonText(strSkip,
                                fontSize: 15.sp,
                                color: AppColors.darkPinkColor,
                                fontWeight: FontWeight.w500),
                          ),
                  ],
                ))
              : Container()
        ]);
  }
}
