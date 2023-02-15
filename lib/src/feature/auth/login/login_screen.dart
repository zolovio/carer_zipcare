import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/forget/forgetScreen.dart';
import 'package:zip_care/src/feature/auth/signup/signup_screen.dart';

import '../../../core/constants/colors.dart';
import '../../../core/ui_component/common_app_bar_with_back.dart';
import 'login_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(loginVmProvider);
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: FormBuilder(
                      key: formKey,
                      child: Column(children: [
                        CommonAppBarWithBack(title: "Sign In"),
                        SizedBox(height: size.height * 0.1),
                        CommonTextFiled(
                            controller: _vm.emailController,
                            hintText: strEmailAddress,
                            name: "email",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email()
                            ])),
                        SizedBox(height: 20.h),
                        CommonTextFiled(
                            controller: _vm.passwordController,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        _vm.onRemember();
                                      },
                                      child: Row(children: [
                                        Icon(
                                            _vm.isRemember
                                                ? Icons.check_box_outlined
                                                : Icons.check_box_outline_blank,
                                            color: AppColors.darkPinkColor,
                                            size: 20.0),
                                        SizedBox(width: 10.w),
                                        const CommonText("Remember Me",
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blueGreyColor)
                                      ])),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetScreen()));
                                      },
                                      child: CommonText(strForgotpassword,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPinkColor))
                                ])),
                        SizedBox(height: 30.h),
                        CommonButtonWidget(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                _vm.onLogin();
                              }
                            },
                            text: "Sign In"),
                        SizedBox(height: 250.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText("Don’t have an account?",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blueGreyColor),
                              SizedBox(width: 5.0),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                    _vm.clearEditTextController();
                                  },
                                  child: CommonText("Sign up",
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkPinkColor))
                            ]),
                        SizedBox(height: 20.h)
                      ])),
                ),
              )),
              resizeToAvoidBottomInset: false));
    });
  }
}
