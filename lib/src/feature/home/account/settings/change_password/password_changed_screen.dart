import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/account/settings/change_password/change_password_vm.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(changePasswordVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Password Changed",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.sp, vertical: 15.sp),
              child: Column(children: [
                imageAsset(passwordChanged),
                SizedBox(height: height_50),
                CommonText(
                    "Your password has been \nsuccessfully changed.",
                    fontSize: font_17,
                    fontFamily: FontFamily.lexendSemiBold),
                Spacer(),
                CommonButtonWidget(
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        color: AppColors.whiteColor, size: 15.sp),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    text: "Go Back")
              ])));
    });
  }
}
