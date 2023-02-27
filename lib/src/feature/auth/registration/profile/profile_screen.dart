import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/registration/profile/profile_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(profileVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              isSkip: true,
              onSkip: () {
                _vm.onNext(context);
              },
              title: strProfile,
              isBackActive: true),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageNumber(no: "7"),
                        SizedBox(height: size.height * 0.05),
                        Center(
                          child: GestureDetector(
                            onTap: () => _vm.pickImage(),
                            child: CircleAvatar(
                              radius: 58,
                              backgroundColor:
                                  AppColors.darkPinkColor,
                              backgroundImage: _vm.image != null
                                  ? Image.file(_vm.image!).image
                                  : AssetImage(accountImage),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.darkPinkColor,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonText(strUploadashortvideo,
                                fontSize: 15)),
                        GestureDetector(
                          onTap: () {
                            _vm.pickFile();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
                            ),
                            child: _vm.file != null
                                ? Text(_vm.file!.path,
                                    textAlign: TextAlign.center)
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                          Icons
                                              .create_new_folder_outlined,
                                          size: 70,
                                          color: Colors.grey),
                                      CommonText(strUploadVideoHere,
                                          fontSize: 13)
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonText(strIntroduction,
                                fontSize: 15)),
                        CommonTextFiled(
                            maxLine: 8,
                            hintText: strIntroHint,
                            name: strIntroHint,
                            keyboardType: TextInputType.streetAddress,
                            validator: null),
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
          ));
    });
  }
}
