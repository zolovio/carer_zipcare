import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/settings/terms_and_conditions/terms_and_conditions_vm.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(termsAndConditionsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strConditions,
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    CommonText(_vm.termsAndConditions["des"],
                        maxLines: 10000000,
                        height: 1.7.sp,
                        fontSize: font_16,
                        textAlign: TextAlign.start,
                        color: AppColors.blueGreyColor)
                  ]))));
    });
  }
}
