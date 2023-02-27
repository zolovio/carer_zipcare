import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/job/invoice_detail/invoice_detail_vm.dart';
import 'package:zip_care/src/feature/home/job/service_agreement/service_agreement.dart';

class InvoiceDetailScreen extends StatefulWidget {
  const InvoiceDetailScreen({super.key});

  @override
  State<InvoiceDetailScreen> createState() =>
      _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends State<InvoiceDetailScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(invoiceDetailVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strInvoice, isBackActive: true, nofi: true),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.05),
                        _vm.status == 4
                            ? Container()
                            : StatusContainer(
                                bgColor: _vm.status == 0
                                    ? AppColors.darkPinkColor
                                    : _vm.status == 1
                                        ? Colors.green
                                        : _vm.status == 2
                                            ? Colors.red
                                            : AppColors.darkPinkColor,
                                title: _vm.status == 0
                                    ? "Pending for client approval"
                                    : _vm.status == 1
                                        ? "Approved\nWe have your funds and you can claim them once the job is completed"
                                        : _vm.status == 2
                                            ? "Cancelled"
                                            : "Preview service agreement"),
                        SizedBox(height: 15),
                        //address
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    CommonText("From: Ali Abrahim",
                                        fontSize: font_14,
                                        textAlign: TextAlign.start),
                                    CommonText(
                                        "28 Narrowboat Close,\nCoventry, \nCV6 6RD, UK",
                                        fontSize: font_14,
                                        color:
                                            AppColors.blueGreyColor,
                                        textAlign: TextAlign.start),
                                  ]),
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    CommonText("To: John Watson",
                                        fontSize: font_14,
                                        textAlign: TextAlign.start),
                                    CommonText(
                                        "28 Narrowboat Close,\nCoventry,\nCV6 6RD, UK",
                                        fontSize: font_14,
                                        color:
                                            AppColors.blueGreyColor,
                                        textAlign: TextAlign.start),
                                  ])
                            ]),
                        Divider(),
                        //bill
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Invoice Date",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start),
                              CommonText("June 21, 2022",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start)
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Job id",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start),
                              CommonText("126565",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start)
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Service Agreement No.",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start),
                              CommonText("AG20347",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start)
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Invoice Date",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start),
                              CommonText("09 July 2022",
                                  fontSize: font_14,
                                  color: AppColors.blueGreyColor,
                                  textAlign: TextAlign.start)
                            ]),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        CommonText("Care Recipient: John Watson",
                            fontSize: font_14,
                            textAlign: TextAlign.start),
                        CommonText(
                            "28 Narrowboat Close, Coventry, CV6 6RD, UK",
                            fontSize: font_12,
                            color: AppColors.blueGreyColor,
                            textAlign: TextAlign.start),
                        SizedBox(height: 10),
                        //Amount

                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(5),
                          color:
                              AppColors.darkPinkColor.withOpacity(.4),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: size.width * .05,
                                  child: CommonText("#")),
                              Container(
                                  width: 1,
                                  color: Colors.grey[800],
                                  height: 15),
                              Container(
                                  width: size.width * .27,
                                  child: CommonText("Start date/Time",
                                      fontSize: font_11)),
                              Container(
                                  width: 1,
                                  color: Colors.grey[800],
                                  height: 15),
                              Container(
                                  width: size.width * .27,
                                  child: CommonText("End date/Time",
                                      fontSize: font_11)),
                              Container(
                                  width: 1,
                                  color: Colors.grey[800],
                                  height: 15),
                              Container(
                                  width: size.width * .27,
                                  child: CommonText("Amount",
                                      fontSize: font_11)),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: size.width * .05,
                                child: CommonText("1.")),
                            Container(
                                width: 1,
                                color: Colors.grey[800],
                                height: 30),
                            Container(
                                width: size.width * .27,
                                child: CommonText(
                                    "10 July 2022 10:00",
                                    fontSize: font_11)),
                            Container(
                                width: 1,
                                color: Colors.grey[800],
                                height: 30),
                            Container(
                                width: size.width * .27,
                                child: CommonText(
                                    "10 July 2022 14:00",
                                    fontSize: font_11)),
                            Container(
                                width: 1,
                                color: Colors.grey[800],
                                height: 30),
                            Container(
                                width: size.width * .27,
                                child: CommonText("200",
                                    fontSize: font_11)),
                          ],
                        ),
                        SizedBox(height: 10),

                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(5),
                          color:
                              AppColors.darkPinkColor.withOpacity(.4),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText("Total"),
                              CommonText("£ 200"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: size.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xffEDEBFF),
                              borderRadius:
                                  BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                  "Amount you will receive after deduction(10% inc VAT)",
                                  fontSize: font_11),
                              CommonText("£ 200"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        _vm.status == 1
                            ? Column(
                                children: [
                                  CommonNextButtonWidget(
                                      onTap: () {
                                        _vm.updateComplete();
                                      },
                                      text: strJobCompleted,
                                      icon: Icons.done_all),
                                  SizedBox(height: 15),
                                  CommonNextButtonWidget(
                                      onTap: () {},
                                      text: strDownload,
                                      icon: Icons.download_outlined),
                                  Divider(),
                                  !_vm.jobCompleted
                                      ? SizedBox()
                                      : Column(
                                          children: [
                                            Divider(),
                                            CommonText(
                                                "Post a Review",
                                                fontSize: font_15),
                                            CommonText(
                                                "How was your shift ?",
                                                fontSize: font_13),
                                            SizedBox(height: 10),
                                            RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                itemSize: 25,
                                                direction:
                                                    Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context,
                                                        _) =>
                                                    Icon(Icons.star,
                                                        color: Colors
                                                            .amber),
                                                onRatingUpdate:
                                                    (rating) {
                                                  if (rating < 3) {
                                                    showDialog(
                                                        context:
                                                            context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(
                                                                        13))),
                                                                content: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Center(
                                                                              child: Container(
                                                                                  width: size.width,
                                                                                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(13)),
                                                                                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                    Center(child: Image.asset(error, height: 120)),
                                                                                    SizedBox(height: height_5),
                                                                                    Container(
                                                                                        color: AppColors.darkPinkColor,
                                                                                        width: size.width,
                                                                                        child: Column(
                                                                                          children: [
                                                                                            CommonText("Oops ! we are sorry", color: AppColors.whiteColor, fontSize: 15.sp, fontFamily: FontFamily.lexendSemiBold),
                                                                                            SizedBox(height: height_10),
                                                                                            CommonText("Please share your issue below.", fontSize: 13, color: AppColors.whiteColor, maxLines: 2),
                                                                                          ],
                                                                                        )),
                                                                                    CommonTextFiled(maxLine: 3, hintText: "Type here...", name: "", validator: null),
                                                                                    SizedBox(height: height_10),
                                                                                    CommonButtonWidget(onTap: () {}, text: "Submit"),
                                                                                    SizedBox(height: height_10),
                                                                                  ]))))
                                                                    ])));
                                                  } else {
                                                    showDialog(
                                                        context:
                                                            context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(
                                                                        13))),
                                                                content: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.all(10),
                                                                          child: Center(
                                                                              child: Container(
                                                                                  width: size.width,
                                                                                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(13)),
                                                                                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                    Center(child: Image.asset(icdone, height: 120)),
                                                                                    SizedBox(height: height_5),
                                                                                    Container(
                                                                                        color: AppColors.darkPinkColor,
                                                                                        width: size.width,
                                                                                        child: Column(
                                                                                          children: [
                                                                                            CommonText(strCareToShareMore, color: AppColors.whiteColor, fontSize: 15.sp, fontFamily: FontFamily.lexendSemiBold),
                                                                                            SizedBox(height: height_10),
                                                                                            CommonText(strHowWasYourOverallExpirence, fontSize: 13, color: AppColors.whiteColor, maxLines: 2),
                                                                                          ],
                                                                                        )),
                                                                                    CommonTextFiled(maxLine: 3, hintText: "Do you have any additional comments?\nType here...", name: "", validator: null),
                                                                                    SizedBox(height: height_10),
                                                                                    CommonButtonWidget(onTap: () {}, text: "Submit"),
                                                                                    SizedBox(height: height_10),
                                                                                  ]))))
                                                                    ])));
                                                  }
                                                }),
                                            SizedBox(height: 10),
                                            Text("Report issue",
                                                style: TextStyle(
                                                    fontFamily: FontFamily
                                                        .lexendRegular,
                                                    decoration:
                                                        TextDecoration
                                                            .underline)),
                                            Divider(),
                                          ],
                                        ),
                                ],
                              )
                            : CommonNextButtonWidget(
                                onTap: () {
                                  _vm.status == 4
                                      ? _vm.updateStatus(0)
                                      : _vm.status == 1
                                          ? _vm.updateStatus(2)
                                          : _vm.updateStatus(1);
                                  // if (formKey.currentState!
                                  //     .validate()) {
                                  // _vm.onNext(context);
                                  // }
                                },
                                text: strSendForApproval,
                                icon: Icons.last_page,
                              ),
                        SizedBox(height: 20.h),
                      ])),
            ),
          ));
    });
  }
}
