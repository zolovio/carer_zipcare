import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/login/login_screen.dart';
import 'package:zip_care/src/feature/home/account/settings/change_password/change_password_screen.dart';
import 'package:zip_care/src/feature/home/account/settings/settings_vm.dart';
import 'package:zip_care/src/feature/home/account/settings/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:zip_care/src/feature/home/account/settings/terms_and_conditions/terms_and_conditions_vm.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(settingsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Settings",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: CommonText(strNotifications,
                            fontSize: font_18,
                            textAlign: TextAlign.start),
                        trailing: CupertinoSwitch(
                            value: switchValue,
                            activeColor: AppColors.darkPinkColor,
                            onChanged: (bool value) {})),
                    Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 0),
                    SizedBox(height: height_5),
                    ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePasswordScreen()));
                        },
                        contentPadding: EdgeInsets.zero,
                        title: CommonText(strChangePassword,
                            fontSize: font_18,
                            textAlign: TextAlign.start)),
                    Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 0),
                    SizedBox(height: height_5),
                    ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TermsAndConditionsScreen()));
                        },
                        contentPadding: EdgeInsets.zero,
                        title: CommonText(strTermsAndConditions,
                            fontSize: font_18,
                            textAlign: TextAlign.start)),
                    Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 0),
                  ]))));
    });
  }
}
