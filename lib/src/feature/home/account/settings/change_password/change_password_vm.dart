import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordVmProvider =
    ChangeNotifierProvider.autoDispose<ChangePasswordVm>((ref) {
  return ChangePasswordVm();
});

class ChangePasswordVm extends ChangeNotifier {
  bool isOldPasswordHide = true;
  bool isNewPasswordHide = true;
  bool isConfirmPasswordHide = true;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  ChangePasswordVm() {
    onInit();
  }
  void onInit() {
    intializeEditText();
    clearEditTextController();
  }

  intializeEditText() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    clearEditTextController();

    super.dispose();
  }

  clearEditTextController() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  void onOldPasswordShow() {
    isOldPasswordHide = !isOldPasswordHide;
    notifyListeners();
  }

  void onNewPasswordShow() {
    isNewPasswordHide = !isNewPasswordHide;
    notifyListeners();
  }

  void onConfirmPasswordShow() {
    isConfirmPasswordHide = !isConfirmPasswordHide;
    notifyListeners();
  }
}
