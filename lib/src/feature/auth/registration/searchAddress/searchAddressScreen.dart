import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/common/widgets/decoration.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/feature/auth/registration/SearchAddress/SearchAddressVM.dart';

class SearchAddressScreen extends StatefulWidget {
  const SearchAddressScreen({super.key});

  @override
  State<SearchAddressScreen> createState() =>
      _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(searchAddressVmProvider);
      return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FormBuilder(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            CommonAppBarWithBack(
                                title: strSearchYourAddress,
                                isBackActive: true),
                            SizedBox(height: size.height * 0.1),
                            CommonTextFiled(
                                controller: _vm.searchAddress,
                                hintText: strSearchAddress,
                                name: strSearchAddress,
                                validator:
                                    FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ])),
                            SizedBox(height: 20.h),
                            SizedBox(height: 20.h),
                            CommonButtonWidget(
                                onTap: () {
                                  // if (formKey.currentState!
                                  //     .validate()) {
                                  _vm.onNext(context);
                                  // }
                                },
                                text: "Sign In"),
                            SizedBox(height: 20.h)
                          ])),
                ),
              )),
              resizeToAvoidBottomInset: false));
    });
  }
}
