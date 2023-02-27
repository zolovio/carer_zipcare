import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/payments/add_bank/add_bank_vm.dart';

class AddBankScreen extends StatelessWidget {
  const AddBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(addBankVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Add Bank",
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
                        Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(radius_10)),
                            child:
                                Column(children: [imageAsset(bank)])),
                        SizedBox(height: height_30),
                        CommonText(strAccountName,
                            color: AppColors.blueGreyColor,
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendSemiBold),
                        SizedBox(height: height_10),
                        CommonTextFiled(
                            controller: _vm.acName,
                            hintText: "",
                            name: "accountName",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()
                            ])),
                        SizedBox(height: height_20),
                        CommonText(strSociety,
                            color: AppColors.blueGreyColor,
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendSemiBold),
                        SizedBox(height: height_10),
                        CommonTextFiled(
                            controller: _vm.bankAddress,
                            hintText: "",
                            name: "bankAddress",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()
                            ])),
                        SizedBox(height: height_20),
                        CommonText(strSort,
                            color: AppColors.blueGreyColor,
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendSemiBold),
                        SizedBox(height: height_10),
                        CommonTextFiled(
                            controller: _vm.sortCode,
                            hintText: "",
                            name: "sortCode",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()
                            ])),
                        SizedBox(height: height_20),
                        CommonText(strBankAccount,
                            color: AppColors.blueGreyColor,
                            fontSize: font_16,
                            fontFamily: FontFamily.lexendSemiBold),
                        SizedBox(height: height_10),
                        CommonTextFiled(
                            controller: _vm.acNo,
                            hintText: "",
                            name: "accountNo",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()])),
                        SizedBox(height: height_40),
                        CommonButtonWidget(
                            buttonWidth: screenWidth,
                            onTap: () {},
                            text: "Save",
                            icon: imageAsset(save, height: height_20))
                      ]))));
    });
  }
}
