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
import 'package:zip_care/src/feature/auth/registration/personal_info/personal_info_vm.dart';
import 'package:zip_care/src/feature/auth/registration/search_address/search_address_screen.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

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
              appBar: CommonAppBarWithBack(
                  isSkip: true,
                  onSkip: () {
                    _vm.onNext(context);
                  },
                  title: strPersonalInfo,
                  isBackActive: true),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FormBuilder(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            PageNumber(no: "1"),
                            SizedBox(height: size.height * 0.05),
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchAddressScreen()));
                              },
                              child: CommonTextFiled(
                                  isEnabled: false,
                                  controller: _vm.address,
                                  hintText: strSearchAddress,
                                  name: strSearchAddress,
                                  validator:
                                      (FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.cancel,
                                          color:
                                              AppColors.colorGrey))),
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
                            FormBuilderDropdown<String>(
                                decoration: textFieldDecoration(
                                    hintText: strCountryName),
                                name: strCountryName,
                                validator:
                                    FormBuilderValidators.compose([
                                  FormBuilderValidators.required()
                                ]),
                                items: _vm.countryList
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text(v)))
                                    .toList(),
                                onChanged: (val) =>
                                    _vm.setCountry(val!)),
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
                            FormBuilderDropdown<String>(
                                decoration: textFieldDecoration(
                                    hintText: strNationality),
                                name: strNationality,
                                validator:
                                    FormBuilderValidators.compose([
                                  FormBuilderValidators.required()
                                ]),
                                items: _vm.nationalityList
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text(v)))
                                    .toList(),
                                onChanged: (val) =>
                                    _vm.setCountry(val!)),
                            SizedBox(height: 20.h),
                            FormBuilderRadioGroup<String>(
                                activeColor: AppColors.darkPinkColor,
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    labelStyle: textDecoration,
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
                                    .toList(growable: false)),
                            // SizedBox(height: 20.h),
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
                              hintText: strInsurance,
                              name: strInsurance,
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
                                    labelStyle: textDecoration,
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
                                    .map(
                                        (e) => FormBuilderFieldOption(
                                              value: e,
                                              child: Text(e),
                                            ))
                                    .toList(growable: false)),
                            // SizedBox(height: 20.h),
                            Text(strUploadCertificate,
                                style: TextStyle(
                                    color: AppColors.blueGreyColor,
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
                                text: strNext),
                            SizedBox(height: 20.h)
                          ])),
                ),
              )));
    });
  }
}
