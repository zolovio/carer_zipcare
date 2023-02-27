import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/platform_employment/contract/contract_screen.dart';
import 'package:zip_care/src/feature/home/account/platform_employment/platform_employment_vm.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';

class PlatformEmploymentScreen extends StatelessWidget {
  const PlatformEmploymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBarWithBack(
            title: "Platform Employement",
            nofi: true,
            isBackActive: true,
            fontSize: font_19),
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                        backgroundColor: Colors.transparent,
                        bottom: TabBar(
                            unselectedLabelColor:
                                AppColors.blueGreyColor,
                            labelColor: AppColors.whiteColor,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    radius_50), // Creates border
                                color: AppColors.darkPinkColor),
                            tabs: [
                              Tab(
                                  icon: Text(strPayslips,
                                      style: TextStyle(
                                          fontFamily: FontFamily
                                              .lexendRegular))),
                              Tab(
                                  icon: Text(strContract,
                                      style: TextStyle(
                                          fontFamily: FontFamily
                                              .lexendRegular)))
                            ]))
                  ];
                },
                body: TabBarView(children: [
                  PayslipsScreen(),
                  ContractScreen(),
                ]))));
  }
}

class PayslipsScreen extends StatelessWidget {
  const PayslipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(platformEmploymentVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 15.sp),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _vm.payslips.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            var list = _vm.payslips[index];
                            return Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors
                                                  .blueGreyColor
                                                  .withOpacity(0.3),
                                              blurRadius: 10)
                                        ]),
                                    child: ListTile(
                                        title: CommonText(
                                            "Payslip ${index + 1}",
                                            textAlign:
                                                TextAlign.start),
                                        subtitle: CommonText(
                                            list["date"]!,
                                            textAlign:
                                                TextAlign.start,
                                            fontSize: font_14,
                                            color: AppColors
                                                .blueGreyColor),
                                        trailing: imageAsset(
                                            ic_download,
                                            height: height_18),
                                        leading: CircleAvatar(
                                            backgroundImage:
                                                AssetImage(icSq)))));
                          })))));
    });
  }
}

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(platformEmploymentVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 15.sp),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _vm.contract.length,
                          itemBuilder:
                              (BuildContext context, int index) {
                            var list = _vm.contract[index];
                            return Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors
                                                  .blueGreyColor
                                                  .withOpacity(0.3),
                                              blurRadius: 10)
                                        ]),
                                    child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewContractScreen(
                                                          title:
                                                              "Contract ${index + 1}")));
                                        },
                                        title: CommonText(
                                            "Contract ${index + 1}",
                                            textAlign:
                                                TextAlign.start),
                                        subtitle: CommonText(
                                            list["date"]!,
                                            textAlign:
                                                TextAlign.start,
                                            fontSize: font_14,
                                            color: AppColors
                                                .blueGreyColor),
                                        trailing: imageAsset(
                                            ic_download,
                                            height: height_18),
                                        leading: CircleAvatar(
                                            backgroundImage:
                                                AssetImage(icSq)))));
                          })))));
    });
  }
}
