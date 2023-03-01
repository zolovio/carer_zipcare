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
import 'package:zip_care/src/feature/home/account/account_vm.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(accountVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Account", fontSize: font_20, logo: true, nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                                color: AppColors.darkPinkColor, width: 2)),
                        child: const Padding(
                            padding: EdgeInsets.all(3),
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(profileBackImage)))),
                    SizedBox(height: height_10),
                    const CommonText("Profile set-up"),
                    SizedBox(height: height_10),
                    Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            color: AppColors.lighterPinkColor,
                            borderRadius: BorderRadius.circular(radius_10)),
                        child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText("Only 1 step to go",
                                        fontFamily: FontFamily.lexendSemiBold,
                                        fontSize: font_16),
                                    CommonText("Finish set-up",
                                        color: AppColors.darkPinkColor,
                                        fontSize: font_16)
                                  ]),
                              CommonText("80%", fontSize: font_14),
                              Container(
                                  height: 10,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                      color: AppColors.darkPinkColor,
                                      borderRadius:
                                          BorderRadius.circular(radius_2))),
                              SizedBox(height: height_5),
                              CommonText(
                                  "Complete the steps to increase your chances for bookings.",
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  color: AppColors.blueGreyColor,
                                  fontSize: font_15)
                            ]))),
                    SizedBox(height: height_15),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _vm.accountList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          var list = _vm.accountList[index];
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => list["on"]));
                                  },
                                  child: Container(
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(radius_10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color:
                                                    AppColors.lightestGreyColor,
                                                blurRadius: 5,
                                                spreadRadius: 2)
                                          ]),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            imageAsset(list["img"]!,
                                                height: height_60),
                                            SizedBox(height: height_15),
                                            CommonText(list["title"]!,
                                                maxLines: 2,
                                                fontSize: font_17,
                                                color: AppColors.blueGreyColor,
                                                fontFamily:
                                                    FontFamily.lexendBold)
                                          ]))));
                        }),
                    //  Container(
                    //      height: 150,
                    //      child: ListView.builder(
                    //          itemCount: _vm.accountList.length,
                    //          itemBuilder: (context, index) {
                    //            return GestureDetector(
                    //                child: ListTile(
                    //                    title:
                    //                        Text(_vm.accountList[index][0])),
                    //                onTap: () {
                    //                  Navigator.push(
                    //                      context,
                    //                      MaterialPageRoute(
                    //                          builder: (context) =>
                    //                              _vm.accountList[index][1]));
                    //                });
                    //          }))
                  ]))));
    });
  }
}
