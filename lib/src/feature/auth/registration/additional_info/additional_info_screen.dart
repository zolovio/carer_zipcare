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
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/auth/registration/additional_info/additional_info_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() =>
      _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(additionalInfoVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              isSkip: true,
              onSkip: () {
                _vm.onNext(context);
              },
              title: strAdditionalInformation,
              isBackActive: true),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageNumber(no: "5"),
                        SizedBox(height: size.height * 0.05),
                        FormBuilderRadioGroup<String>(
                            activeColor: AppColors.darkPinkColor,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelStyle: textDecoration,
                                labelText: strDoYouHaveRight,
                                border: InputBorder.none),
                            initialValue: _vm.hasUKRight, //null,
                            name: strDoYouHaveRight,
                            onChanged: (e) => _vm.updateWorkRight(e!),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                            options: [strYes, strNo]
                                .map((v) => FormBuilderFieldOption(
                                    value: v, child: Text(v)))
                                .toList(growable: false)),
                        (_vm.hasUKRight == null ||
                                _vm.hasUKRight != strYes)
                            ? SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  _vm.pickFile();
                                },
                                child: CommonTextFiled(
                                  isEnabled: false,
                                  hintText: _vm.ukDoc ??
                                      strUploadedDocument,
                                  name: strUploadedDocument,
                                  validator: null,
                                  suffixIcon: Icon(
                                      Icons.cloud_upload_outlined,
                                      color: AppColors.darkPinkColor),
                                ),
                              ),
                        SizedBox(height: 20.h),
                        CommonText(
                            "Please select the type of jobs you want to be considered for:",
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            color: AppColors.blueGreyColor),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.jobtypeList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              var item = _vm.jobtypeList[i];
                              return JobtypeRadio(
                                  groupBy: "jobType",
                                  title: item.title,
                                  isCheck: item.title == _vm.jobType,
                                  onChange: (e) =>
                                      _vm.updateJobType(e),
                                  subTitle: item.value);
                            }),
                        CommonText(strSoleTrade,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            color: AppColors.blueGreyColor),
                        RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: strSoleTrader,
                            groupValue: "business",
                            title: Text(strSoleTrader),
                            onChanged: (v) =>
                                _vm.updateBusinessType(v!),
                            selected:
                                strSoleTrader == _vm.businessType,
                            activeColor: AppColors.darkPinkColor),
                        _vm.businessType != strSoleTrader
                            ? SizedBox()
                            : CommonTextFiled(
                                controller: _vm.soleTax,
                                hintText: strUniqueTaxReferenceNumber,
                                name: strUniqueTaxReferenceNumber,
                                validator: null),
                        RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: strLTDCompany,
                            groupValue: "business",
                            title: Text(strLTDCompany),
                            onChanged: (v) =>
                                _vm.updateBusinessType(v!),
                            selected:
                                strLTDCompany == _vm.businessType,
                            activeColor: AppColors.darkPinkColor),
                        _vm.businessType != strLTDCompany
                            ? SizedBox()
                            : CommonTextFiled(
                                controller: _vm.ltdTax,
                                hintText: strUniqueTaxReferenceNumber,
                                name: strUniqueTaxReferenceNumber,
                                validator: null),
                        RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: strLLPCompany,
                            groupValue: "business",
                            title: Text(strLLPCompany),
                            onChanged: (v) =>
                                _vm.updateBusinessType(v!),
                            selected:
                                strLLPCompany == _vm.businessType,
                            activeColor: AppColors.darkPinkColor),
                        _vm.businessType != strLLPCompany
                            ? SizedBox()
                            : CommonTextFiled(
                                controller: _vm.llpTax,
                                hintText: strUniqueTaxReferenceNumber,
                                name: strUniqueTaxReferenceNumber,
                                validator: null),
                        SizedBox(height: 20.h),
                        CommonText(strPerWeekWork,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            color: AppColors.blueGreyColor),
                        RangeSlider(
                            activeColor: AppColors.darkPinkColor,
                            values: _vm.rangeHour,
                            onChanged: (values) =>
                                _vm.updateRange(values),
                            min: 0,
                            max: 30),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText("1-10", fontSize: 12),
                            CommonText("10-20", fontSize: 12),
                            CommonText("20-30", fontSize: 12),
                            CommonText("30+", fontSize: 12),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        CommonText(strPreparedToTravel,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            color: AppColors.blueGreyColor),
                        RangeSlider(
                            activeColor: AppColors.darkPinkColor,
                            values: _vm.rangeDistance,
                            onChanged: (values) => _vm
                                .updateRange(values, isHour: false),
                            min: 0,
                            max: 20),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText("Upto 5 miles", fontSize: 12),
                            CommonText("10 miles", fontSize: 12),
                            CommonText("15 miles", fontSize: 12),
                            CommonText("15 miles>", fontSize: 12),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _vm.questionList.length,
                            itemBuilder:
                                (BuildContext context, int i) {
                              var item = _vm.questionList[i];
                              return FormBuilderRadioGroup<String>(
                                  activeColor:
                                      AppColors.darkPinkColor,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      labelStyle: textDecoration,
                                      labelText: item.title,
                                      border: InputBorder.none),
                                  initialValue: item.value,
                                  name: item.title,
                                  onChanged: (e) =>
                                      _vm.setRadio(i, e!),
                                  validator: null,
                                  options: [strYes, strNo]
                                      .map((v) =>
                                          FormBuilderFieldOption(
                                              value: v,
                                              child: Text(v)))
                                      .toList(growable: false));
                            }),
                        SizedBox(height: 20.h),
                        CommonNextButtonWidget(
                            onTap: () {
                              // if (formKey.currentState!
                              //     .validate()) {
                              _vm.onNext(context);
                              // }
                            },
                            icon: Icons.cloud_download_outlined,
                            text: strSave),
                        SizedBox(height: 20.h)
                      ])),
            ),
          ));
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
