import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zip_care/src/core/app_utils/textstyle.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/auth/phoneVerification/phoneVm.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool hasError = false;
  String currentText = "";
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message!), duration: const Duration(seconds: 2)));
  }

  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;
  void _resendCode() {
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(phoneVerificationVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FormBuilder(
              key: formKey,
              child: Column(children: [
                CommonAppBarWithBack(
                    title: "Phone Verification", isBackActive: true),
                SizedBox(height: size.height * 0.1),
                imageAsset(otpIllus, height: height_120, width: height_140),
                SizedBox(height: 20.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold),
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '•',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12),
                            fieldHeight: 40,
                            fieldWidth: 50,
                            errorBorderColor: AppColors.purpleLightColor,
                            borderWidth: 1,
                            activeColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                            inactiveColor: Colors.black),
                        cursorColor: Colors.amber,
                        animationDuration: const Duration(milliseconds: 300),
                        // enableActiveFill: true,
                        errorAnimationController: errorController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        })),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Enter your OTP code here",
                        style: textStyleMedium(fontsize: 15))),
                SizedBox(height: 50.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Resend code in ", style: textStyleMedium()),
                  Text("$secondsRemaining",
                      style: textStyleMedium(color: AppColors.darkPinkColor))
                ]),

                SizedBox(height: 20.h),
                // ElevatedButton(
                //     child: Text("Resend code in"),
                //     onPressed: enableResend ? _resendCode : null),
                CommonButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        _vm.onVerify(context);
                      }
                    },
                    text: "Submit")
              ])),
        ),
      )));
    });
  }
}
