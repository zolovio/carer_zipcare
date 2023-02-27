import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/payment_status/payment_status_vm.dart';

class PaymentStatusScreen extends StatelessWidget {
  final String name;
  final String status;
  final String amount;
  final String img;
  final String date;
  const PaymentStatusScreen(
      {super.key,
      required this.name,
      required this.status,
      required this.amount,
      required this.img,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(paymentStatusProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strPaymentStatus,
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.sp, vertical: 15.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("$img"),
                              ),
                              title: CommonText("$name",
                                  fontSize: font_15,
                                  textAlign: TextAlign.start,
                                  fontFamily:
                                      FontFamily.lexendSemiBold),
                              subtitle: CommonText("July 10, 2022",
                                  fontSize: font_15,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start)),
                          SizedBox(height: height_10),
                          Container(
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(
                                            255, 252, 108, 180),
                                        Color.fromARGB(
                                            255, 253, 158, 206)
                                      ]),
                                  borderRadius: BorderRadius.circular(
                                      radius_15)),
                              child: Padding(
                                  padding: EdgeInsets.all(20.sp),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonText(
                                            "Your payment Received",
                                            color:
                                                AppColors.whiteColor,
                                            fontSize: font_20,
                                            fontFamily: FontFamily
                                                .lexendSemiBold),
                                        SizedBox(height: height_5),
                                        CommonText("$amount",
                                            color:
                                                AppColors.whiteColor,
                                            fontSize: font_35,
                                            fontFamily: FontFamily
                                                .lexendSemiBold)
                                      ]))),
                          Divider(height: height_40),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText("Status",
                                              fontSize: font_16,
                                              color: AppColors
                                                  .blueGreyColor,
                                              textAlign:
                                                  TextAlign.start),
                                          CommonText("$status",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                          SizedBox(height: height_20),
                                          CommonText("Transfer Id",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start,
                                              color: AppColors
                                                  .blueGreyColor),
                                          CommonText("00000000110101",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                          SizedBox(height: height_20),
                                          CommonText("Invoice Id",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start,
                                              color: AppColors
                                                  .blueGreyColor),
                                          CommonText("INV17307",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText("Invoice Date",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start,
                                              color: AppColors
                                                  .blueGreyColor),
                                          CommonText("June 21, 2022",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                          SizedBox(height: height_20),
                                          CommonText("Date Paid",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start,
                                              color: AppColors
                                                  .blueGreyColor),
                                          CommonText("June 21, 2022",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                          SizedBox(height: height_20),
                                          CommonText("Job Id",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start,
                                              color: AppColors
                                                  .blueGreyColor),
                                          CommonText("126565",
                                              fontSize: font_16,
                                              textAlign:
                                                  TextAlign.start),
                                        ])
                                  ])),
                          SizedBox(height: height_70),
                          imageAsset(imageCompleted,
                              height: height_80)
                        ],
                      ),
                    ),
                  ])));
    });
  }
}
