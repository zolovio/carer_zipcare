import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgetVmProvider = ChangeNotifierProvider.autoDispose<ForgetVm>((ref) {
  return ForgetVm();
});

class ForgetVm extends ChangeNotifier {
  late TextEditingController emailController;
  late List<TextInputFormatter> emojiHide;

  ForgetVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
    clearEditTextController();
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

  @override
  void dispose() {
    clearEditTextController();
    super.dispose();
  }

  //!*======================================= clear all edit text controller that are used in Controller ===========================================*/

  clearEditTextController() {
    emailController.clear();
  }
}
