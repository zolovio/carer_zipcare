import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/registration/id_verification/id_verification_vm.dart';

import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class IDverificationScreen extends StatefulWidget {
  const IDverificationScreen({super.key});

  @override
  State<IDverificationScreen> createState() =>
      _IDverificationScreenState();
}

class _IDverificationScreenState extends State<IDverificationScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(iDverificationVmProvider);
      return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FormBuilder(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonAppBarWithBack(
                        isSkip: true,
                        onSkip: () {
                          _vm.onNext(context);
                        },
                        title: strIdVerification,
                        isBackActive: true),
                    PageNumber(no: "8"),
                    SizedBox(height: size.height * 0.05),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonText("Scan any Id proof",
                            fontSize: 15)),
                    SizedBox(height: 20.h),
                    Center(child: Text("scanning...")),
                    SizedBox(height: 20.h),
                    CommonNextButtonWidget(
                        onTap: () {
                          // if (formKey.currentState!
                          //     .validate()) {
                          _vm.onNext(context);
                          // }
                        },
                        text: strNext),
                    SizedBox(height: 20.h)
                  ])),
        ),
      )));
    });
  }
}
