import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/login/login_screen.dart';
import 'package:zip_care/src/feature/auth/signup/signup_vm.dart';

import '../../../core/constants/colors.dart';
import '../../../core/ui_component/common_app_bar_with_back.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController fNameController =
      TextEditingController(text: "FistName");
  TextEditingController lNameController =
      TextEditingController(text: "Last Name");
  TextEditingController phoneNumberController =
      TextEditingController(text: "909090909090");
  TextEditingController emailController =
      TextEditingController(text: "Email@email.com");
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(signVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
            key: formKey,
            child: Column(children: [
              CommonAppBarWithBack(title: "Sign up", isBackActive: true),
              SizedBox(height: size.height * 0.1),
              CommonTextFiled(
                  controller: fNameController,
                  hintText: strFirstName,
                  name: "fName",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ])),
              SizedBox(height: 20.h),
              CommonTextFiled(
                controller: lNameController,
                hintText: strLastName,
                name: strLastName,
                keyboardType: TextInputType.name,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CommonTextFiled(
                  controller: phoneNumberController,
                  hintText: strPhoneNumber,
                  name: strPhoneNumber,
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ])),
              SizedBox(height: 20.h),
              CommonTextFiled(
                  controller: emailController,
                  hintText: strSearchAddress,
                  name: "email",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email()
                  ])),
              SizedBox(height: 20.h),
              CommonTextFiled(
                  controller: passwordController,
                  obscureText: _vm.isPasswordHide,
                  hintText: "Password",
                  name: "password",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8)
                  ])),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _vm.onPasswordShow();
                      },
                      icon: Icon(
                          _vm.isPasswordHide
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_sharp,
                          color: AppColors.colorGrey))),
              SizedBox(height: 20.h),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          _vm.onTeamsAndConditions();
                        },
                        child: Row(children: [
                          Icon(
                              _vm.isTeamsAndConditions
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank,
                              color: AppColors.darkPinkColor,
                              size: 20.0),
                          SizedBox(width: 10.w),
                          CommonText("I agree with all ",
                              fontWeight: FontWeight.w500,
                              color: AppColors.blueGreyColor)
                        ])),
                    InkWell(
                        onTap: () {},
                        child: CommonText("Terms & Conditions.",
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkPinkColor))
                  ])),
              SizedBox(height: 30.h),
              CommonButtonWidget(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      _vm.onSignUp(context);
                    }
                  },
                  text: "Sign Up"),
              SizedBox(height: 30.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonText("Already have an account? ",
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueGreyColor),
                    SizedBox(width: 5.0),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                          // _vm.clearEditTextController();
                        },
                        child: CommonText("Sign in",
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkPinkColor))
                  ]),
              SizedBox(height: 20.h)
            ])),
      ))));
    });
  }
}
