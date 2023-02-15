import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/forget/forgetVm.dart';

import '../../../core/ui_component/common_app_bar_with_back.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(forgetVmProvider);
      return Scaffold(
          body: SafeArea(
              child: FormBuilder(
                  key: formKey,
                  child: Column(children: [
                    const CommonAppBarWithBack(
                        title: "Forgot Password", isBackActive: true),
                    SizedBox(height: size.height * 0.1),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: CommonText(strResettxt,
                            maxLines: 5,
                            textAlign: TextAlign.start,
                            fontSize: 14)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CommonTextFiled(
                            controller: _vm.emailController,
                            hintText: "Email Address",
                            name: "email",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.email()]))),
                    SizedBox(height: 50.h),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                            CommonButtonWidget(onTap: () {}, text: "Submit")),
                    SizedBox(height: 10.h)
                  ]))),
          resizeToAvoidBottomInset: false);
    });
  }
}
