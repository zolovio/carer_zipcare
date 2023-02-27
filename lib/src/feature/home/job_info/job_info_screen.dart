import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/common/widgets/common_chip.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/job_info/job_info_vm.dart';

class JobInfoScreen extends StatelessWidget {
  const JobInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(jobInfoVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              isBackActive: true,
              title: strFemaleHourlydaycarerrequired,
              isOnline: true,
              logo: true,
              nofi: true,
              fontSize: font_17),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height_10),
                        Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Container(
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .purpleLightColor,
                                          borderRadius:
                                              BorderRadius.circular(
                                                  13)),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 60, bottom: 25),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                              children: [
                                                CommonText(
                                                    _vm.jobDetail[
                                                        "name"],
                                                    color: AppColors
                                                        .darkPinkColor,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        FontFamily
                                                            .lexendBold),
                                                SizedBox(
                                                    height: height_5),
                                                CommonText(
                                                    "Job Id: ${_vm.jobDetail["jobId"]}",
                                                    fontSize: 13,
                                                    color: AppColors
                                                        .colorGrey),
                                                SizedBox(
                                                    height:
                                                        height_18),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                          children: [
                                                            imageAsset(
                                                                iconPeople,
                                                                height:
                                                                    height_18,
                                                                color:
                                                                    AppColors.colorMusted),
                                                            SizedBox(
                                                                height:
                                                                    height_5),
                                                            CommonText(
                                                                "${_vm.jobDetail["year"]} year",
                                                                fontSize:
                                                                    12,
                                                                color:
                                                                    AppColors.colorGrey)
                                                          ]),
                                                      Column(
                                                          children: [
                                                            imageAsset(
                                                                icpin,
                                                                height:
                                                                    height_18,
                                                                color:
                                                                    AppColors.blueColors),
                                                            SizedBox(
                                                                height:
                                                                    height_5),
                                                            CommonText(
                                                                "${_vm.jobDetail["location"]}",
                                                                maxLines:
                                                                    3,
                                                                fontSize:
                                                                    12,
                                                                color:
                                                                    AppColors.colorGrey)
                                                          ]),
                                                      Column(
                                                          children: [
                                                            imageAsset(
                                                                iconCalender,
                                                                height:
                                                                    height_18),
                                                            SizedBox(
                                                                height:
                                                                    height_5),
                                                            CommonText(
                                                                "${_vm.jobDetail["date"]}",
                                                                fontSize:
                                                                    12,
                                                                color:
                                                                    AppColors.colorGrey)
                                                          ]),
                                                      Column(
                                                          children: [
                                                            imageAsset(
                                                                clockImage,
                                                                height:
                                                                    height_18,
                                                                color:
                                                                    AppColors.redColor),
                                                            SizedBox(
                                                                height:
                                                                    height_5),
                                                            CommonText(
                                                                "${_vm.jobDetail["hour"]}",
                                                                fontSize:
                                                                    12,
                                                                color:
                                                                    AppColors.colorGrey)
                                                          ])
                                                    ])
                                              ])))),
                              Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                          color: AppColors.whiteColor,
                                          width: 4.0)),
                                  child: CircleAvatar(radius: 30))
                            ]),
                        SizedBox(height: height_20),
                        CommonText("Type of Job",
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _vm
                                    .jobDetail["typesOfJob"].length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var typesOfJob =
                                      _vm.jobDetail["typesOfJob"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: typesOfJob,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText(strServiceNeeded,
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _vm.jobDetail["service"].length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var service =
                                      _vm.jobDetail["service"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: service,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText(strCondition,
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _vm
                                    .jobDetail["conditions"].length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var conditions =
                                      _vm.jobDetail["conditions"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: conditions,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText(strLanguage,
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _vm.jobDetail["language"].length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var language =
                                      _vm.jobDetail["language"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: language,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText("Care type and schedule",
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _vm
                                    .jobDetail["careTypeAndSchedule"]
                                    .length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var careTypeAndSchedule =
                                      _vm.jobDetail[
                                          "careTypeAndSchedule"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: careTypeAndSchedule,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText(strPreferenceGender,
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _vm
                                    .jobDetail["preferenceGender"]
                                    .length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var preferenceGender =
                                      _vm.jobDetail[
                                          "preferenceGender"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: preferenceGender,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText(strThingsYourEnjoy,
                            fontSize: 13, color: AppColors.colorGrey),
                        Container(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _vm
                                    .jobDetail["thingsYouEnjoy"]
                                    .length,
                                padding: EdgeInsets.zero,
                                itemBuilder:
                                    (BuildContext ctx, int i) {
                                  var thingsYouEnjoy = _vm
                                      .jobDetail["thingsYouEnjoy"][i];
                                  return Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0),
                                      child: CommonChip(
                                          text: thingsYouEnjoy,
                                          onDeleted: () {}));
                                })),
                        SizedBox(height: height_20),
                        CommonText("Care type and schedule",
                            fontSize: 13, color: AppColors.colorGrey),
                        SizedBox(height: height_10),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              imageAsset(iclogo, height: height_40),
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1.0,
                                                      color: AppColors
                                                          .colorBlueFrame))),
                                          child: CommonText(
                                              "Download",
                                              fontSize: 13,
                                              color: AppColors
                                                  .colorBlueFrame))))
                            ]),
                        SizedBox(height: height_20),
                        CommonText("Specific requirements",
                            fontSize: 13),
                        SizedBox(height: height_10),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.colorGrey),
                                children: [
                              TextSpan(
                                  text: _vm.jobDetail[
                                      "specificRequirements"]),
                              WidgetSpan(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 5),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              width:
                                                                  1.0,
                                                              color: AppColors
                                                                  .blackColor))),
                                                  child: CommonText(
                                                      "Read More",
                                                      fontSize:
                                                          12.sp))))))
                            ])),
                        SizedBox(height: 30),
                        CommonButtonWidget(
                            buttonWidth: screenWidth,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      Popup(
                                        controller: _vm.message,
                                      ));
                            },
                            text: "Apply for job",
                            icon: imageAsset(arrowUp)),
                        SizedBox(height: 30),
                      ]))));
    });
  }
}

