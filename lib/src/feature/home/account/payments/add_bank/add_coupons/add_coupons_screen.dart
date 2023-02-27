import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/add_bank_screen.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/add_coupons/add_coupons_vm.dart';

class AddCouponsScreen extends StatelessWidget {
  const AddCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(addCouponsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strCoupon,
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _vm.coupons.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext ctx, int i) {
                              var list = _vm.coupons[i];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddBankScreen()));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 20.sp),
                                      child: Container(
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                          radius_10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors
                                                        .lightestGreyColor,
                                                    blurRadius: 5,
                                                    spreadRadius: 2)
                                              ]),
                                          child: Stack(children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(
                                                        left: 40),
                                                child: Container(
                                                    padding:
                                                        EdgeInsets
                                                            .all(10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                CommonText(
                                                                    list["title"]!,
                                                                    fontSize: font_18,
                                                                    fontFamily: FontFamily.lexendSemiBold),
                                                                CommonText(
                                                                    "Apply",
                                                                    fontSize: font_18,
                                                                    fontFamily: FontFamily.lexendSemiBold,
                                                                    color: AppColors.darkPinkColor)
                                                              ]),
                                                          SizedBox(
                                                              height:
                                                                  height_2),
                                                          CommonText(
                                                              list[
                                                                  "save"]!,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              fontSize:
                                                                  font_15,
                                                              color: AppColors
                                                                  .lighterPinkColor2),
                                                          CommonText(
                                                              maxLines:
                                                                  1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              "------------------------------------------------------------------------------------------",
                                                              color: AppColors
                                                                  .lightGreyColor,
                                                              fontSize:
                                                                  font_15),
                                                          CommonText(
                                                              maxLines:
                                                                  2,
                                                              list[
                                                                  "des"]!,
                                                              color: AppColors
                                                                  .lightGreyColor,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              fontSize:
                                                                  font_15)
                                                        ]))),
                                            Container(
                                                height: height_100,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .horizontal(
                                                            left: Radius
                                                                .circular(
                                                                    radius_10)),
                                                    color: AppColors
                                                        .darkPinkColor),
                                                child: Center(
                                                    child: RotatedBox(
                                                        quarterTurns:
                                                            -1,
                                                        child: CommonText(
                                                            list[
                                                                "off"]!,
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontSize:
                                                                font_18))))
                                          ]))));
                            }),
                      ]))));
    });
  }
}
