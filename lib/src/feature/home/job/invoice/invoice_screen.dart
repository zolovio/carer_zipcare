import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/job/invoice/invoice_vm.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(invoiceVmProvider);
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.darkPinkColor,
              foregroundColor: Colors.white,
              onPressed: () {},
              child: Icon(Icons.add)),
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
                                    title: "Invoices",
                                    isBackActive: true,
                                    nofi: true,
                                    fontSize: font_18)),
                            SizedBox(height: height_10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                      "Invoices for John Watson",
                                      fontSize: font_16,
                                      fontFamily:
                                          FontFamily.lexendBold),
                                  CommonText("Job Id: 126565 ",
                                      fontSize: font_15)
                                ]),
                            ListView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(),
                                itemCount: _vm.invoiceList.length,
                                itemBuilder:
                                    (BuildContext context, int i) {
                                  var item = _vm.invoiceList[i];
                                  return InvoiceTile(
                                      no: "${i + 1}",
                                      title: item['invoiceTitle'],
                                      date: item['invoiceDate'],
                                      status: item['status'],
                                      amount: item['Amount']);
                                }),
                            SizedBox(height: height_30),
                          ])))));
    });
  }
}

class InvoiceTile extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String amount;
  final String no;

  const InvoiceTile(
      {super.key,
      required this.title,
      required this.date,
      required this.status,
      required this.amount,
      required this.no});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: height_55,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius_10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.lightestGreyColor,
                  blurRadius: 5,
                  spreadRadius: 2)
            ]),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      child: CommonText(no),
                      backgroundColor:
                          AppColors.darkPinkColor.withOpacity(.2)),
                  SizedBox(width: width_10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(title,
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendBold),
                        SizedBox(height: height_5),
                        CommonText(date,
                            fontSize: font_13,
                            color: AppColors.colorGrey)
                      ]),
                  Spacer(),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText("+ $amount",
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendBold),
                        SizedBox(height: height_5),
                        CommonText(
                            status == "0" ? "Pending" : "Completed",
                            fontSize: font_13,
                            color: status == "0"
                                ? Colors.yellow
                                : AppColors.greenColor)
                      ])
                ])));
  }
}
