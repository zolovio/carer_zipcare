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
import 'package:zip_care/src/feature/home/job/invoice/invoice_screen.dart';
import 'package:zip_care/src/feature/home/job/job_detail/job_detail_vm.dart';
import 'package:zip_care/src/feature/home/job/service_agreement/service_agreement.dart';

class JobsDetail extends StatelessWidget {
  const JobsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(jobDetailVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20),
                                child: CommonAppBarWithBack(
                                    title:
                                        strFemaleHourlydaycarerrequired,
                                    isBackActive: true,
                                    nofi: true,
                                    fontSize: font_18)),
                            SizedBox(height: height_10),
                            Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 50),
                                      child: Container(
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .purpleLightColor,
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(13)),
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(
                                                      top: 60,
                                                      bottom: 25),
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
                                                        height:
                                                            height_5),
                                                    CommonText(
                                                        "Job Id: ${_vm.jobDetail["jobId"]}",
                                                        fontSize: 13,
                                                        color: AppColors
                                                            .colorGrey),
                                                    SizedBox(
                                                        height:
                                                            height_20),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Column(
                                                              children: [
                                                                imageAsset(
                                                                    iconPeople,
                                                                    height: height_20,
                                                                    color: AppColors.colorMusted),
                                                                SizedBox(
                                                                    height: height_5),
                                                                CommonText(
                                                                    "${_vm.jobDetail["year"]} year",
                                                                    fontSize: 12,
                                                                    color: AppColors.colorGrey)
                                                              ]),
                                                          Column(
                                                              children: [
                                                                imageAsset(
                                                                    icpin,
                                                                    height: height_20,
                                                                    color: AppColors.blueColors),
                                                                SizedBox(
                                                                    height: height_5),
                                                                CommonText(
                                                                    "${_vm.jobDetail["location"]}",
                                                                    maxLines: 3,
                                                                    fontSize: 12,
                                                                    color: AppColors.colorGrey)
                                                              ]),
                                                          Column(
                                                              children: [
                                                                imageAsset(
                                                                    iconCalender,
                                                                    height: height_20),
                                                                SizedBox(
                                                                    height: height_5),
                                                                CommonText(
                                                                    "${_vm.jobDetail["date"]}",
                                                                    fontSize: 12,
                                                                    color: AppColors.colorGrey)
                                                              ]),
                                                          Column(
                                                              children: [
                                                                imageAsset(
                                                                    clockImage,
                                                                    height: height_20,
                                                                    color: AppColors.redColor),
                                                                SizedBox(
                                                                    height: height_5),
                                                                CommonText(
                                                                    "${_vm.jobDetail["hour"]}",
                                                                    fontSize: 12,
                                                                    color: AppColors.colorGrey)
                                                              ])
                                                        ])
                                                  ])))),
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      50.0)),
                                          border: Border.all(
                                              color: AppColors
                                                  .whiteColor,
                                              width: 4.0)),
                                      child: CircleAvatar(radius: 30))
                                ]),
                            SizedBox(height: height_20),
                            Row(children: [
                              CommonText("Job Status  :"),
                              SizedBox(width: 10),
                              CommonText("Accepted",
                                  color: AppColors.darkGreenColor,
                                  fontFamily: FontFamily.mazzard,
                                  fontWeight: FontWeight.w600)
                            ]),
                            //SizedBox(height: height_20),
                            Divider(height: height_40),
                            CommonText(
                                "Is this a self-employed position?",
                                fontSize: font_15),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail[
                                            "selfEmployedPosition"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var selfEmployedPosition = _vm
                                              .jobDetail[
                                          "selfEmployedPosition"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text:
                                                  selfEmployedPosition,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText(
                                "Is it an urgent requirement/ needs matching?",
                                fontSize: font_15),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail[
                                            "urgentRequirement"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var urgentRequirement =
                                          _vm.jobDetail[
                                              "urgentRequirement"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: urgentRequirement,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText(
                                "Is the carer requested for a person or business?",
                                fontSize: font_15),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["carerRequested"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var carerRequested =
                                          _vm.jobDetail[
                                              "carerRequested"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: carerRequested,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText(
                                "Are you the person needing care",
                                fontSize: font_15),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail[
                                            "personNeedingCare"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var personNeedingCare =
                                          _vm.jobDetail[
                                              "personNeedingCare"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: personNeedingCare,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText("Type of care*",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["typeOfCare"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var typeOfCare = _vm
                                          .jobDetail["typeOfCare"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: typeOfCare,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText("Type of job*",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["typeOfJob"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var typeOfJob = _vm
                                          .jobDetail["typeOfJob"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: typeOfJob,
                                              textColor:
                                                  AppColors.colorGrey,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText("When do you require care ?",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            SizedBox(height: height_5),
                            Row(
                              children: [
                                CommonText("Start Date:",
                                    fontSize: font_15,
                                    color: AppColors.lightGreyColor),
                                SizedBox(width: width_5),
                                CommonText(_vm.jobDetail["startDate"],
                                    fontSize: font_15),
                                SizedBox(width: width_25),
                                CommonText("Time:",
                                    fontSize: font_15,
                                    color: AppColors.lightGreyColor),
                                SizedBox(width: width_5),
                                CommonText(_vm.jobDetail["time"],
                                    fontSize: font_15),
                              ],
                            ),
                            Divider(height: height_20),
                            CommonText("Carer’s Gender",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["carerGender"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var carerGender =
                                          _vm.jobDetail["carerGender"]
                                              [i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: carerGender,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText(
                                "You need care for which health conditions.",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["healthConditions"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var healthConditions =
                                          _vm.jobDetail[
                                              "healthConditions"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: healthConditions,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText(
                                "Services you need from the carer",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        _vm.jobDetail["carer"].length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var carer =
                                          _vm.jobDetail["carer"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: carer,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_20),
                            CommonText("Access to funding?",
                                fontSize: font_15,
                                color: AppColors.colorGrey),
                            Container(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _vm
                                        .jobDetail["accessToFunding"]
                                        .length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext ctx, int i) {
                                      var accessToFunding =
                                          _vm.jobDetail[
                                              "accessToFunding"][i];
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0),
                                          child: CommonChip(
                                              text: accessToFunding,
                                              onDeleted: () {}));
                                    })),
                            Divider(height: height_50),
                            CommonText("Specific Requirements",
                                fontSize: 13),
                            SizedBox(height: height_10),
                            CommonText(
                                _vm.jobDetail["specificRequirements"],
                                fontSize: 13,
                                color: AppColors.colorGrey,
                                maxLines: 15,
                                textAlign: TextAlign.start),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1.0,
                                                    color: AppColors
                                                        .blackColor))),
                                        child: CommonText("Read More",
                                            fontSize: 12.sp)))),
                            CommonButtonWidget(
                                padding: EdgeInsets.only(top: 30),
                                buttonWidth: screenWidth,
                                buttonColors:
                                    AppColors.lighterPinkColor2,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceAgreementScreen()));
                                },
                                text: "Generate Service aggreement"),
                            CommonButtonWidget(
                                padding: EdgeInsets.only(top: 20),
                                buttonWidth: screenWidth,
                                buttonColors:
                                    AppColors.lighterPinkColor2,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InvoiceScreen()));
                                },
                                text: "Invoices"),
                            SizedBox(height: 30)
                          ])))));
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
                                CommonButtonWidget(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 25, horizontal: 25),
                                    buttonWidth: screenWidth,
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext
                                                  context) =>
                                              AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                              .circular(
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
                                                                EdgeInsets.all(
                                                                    10),
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
                                    text: "Submit")
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
