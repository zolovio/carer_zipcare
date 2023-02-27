import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/my_buddy/my_buddy_vm.dart';

class MyBuddyScreen extends StatelessWidget {
  const MyBuddyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(myBuddyVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Buddy",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText("Opt-in for buddy scheme",
                              fontSize: font_15,
                              fontFamily: FontFamily.lexendSemiBold),
                          CupertinoSwitch(
                              value: switchValue,
                              activeColor: AppColors.darkGreenColor,
                              onChanged: (bool? value) {})
                        ]),
                    SizedBox(height: height_20),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _vm.buddyList.length,
                        itemBuilder: (BuildContext context, int i) {
                          var list = _vm.buddyList[i];
                          return Padding(
                              padding: EdgeInsets.only(bottom: 10.sp),
                              child: Container(
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(
                                              radius_10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors
                                                .lightestGreyColor,
                                            blurRadius: 5,
                                            spreadRadius: 2)
                                      ]),
                                  child: Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                                minRadius: 25),
                                            SizedBox(width: width_25),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  RichText(
                                                      text: TextSpan(
                                                          style: TextStyle(
                                                              fontSize:
                                                                  font_14,
                                                              color: AppColors
                                                                  .colorGrey,
                                                              fontFamily:
                                                                  FontFamily.lexendRegular),
                                                          children: [
                                                        TextSpan(
                                                            text:
                                                                "Name : ",
                                                            style: TextStyle(
                                                                color:
                                                                    AppColors.blackColor)),
                                                        TextSpan(
                                                            text: list[
                                                                "name"])
                                                      ])),
                                                  SizedBox(
                                                      height:
                                                          height_10),
                                                  Row(children: [
                                                    imageAsset(icpin,
                                                        height:
                                                            height_12),
                                                    SizedBox(
                                                        width:
                                                            width_5),
                                                    CommonText(
                                                        list[
                                                            "location"]!,
                                                        fontSize:
                                                            font_14,
                                                        color: AppColors
                                                            .colorGrey)
                                                  ]),
                                                  SizedBox(
                                                      height:
                                                          height_5),
                                                  Row(children: [
                                                    imageAsset(
                                                        bagImage,
                                                        height:
                                                            height_10),
                                                    SizedBox(
                                                        width:
                                                            width_5),
                                                    CommonText(
                                                        list["bag"]!,
                                                        fontSize:
                                                            font_14,
                                                        color: AppColors
                                                            .colorGrey)
                                                  ]),
                                                  SizedBox(
                                                      height:
                                                          height_5),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(children: [
                                                          imageAsset(
                                                              iconTimer2,
                                                              height:
                                                                  height_10),
                                                          SizedBox(
                                                              width:
                                                                  width_5),
                                                          CommonText(
                                                              list[
                                                                  "years"]!,
                                                              fontSize:
                                                                  font_14,
                                                              color: AppColors
                                                                  .colorGrey)
                                                        ]),
                                                        Row(
                                                            children: [
                                                              Container(
                                                                  height:
                                                                      height_20,
                                                                  width:
                                                                      height_20,
                                                                  decoration:
                                                                      BoxDecoration(color: AppColors.darkPinkColor, borderRadius: BorderRadius.circular(radius_50)),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(5.sp),
                                                                    child: imageAsset(chatsImage),
                                                                  )),
                                                              SizedBox(
                                                                  width:
                                                                      width_10),
                                                              Container(
                                                                  height:
                                                                      height_20,
                                                                  width:
                                                                      height_20,
                                                                  decoration:
                                                                      BoxDecoration(color: AppColors.darkPinkColor, borderRadius: BorderRadius.circular(radius_50)),
                                                                  child: Padding(padding: EdgeInsets.all(5.sp), child: imageAsset(delete))),
                                                              SizedBox(
                                                                  width:
                                                                      width_10)
                                                            ])
                                                      ])
                                                ]))
                                          ]))));
                        })
                  ]))));
    });
  }
}
