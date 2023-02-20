import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/email_verification/email_verification_screen.dart';

final phoneVerificationVmProvider =
    ChangeNotifierProvider.autoDispose<PhoneVerificationVm>((ref) {
  return PhoneVerificationVm();
});

class PhoneVerificationVm extends ChangeNotifier {
  late TextEditingController emailController;
  late List<TextInputFormatter> emojiHide;

  PhoneVerificationVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
  }

  //!*===================================== intialize all controller that are used in controller ====================================*/

  intializeEditText() {
    disableEmoji();
    emailController = TextEditingController();
  }

  disableEmoji() {
    emojiHide = [
      FilteringTextInputFormatter(
          RegExp(
              r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
          allow: false)
    ];
  }

  void onVerify(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EmailVerificationScreen()));
    notifyListeners();
  }
}
