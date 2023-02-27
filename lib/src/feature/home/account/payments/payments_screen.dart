import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/add_bank_screen.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/add_coupons/add_coupons_screen.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/payment_status/payment_status_screen.dart';
import 'package:zip_care/src/feature/home/account/payments/payments_vm.dart';
import '../../../../core/ui_component/common_text.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(paymentsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strPayment,
              fontSize: font_20,
              logo: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddBankScreen()));
                            },
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
                                child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: imageAsset(bank)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10.sp),
                                      child: CommonText(
                                          strAddPaymentMethod,
                                          color:
                                              AppColors.blueGreyColor,
                                          fontSize: font_15))
                                ]))),
                        SizedBox(height: height_20),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddCouponsScreen()));
                                  },
                                  child: Container(
                                      height: height_35,
                                      width: screenWidth / 2.8.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(
                                                  radius_50), // Creates border
                                          color: AppColors
                                              .darkPinkColor),
                                      child: Center(
                                          child: CommonText(
                                              "Add Coupons",
                                              color: AppColors
                                                  .whiteColor,
                                              fontSize: font_15)))),
                              Container(
                                  height: height_35,
                                  width: width_1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          radius_50), // Creates border
                                      color:
                                          AppColors.lightGreyColor)),
                              Container(
                                  height: height_35,
                                  width: screenWidth / 2.8.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors
                                              .blueGreyColor),
                                      borderRadius: BorderRadius.circular(
                                          radius_50), // Creates border
                                      color: AppColors.whiteColor),
                                  child: Center(
                                      child: CommonText(
                                          "Connect Stripe",
                                          color:
                                              AppColors.blueGreyColor,
                                          fontSize: font_15)))
                            ]),
                        SizedBox(height: height_30),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Recent Transactions",
                                  fontSize: font_18,
                                  fontFamily:
                                      FontFamily.lexendSemiBold)
                            ]),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.transactionsList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              var list = _vm.transactionsList[i];
                              return Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentStatusScreen(
                                                      name: list[
                                                          "name"]!,
                                                      status: list[
                                                          "status"]!,
                                                      amount: list[
                                                          "amount"]!,
                                                      img: list[
                                                          "img"]!,
                                                      date: "date")));
                                    },
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
                                            padding:
                                                EdgeInsets.all(10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(children: [
                                                    CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(
                                                                list[
                                                                    "img"]!)),
                                                    SizedBox(
                                                        width:
                                                            width_15),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CommonText(
                                                              list[
                                                                  "name"]!,
                                                              color: AppColors
                                                                  .blueGreyishColor,
                                                              fontSize:
                                                                  font_18),
                                                          SizedBox(
                                                              height:
                                                                  height_2),
                                                          CommonText(
                                                              list[
                                                                  "status"]!,
                                                              color: AppColors
                                                                  .darkGreenColor,
                                                              fontSize:
                                                                  font_15)
                                                        ])
                                                  ]),
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        CommonText(
                                                            list[
                                                                "amount"]!,
                                                            color: AppColors
                                                                .blueGreyishColor,
                                                            fontSize:
                                                                font_20,
                                                            fontFamily:
                                                                FontFamily
                                                                    .lexendBold),
                                                        SizedBox(
                                                            height:
                                                                height_2),
                                                        CommonText(
                                                            list[
                                                                "date"]!,
                                                            color: AppColors
                                                                .blueGreyishColor,
                                                            fontSize:
                                                                font_12)
                                                      ])
                                                ]))),
                                  ));
                            })
                      ]))));
    });
  }
}
