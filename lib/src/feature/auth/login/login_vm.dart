import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginVmProvider = ChangeNotifierProvider.autoDispose<LoginVm>((ref) {
  return LoginVm();
});

class LoginVm extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late List<TextInputFormatter> emojiHide;
  late bool isPasswordHide = true;
  bool isRemember = false;

  LoginVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
    getDeviceInfo();
    clearEditTextController();
  }

//*===================================== intialize all controller that are used in controller ====================================*/

  intializeEditText() {
    isPasswordHide = true;
    disableEmoji();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  disableEmoji() {
    emojiHide = <TextInputFormatter>[
      FilteringTextInputFormatter(
        RegExp(
            r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        allow: false,
      ),
    ];
  }

  //*=========================================================== check box button =========================================================*/

  /*saveRememberMeData(LoginResponseModel loginResponseModel) async {
    if (checkBox == true) {
      rememberMeModel.email = emailController.text.trim();
      rememberMeModel.password = passwordController.text.trim();
      rememberMeModel.userType = loginResponseModel.detail?.roleId;
      LocalStorage.saveRemeberData(rememberMeModel);
      await LocalStorage.getsaveRemeberData(loginResponseModel.detail?.roleId);
    } else {
      rememberMeModel.email = "";
      rememberMeModel.password = "";
      LocalStorage.saveRemeberData(rememberMeModel);
    }
  }*/

  @override
  void dispose() {
    clearEditTextController();

    super.dispose();
  }

  /*======================================= clear all edit text controller that are used in Controller ===========================================*/

  clearEditTextController() {
    emailController.clear();
    passwordController.clear();
  }

  //*********************************************** device info*******************************************
  getDeviceInfo() async {
    // DeviceInfoPlugin info = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
    //   deviceName = androidDeviceInfo.model!;
    //   deviceType = 1;
    //   deviceToken = androidDeviceInfo.id!;
    //
    //   return androidDeviceInfo.model;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosDeviceInfo = await info.iosInfo;
    //   deviceName = iosDeviceInfo.model!;
    //   deviceType = 2;
    //   deviceToken = iosDeviceInfo.identifierForVendor!;
    //   return info.iosInfo.toString();
    // }
  }

  rememberMe() {}

  gotoSignUp() {
    // Get.toNamed(Routes.signUpRoute);
  }

  gotoForgotPassword() {
    // Get.toNamed(Routes.forgotRoute);
  }

  void onPasswordShow() {
    isPasswordHide = !isPasswordHide;
    notifyListeners();
  }

  void onRemember() {
    isRemember = !isRemember;
    notifyListeners();
  }

  void onLogin() {
    print("OK");
    notifyListeners();
  }
}
