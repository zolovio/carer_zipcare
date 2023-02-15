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
import 'package:zip_care/src/feature/auth/registration/personalInfo/personalInfoVM.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() =>
      _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(personalInfoVmProvider);
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
                                title: strPersonalInfo,
                                isBackActive: true),
                            SizedBox(height: size.height * 0.1),
                            CommonTextFiled(
                                controller: _vm.firstName,
                                hintText: strFirstName,
                                name: strFirstName,
                                validator:
                                    FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ])),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.lastName,
                              hintText: strLastName,
                              name: strLastName,
                              keyboardType:
                                  TextInputType.visiblePassword,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.phoneNo,
                              hintText: strPhoneNumber,
                              name: strPhoneNumber,
                              keyboardType: TextInputType.number,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.address,
                              hintText: strSearchAddress,
                              name: strSearchAddress,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.postcode,
                              hintText: strPostCode,
                              name: strPostCode,
                              keyboardType: TextInputType.number,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.streetAddress,
                              hintText: strStreetAddress,
                              name: strSearchAddress,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.streetAddress2,
                              hintText: strStreetAddress2,
                              name: strSearchAddress,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.city,
                              hintText: strCity,
                              name: strCity,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.country,
                              hintText: strCountryName,
                              name: strCountryName,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            FormBuilderDateTimePicker(
                              decoration: textFieldDecoration(
                                  hintText: strDOB),
                              name: strDOB,
                              fieldHintText: strDOB,
                              inputType: InputType.both,
                              controller: _vm.dob,
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.nationality,
                              hintText: strNationality,
                              name: strNationality,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            FormBuilderRadioGroup<String>(
                              activeColor: AppColors.darkPinkColor,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15.sp),
                                  labelText: strTypeOfDBS,
                                  border: InputBorder.none),
                              initialValue: null,
                              name: strTypeOfDBS,
                              onChanged: (e) => _vm.setCerti(e!),
                              validator:
                                  FormBuilderValidators.compose([
                                FormBuilderValidators.required()
                              ]),
                              options: [strBasic, strEnhanced]
                                  .map((lang) =>
                                      FormBuilderFieldOption(
                                        value: lang,
                                        child: Text(lang),
                                      ))
                                  .toList(growable: false),
                              controlAffinity:
                                  ControlAffinity.trailing,
                            ),
                            SizedBox(height: 20.h),
                            FormBuilderDateTimePicker(
                              decoration: textFieldDecoration(
                                  hintText: strIssueDate),
                              name: strIssueDate,
                              fieldHintText: strIssueDate,
                              inputType: InputType.both,
                              controller: _vm.issueDate,
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.certiNo,
                              hintText: strDBSNumber,
                              name: strDBSNumber,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFiled(
                              controller: _vm.insuranceNo,
                              hintText: strInsuranceNumberTxt,
                              name: strInsuranceNumberTxt,
                              validator:
                                  (FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ])),
                            ),
                            SizedBox(height: 20.h),
                            FormBuilderRadioGroup<String>(
                              activeColor: AppColors.darkPinkColor,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15.sp),
                                  labelText: strIsEnhanceONDBS,
                                  border: InputBorder.none),
                              initialValue: null,
                              name: strIsEnhanceONDBS,
                              onChanged: (e) => _vm.setCerti(e!),
                              validator:
                                  FormBuilderValidators.compose([
                                FormBuilderValidators.required()
                              ]),
                              options: [strYes, strNo]
                                  .map((e) => FormBuilderFieldOption(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(growable: false),
                              controlAffinity:
                                  ControlAffinity.trailing,
                            ),
                            SizedBox(height: 20.h),
                            Text("Upload Certificate",
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 15.sp)),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () {
                                _vm.pickCertificate();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: size.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: AppColors.textColor),
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
                                              color: AppColors
                                                  .textColor),
                                          Text(
                                              strUploadCertificateHere)
                                        ],
                                      ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CommonNextButtonWidget(
                                onTap: () {
                                  // if (formKey.currentState!
                                  //     .validate()) {
                                  _vm.onNext(context);
                                  // }
                                },
                                text: "Next"),
                            SizedBox(height: 20.h)
                          ])),
                ),
              )),
              resizeToAvoidBottomInset: false));
    });
  }
}
