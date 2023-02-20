import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/common/widgets/common_chip.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/home/home_vm.dart';
import 'package:zip_care/src/feature/home/job_info/job_info_screen.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(homeVmProvider);
      return Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1, color: AppColors.darkPinkColor)),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText("$strJobIds ${_vm.jobs["jobId"]}",
                        fontSize: 13),
                    SizedBox(height: height_10),
                    Row(children: [
                      CircleAvatar(
                          maxRadius: 20,
                          backgroundColor: AppColors.lighterPinkColor,
                          child: CommonText("JW")),
                      SizedBox(width: width_10),
                      Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            CommonText(_vm.jobs["title"],
                                fontSize: font_13),
                            SizedBox(height: height_10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    imageAsset(iconPeople,
                                        height: height_13,
                                        color: Colors.black),
                                    SizedBox(width: width_5),
                                    CommonText(
                                        "${_vm.jobs["year"]}yr",
                                        fontSize: 13,
                                        color: AppColors.colorGrey),
                                    SizedBox(width: width_10),
                                    Row(children: [
                                      imageAsset(icpin,
                                          height: height_15),
                                      SizedBox(width: width_5),
                                      CommonText(_vm.jobs["location"],
                                          fontSize: 13,
                                          color: AppColors.colorGrey)
                                    ]),
                                    SizedBox(width: width_10),
                                    Row(children: [
                                      imageAsset(clockImage,
                                          height: height_15),
                                      SizedBox(width: width_5),
                                      CommonText(_vm.jobs["hour"],
                                          fontSize: 13,
                                          color: AppColors.colorGrey)
                                    ])
                                  ])
                                ])
                          ])
                    ]),
                    SizedBox(height: height_15),
                    Wrap(spacing: 5, runSpacing: 0.0, children: [
                      ..._vm.jobs["careTypeAndSchedule"]
                          .map((String v) =>
                              CommonChip(text: v, onDeleted: () {}))
                          .toList(),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: CommonChip(
                            text: "more...",
                            color: AppColors.darkPinkColor,
                            textColor: AppColors.whiteColor),
                      )
                    ]),
                    SizedBox(height: height_10),
                    Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                              "Posted on- ${_vm.jobs["postedOn"]}",
                              color: AppColors.colorGrey,
                              fontSize: 12),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.darkPinkColor,
                                  foregroundColor:
                                      AppColors.darksPinkColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JobInfoScreen()));
                              },
                              child: CommonText(strApplyNow,
                                  color: AppColors.whiteColor)),
                        ])
                  ])));
    });
  }
}
