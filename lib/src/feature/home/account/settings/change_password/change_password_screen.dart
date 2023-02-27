import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/feature/home/account/settings/change_password/change_password_vm.dart';
import 'package:zip_care/src/feature/home/account/settings/change_password/password_changed_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var screenWidth = MediaQuery.of(context).size.width;
      final _vm = ref.watch(changePasswordVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strChangePassword,
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    CommonTextFiled(
                        controller: _vm.oldPasswordController,
                        obscureText: _vm.isOldPasswordHide,
                        hintText: "Old password",
                        name: "oldPassword",
                        keyboardType: TextInputType.visiblePassword,
                        validator:
                            (FormBuilderValidators.compose([])),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _vm.onOldPasswordShow();
                            },
                            icon: Icon(
                                _vm.isOldPasswordHide
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_sharp,
                                color: AppColors.colorGrey))),
                    SizedBox(height: height_10),
                    CommonTextFiled(
                        controller: _vm.newPasswordController,
                        obscureText: _vm.isNewPasswordHide,
                        hintText: "New password",
                        name: "newPassword",
                        keyboardType: TextInputType.visiblePassword,
                        validator:
                            (FormBuilderValidators.compose([])),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _vm.onNewPasswordShow();
                            },
                            icon: Icon(
                                _vm.isNewPasswordHide
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_sharp,
                                color: AppColors.colorGrey))),
                    SizedBox(height: height_10),
                    CommonTextFiled(
                        controller: _vm.confirmPasswordController,
                        obscureText: _vm.isConfirmPasswordHide,
                        hintText: "Confirm new password",
                        name: "confirmNewPassword",
                        keyboardType: TextInputType.visiblePassword,
                        validator:
                            (FormBuilderValidators.compose([])),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _vm.onConfirmPasswordShow();
                            },
                            icon: Icon(
                                _vm.isConfirmPasswordHide
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_sharp,
                                color: AppColors.colorGrey))),
                    SizedBox(height: height_10),
                    CommonButtonWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PasswordChangedScreen()));
                        },
                        text: "Change Password")
                  ]))));
    });
  }
}
