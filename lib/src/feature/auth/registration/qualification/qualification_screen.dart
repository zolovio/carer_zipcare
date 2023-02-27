import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/common/widgets/decoration.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/feature/auth/registration/qualification/qualification_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/checkbox_with_textfield.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class QualificationScreen extends StatefulWidget {
  const QualificationScreen({super.key});

  @override
  State<QualificationScreen> createState() =>
      _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(qualificationVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              isSkip: true,
              onSkip: () {
                _vm.onNext(context);
              },
              title: strQualificationTraining,
              isBackActive: true),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageNumber(no: "2"),
                        SizedBox(height: size.height * 0.05),
                        FormBuilderRadioGroup<String>(
                            activeColor: AppColors.darkPinkColor,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelStyle: textDecoration,
                                labelText: strRelavantQualification,
                                border: InputBorder.none),
                            initialValue: _vm.isQualify, //null,
                            name: strRelavantQualification,
                            onChanged: (e) => _vm.setRadio(e!),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                            options: [strYes, strNo]
                                .map((v) => FormBuilderFieldOption(
                                    value: v, child: Text(v)))
                                .toList(growable: false)),
                        (_vm.isQualify == null ||
                                _vm.isQualify != strYes)
                            ? SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(),
                                itemCount: _vm.levelList.length,
                                itemBuilder:
                                    (BuildContext context, int i) {
                                  CheckBoxModel item =
                                      _vm.levelList[i];
                                  return CheckboxWithTextfield(
                                      ctrl: item.controller,
                                      onFiletap: () {
                                        _vm.pickFile(i);
                                      },
                                      onTap: () {
                                        _vm.updateLevelList(i);
                                      },
                                      title: item.title,
                                      isCheck: item.isCheck,
                                      filePath: item.filePath);
                                }),

                        //Training
                        FormBuilderRadioGroup<String>(
                            activeColor: AppColors.darkPinkColor,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelStyle: textDecoration,
                                labelText: strAttendAnyRelavant,
                                border: InputBorder.none),
                            initialValue: _vm.hasTraining,
                            name: strAttendAnyRelavant,
                            onChanged: (e) =>
                                _vm.setRadio(e!, isTraining: true),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                            options: [strYes, strNo]
                                .map((v) => FormBuilderFieldOption(
                                    value: v, child: Text(v)))
                                .toList(growable: false)),
                        (_vm.hasTraining == null ||
                                _vm.hasTraining != strYes)
                            ? SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(),
                                itemCount: _vm.trainingList.length,
                                itemBuilder:
                                    (BuildContext context, int i) {
                                  CheckBoxModel item =
                                      _vm.trainingList[i];
                                  return CheckboxWithTextfield(
                                      ctrl: item.controller,
                                      onFiletap: () {
                                        _vm.pickFile(i,
                                            isTraining: true);
                                      },
                                      onTap: () {
                                        _vm.updateLevelList(i,
                                            isTraining: true);
                                      },
                                      title: item.title,
                                      isCheck: item.isCheck,
                                      filePath: item.filePath);
                                }),
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
