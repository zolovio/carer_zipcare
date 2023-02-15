import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/phoneVerification/phoneVerificationScreen.dart';
import 'package:zip_care/src/feature/auth/registration/personalInfo/personalInfoScreen.dart';

final signVmProvider =
    ChangeNotifierProvider.autoDispose<SignUpVm>((ref) {
  return SignUpVm();
});

class SignUpVm extends ChangeNotifier {
  late List<TextInputFormatter> emojiHide;
  late bool isPasswordHide = true;
  bool isTeamsAndConditions = false;

  SignUpVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
  }

  /*===================================== intialize all controller that are used in controller ====================================*/

  intializeEditText() {
    isPasswordHide = true;
    disableEmoji();
    // fNameController = TextEditingController();
    // lNameController = TextEditingController();
    // phoneNumberController = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
  }

  disableEmoji() {
    emojiHide = <TextInputFormatter>[
      FilteringTextInputFormatter(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
          allow: false)
    ];
  }

  @override
  void dispose() {
    // clearEditTextController();

    super.dispose();
  }

  //*======================================= clear all edit text controller that are used in Controller ===========================================*/

  // clearEditTextController() {
  //   fNameController.clear();
  //   lNameController.clear();
  //   phoneNumberController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  //   emailController.clear();
  // }

  void onPasswordShow() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }

  void onTeamsAndConditions() {
    isTeamsAndConditions = !isTeamsAndConditions;
    notifyListeners();
  }

  void onSignUp(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PhoneVerificationScreen()));
    // _vm.clearEditTextController();
    notifyListeners();
  }
}
