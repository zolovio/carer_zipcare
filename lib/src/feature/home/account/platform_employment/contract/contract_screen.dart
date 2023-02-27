import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/platform_employment/contract/contract_vm.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';

class ViewContractScreen extends StatelessWidget {
  final String title;
  const ViewContractScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(contractVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: title,
              nofi: true,
              isBackActive: true,
              fontSize: font_19),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            "Contract between ${_vm.contract["recipientName"]} and ${_vm.contract["yourSincerely"]}",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 2,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_20),
                        CommonText(
                            "Care recipient name : ${_vm.contract["recipientName"]}",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 2,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_20),
                        CommonText(
                            "Care recipient address : ${_vm.contract["address"]}",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 5,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_20),
                        CommonText(
                            "Services also include : ${_vm.contract["services"]} ",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 5,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_20),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: font_14,
                                    color: AppColors.colorGrey,
                                    fontFamily:
                                        FontFamily.lexendRegular),
                                children: [
                              TextSpan(
                                  text: "Employment begin : ",
                                  style: TextStyle(
                                      color:
                                          AppColors.lightGreyColor)),
                              TextSpan(
                                  text:
                                      "${_vm.contract["employmentBegin"]} ")
                            ])),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: font_14,
                                    color: AppColors.colorGrey,
                                    fontFamily:
                                        FontFamily.lexendRegular),
                                children: [
                              TextSpan(
                                  text: "Employment end    : ",
                                  style: TextStyle(
                                      color:
                                          AppColors.lightGreyColor)),
                              TextSpan(
                                  text:
                                      "${_vm.contract["employmentEnd"]} ")
                            ])),
                        SizedBox(height: height_20),
                        CommonText("Your Sincerely",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 5,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_5),
                        CommonText(_vm.contract["yourSincerely"],
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 5,
                            textAlign: TextAlign.start),
                        SizedBox(height: height_20),
                        CommonText(
                            "www.ZipCare.com is an Online platform for individuals requiring care or their agents and carers, to connect with each other. We do not introduce or supply to those seeking care Dummy text here...... ",
                            fontSize: font_14,
                            color: AppColors.colorGrey,
                            maxLines: 5,
                            textAlign: TextAlign.start),
                        Divider(height: height_60),
                        CommonButtonWidget(
                            buttonWidth: screenWidth,
                            onTap: () {},
                            text: "View",
                            icon: imageAsset(iconView,
                                height: height_20)),
                        SizedBox(height: height_10),
                        CommonButtonWidget(
                            buttonWidth: screenWidth,
                            onTap: () {},
                            text: "Download",
                            icon: imageAsset(downloadImage,
                                height: height_20))
                      ]))));
    });
  }
}
