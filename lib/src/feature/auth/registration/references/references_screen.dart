import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/common/widgets/decoration.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/registration/references/references_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({super.key});

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(referencesVmProvider);
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
                        title: strReferences,
                        isBackActive: true),
                    PageNumber(no: "6"),
                    SizedBox(height: size.height * 0.05),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _vm.refList.length,
                        itemBuilder: (BuildContext context, int i) {
                          var item = _vm.refList[i];
                          return Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonText(item.title,
                                  textAlign: TextAlign.start,
                                  fontSize: 15),
                              SizedBox(height: 10.h),
                              CommonText(item.subTitle,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  fontSize: 14,
                                  color: AppColors.blueGreyColor),
                              SizedBox(height: 15.h),
                              CommonTextFiled(
                                  controller: item.name,
                                  hintText: strNameReference,
                                  name: item.title,
                                  validator: null),
                              SizedBox(height: 10.h),
                              CommonTextFiled(
                                  controller: item.email,
                                  hintText: strEmailAddress,
                                  name: item.title,
                                  validator: null),
                              SizedBox(height: 10.h),
                              CommonTextFiled(
                                  controller: item.phone,
                                  hintText: strContactNumber,
                                  name: item.title,
                                  validator: null),
                              SizedBox(height: 10.h),
                              CommonTextFiled(
                                  controller: item.address,
                                  hintText: strAddress,
                                  name: item.title,
                                  validator: null),
                              SizedBox(height: 10.h),
                              FormBuilderDropdown<String>(
                                  decoration: textFieldDecoration(
                                      hintText: strHowYouKnow),
                                  name: strSelectRefOccupation,
                                  validator: null,
                                  items: ['College', 'Friend']
                                      .map((v) => DropdownMenuItem(
                                          value: v, child: Text(v)))
                                      .toList(),
                                  onChanged: (val) =>
                                      _vm.setRef(i, val!)),
                              SizedBox(height: 10.h),
                              FormBuilderDropdown<String>(
                                  decoration: textFieldDecoration(
                                      hintText:
                                          strSelectHowLongYouKnow),
                                  name: strHowLongKnow,
                                  validator: null,
                                  items: ['1 year', '2 year']
                                      .map((v) => DropdownMenuItem(
                                          value: v, child: Text(v)))
                                      .toList(),
                                  onChanged: (val) => _vm.setRef(
                                      i, val!,
                                      isRelation: false)),
                              SizedBox(height: 20.h)
                            ],
                          );
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

class JobtypeRadio extends StatelessWidget {
  final String groupBy;
  final String title;
  final String subTitle;
  final bool isCheck;
  final Function onChange;

  const JobtypeRadio(
      {super.key,
      required this.groupBy,
      required this.title,
      required this.isCheck,
      required this.onChange,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: title,
            groupValue: groupBy,
            title: Text(title),
            onChanged: (v) => onChange(v),
            selected: isCheck,
            activeColor: AppColors.darkPinkColor),
        !isCheck
            ? SizedBox()
            : CommonText(subTitle,
                maxLines: 3,
                textAlign: TextAlign.start,
                fontSize: 14,
                color: AppColors.blueGreyColor),
      ],
    );
  }
}
