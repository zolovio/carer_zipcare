import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/job/job_detail/job_detail_screen.dart';

class JobCard2 extends StatelessWidget {
  final String jobId;
  final String title;
  final String name;
  final String year;
  final String location;
  final String hour;
  final String dateTime;
  final Widget widget;
  final String employed;
  const JobCard2(
      {super.key,
      required this.jobId,
      required this.title,
      required this.name,
      required this.year,
      required this.location,
      required this.hour,
      this.dateTime = "",
      this.widget = const SizedBox(),
      this.employed = ""});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(bottom: 15.sp),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobsDetail()));
            },
            child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(
                        width: 1.sp, color: AppColors.darkPinkColor)),
                child: Padding(
                    padding: EdgeInsets.all(7.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(jobId, fontSize: font_15),
                          SizedBox(height: height_10),
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                    maxRadius: 25.sp,
                                    backgroundColor:
                                        AppColors.lighterPinkColor,
                                    child: CommonText("JW")),
                                SizedBox(width: width_10),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(title,
                                          fontSize: font_16),
                                      SizedBox(height: height_5),
                                      Row(children: [
                                        CommonText("Name & $strAge :",
                                            fontSize: font_16),
                                        CommonText(
                                            "  ${name}, ${year}yr",
                                            fontSize: font_15,
                                            color:
                                                AppColors.colorGrey)
                                      ]),
                                      SizedBox(height: height_5),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                          children: [
                                            Row(children: [
                                              Row(children: [
                                                imageAsset(icpin,
                                                    height:
                                                        height_13),
                                                SizedBox(
                                                    width: width_5),
                                                CommonText(location,
                                                    fontSize: font_15,
                                                    color: AppColors
                                                        .colorGrey)
                                              ]),
                                              SizedBox(
                                                  width: width_10),
                                              Row(children: [
                                                imageAsset(clockImage,
                                                    height:
                                                        height_14),
                                                SizedBox(
                                                    width: width_5),
                                                CommonText(hour,
                                                    fontSize: font_15,
                                                    color: AppColors
                                                        .colorGrey)
                                              ])
                                            ])
                                          ]),
                                      SizedBox(height: height_5),
                                      dateTime.length > 0
                                          ? Row(children: [
                                              imageAsset(iconCalender,
                                                  height: height_13,
                                                  color: AppColors
                                                      .blackColor),
                                              SizedBox(
                                                  width: width_5),
                                              CommonText(dateTime,
                                                  fontSize: font_15,
                                                  color: AppColors
                                                      .colorGrey)
                                            ])
                                          : SizedBox()
                                    ])
                              ]),
                          SizedBox(height: height_10),
                          widget,
                          SizedBox(height: height_10),
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: CommonText(
                                        employed.length > 0
                                            ? employed
                                            : "",
                                        fontSize: font_16,
                                        color:
                                            AppColors.darkPinkColor)),
                                InkWell(
                                    onTap: () {},
                                    child: CommonText(strAccepted,
                                        fontSize: font_16,
                                        color:
                                            AppColors.darkGreenColor))
                              ])
                        ])))));
  }
}
