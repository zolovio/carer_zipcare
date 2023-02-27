import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/contact/contact_vm.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(contactVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Contact",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    CommonText(
                        "Fill out the form to get help with your quote.",
                        fontSize: font_18,
                        maxLines: 2,
                        color: AppColors.colorGrey),
                    SizedBox(height: height_10),
                    CommonTextFiled(
                        controller: _vm.name,
                        hintText: "Full Name",
                        name: "name",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                    SizedBox(height: height_10),
                    CommonTextFiled(
                        controller: _vm.phoneNumber,
                        hintText: "Phone Number",
                        name: "phoneNumber",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                    SizedBox(height: height_10),
                    CommonTextFiled(
                        controller: _vm.email,
                        hintText: "Email Address",
                        name: "emailAddress",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                    SizedBox(height: height_10),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      child: FormBuilderTextField(
                          minLines: 8,
                          maxLines: null,
                          controller: _vm.message,
                          decoration: InputDecoration(
                              hintText: "write message here...",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      radius_15),
                                  borderSide: BorderSide(
                                      color: AppColors
                                          .lightestGreyColor)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      radius_15)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      radius_15),
                                  borderSide: BorderSide(
                                      color: AppColors
                                          .lightestGreyColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      radius_15),
                                  borderSide: BorderSide(
                                      color:
                                          AppColors.darkPinkColor)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(radius_15),
                                  borderSide: BorderSide(color: AppColors.colorPink))),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          keyboardType: TextInputType.multiline,
                          name: "emailAddress"),
                    ),
                    SizedBox(height: height_30),
                    CommonButtonWidget(
                        onTap: () {}, text: "Get help now!")
                  ]))));
    });
  }
}
