import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/registration/skills/skills_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/checkbox_with_range.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';
import 'package:zip_care/src/feature/auth/registration/widget/top_info_container.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(skillsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              isSkip: true,
              onSkip: () {
                _vm.onNext(context);
              },
              title: strSkillExperience,
              isBackActive: true),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageNumber(no: "3"),
                        SizedBox(height: size.height * 0.05),
                        //health
                        CommonText(strHealthCondition),
                        TopInfoContainer(
                            title: strHandlingAbility,
                            subTitle: strLevelOfConfidence),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.conditionList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              CheckBoxSkillModel item =
                                  _vm.conditionList[i];
                              return CheckboxWithRange(
                                  onChange: (e) =>
                                      _vm.updateRange(i, e),
                                  onTap: () {
                                    _vm.updateCheck(i);
                                  },
                                  title: item.title,
                                  isCheck: item.isCheck,
                                  range: item.value);
                            }),
                        //service
                        SizedBox(height: 20.h),
                        CommonText(strServicesOffered),
                        TopInfoContainer(
                            title: strHandlingAbility,
                            subTitle: strLevelOfConfidence),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.serviceList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              CheckBoxSkillModel item =
                                  _vm.serviceList[i];
                              return CheckboxWithRange(
                                  onChange: (e) => _vm.updateRange(
                                      i, e,
                                      isService: true),
                                  onTap: () {
                                    _vm.updateCheck(i,
                                        isService: true);
                                  },
                                  title: item.title,
                                  isCheck: item.isCheck,
                                  range: item.value);
                            }),
                        //enjoy
                        SizedBox(height: 20.h),
                        CommonText(strThingsYourEnjoy),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.enjoyList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              String item = _vm.enjoyList[i];
                              return CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: _vm.selectedEnjoy
                                      .contains(item),
                                  activeColor:
                                      AppColors.darkPinkColor,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool? value) {
                                    _vm.addRemoveEnjoy(item);
                                  },
                                  title: Text("${item}"));
                            }),
                        //language
                        SizedBox(height: 20.h),
                        CommonText(strLanguage),
                        SizedBox(height: 20.h),
                        CommonTextFiled(
                            hintText: strSearch,
                            name: strSearch,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search,
                                    color: AppColors.colorGrey))),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.languageList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              String item = _vm.languageList[i];
                              return CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: _vm.selectedLanguage
                                      .contains(item),
                                  activeColor:
                                      AppColors.darkPinkColor,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool? value) {
                                    _vm.addRemoveLanguage(item);
                                  },
                                  title: Text("${item}"));
                            }),
                        //softskill
                        SizedBox(height: 20.h),
                        CommonText(strSoftSkillsYouwant),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.softskillList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              String item = _vm.softskillList[i];
                              return CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: _vm.selectedSoftskill
                                      .contains(item),
                                  activeColor:
                                      AppColors.darkPinkColor,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool? value) {
                                    _vm.addRemoveSoftSkill(item);
                                  },
                                  title: Text("${item}"));
                            }),
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