class TopList extends StatelessWidget {
  final String text;
  const TopList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth / 3.5,
        decoration: BoxDecoration(
            color: AppColors.blueGreyLightColor,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Center(child: CommonText(text, fontSize: 14))));
  }
}

class Popup extends StatelessWidget {
  final TextEditingController controller;
  const Popup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Material(
        color: Colors.transparent,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child:
                    Stack(alignment: Alignment.topRight, children: [
              Padding(
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Container(
                      height: screenHeight - 300,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Image.asset(noteImage,
                                        height: 120)),
                                SizedBox(height: height_5),
                                CommonText("Are you applying for",
                                    color: AppColors.blackColor,
                                    fontSize: 15.sp),
                                SizedBox(height: height_5),
                                CommonText(
                                    strFemaleHourlydaycarerrequired,
                                    color: AppColors.blackColor,
                                    fontSize: 16.sp,
                                    fontFamily:
                                        FontFamily.lexendSemiBold),
                                SizedBox(height: height_10),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 35),
                                        child: CommonText(
                                            "You may add a message here:",
                                            fontSize: 13,
                                            color: AppColors
                                                .colorGrey))),
                                SizedBox(height: height_10),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: FormBuilderTextField(
                                      controller: controller,
                                      maxLines: null,
                                      minLines: 5,
                                      cursorColor:
                                          AppColors.darkPinkColor,
                                      keyboardType:
                                          TextInputType.multiline,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          15)),
                                              borderSide: BorderSide(
                                                  color: AppColors
                                                      .blueGreyLightColor)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: AppColors
                                                      .blueGreyLightColor)),
                                          hintStyle: TextStyle(
                                              color: Colors.white)),
                                      textInputAction:
                                          TextInputAction.newline,
                                      name: '',
                                    )),
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: CommonButtonWidget(
                                      buttonWidth: screenWidth,
                                      onTap: () {
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext
                                                    context) =>
                                                AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    13))),
                                                    content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize
                                                                .min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets.all(10),
                                                              child: Center(
                                                                  child: Container(
                                                                      width: screenWidth,
                                                                      decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(13)),
                                                                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                        Center(child: Image.asset(icdone, height: 120)),
                                                                        SizedBox(height: height_5),
                                                                        CommonText("Applied", color: AppColors.blackColor, fontSize: 15.sp, fontFamily: FontFamily.lexendSemiBold),
                                                                        SizedBox(height: height_10),
                                                                        CommonText("Congratulation! You Applied this job successfully.", fontSize: 13, color: AppColors.colorGrey, maxLines: 2),
                                                                        SizedBox(height: height_10),
                                                                      ]))))
                                                        ])));
                                      },
                                      text: "Submit"),
                                )
                              ])))),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50))),
                      child: Icon(Icons.close)))
            ]))));
  }
}
