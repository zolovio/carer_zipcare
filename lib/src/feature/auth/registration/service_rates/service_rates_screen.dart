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
import 'package:zip_care/src/feature/auth/registration/service_rates/service_rates_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class ServiceRatesScreen extends StatefulWidget {
  const ServiceRatesScreen({super.key});

  @override
  State<ServiceRatesScreen> createState() =>
      _ServiceRatesScreenState();
}

class _ServiceRatesScreenState extends State<ServiceRatesScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(serviceRatesVmProvider);
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
                        title: strServicesRates,
                        isBackActive: true),
                    PageNumber(no: "4"),
                    SizedBox(height: size.height * 0.05),
                    //urgent
                    FormBuilderRadioGroup<String>(
                        activeColor: AppColors.darkPinkColor,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            labelStyle: textDecoration,
                            labelText: strUrgentNeed,
                            border: InputBorder.none),
                        initialValue: _vm.isUrgent, //null,
                        name: strUrgentNeed,
                        onChanged: (e) => _vm.updateUrgent(e!),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: [strYes, strNo]
                            .map((v) => FormBuilderFieldOption(
                                value: v, child: Text(v)))
                            .toList(growable: false)),
                    (_vm.isUrgent == null || _vm.isUrgent != strYes)
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonText(strrateinhour,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.urgent,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                            ],
                          ),

                    //hourly
                    SizedBox(height: 20.h),
                    FormBuilderRadioGroup<String>(
                        activeColor: AppColors.darkPinkColor,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            labelStyle: textDecoration,
                            labelText: strHourly,
                            border: InputBorder.none),
                        initialValue: _vm.isHourly, //null,
                        name: strHourly,
                        onChanged: (e) => _vm.updateHourly(e!),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: [strYes, strNo]
                            .map((v) => FormBuilderFieldOption(
                                value: v, child: Text(v)))
                            .toList(growable: false)),
                    (_vm.isHourly == null || _vm.isHourly != strYes)
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonText(strrateinhour,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.hourly,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                            ],
                          ),

                    //overnight
                    SizedBox(height: 20.h),
                    FormBuilderRadioGroup<String>(
                        activeColor: AppColors.darkPinkColor,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            labelStyle: textDecoration,
                            labelText: strOverNight,
                            border: InputBorder.none),
                        initialValue: _vm.isOvernight, //null,
                        name: strOverNight,
                        onChanged: (e) => _vm.updateOvernight(e!),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: [strYes, strNo]
                            .map((v) => FormBuilderFieldOption(
                                value: v, child: Text(v)))
                            .toList(growable: false)),
                    (_vm.isOvernight == null ||
                            _vm.isOvernight != strYes)
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonText(strrateinhourSleeping,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.sleeping,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                              SizedBox(height: 10.h),
                              CommonText(strrateinhourWaking,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.waking,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                            ],
                          ),

                    //liveIn
                    SizedBox(height: 20.h),
                    FormBuilderRadioGroup<String>(
                        activeColor: AppColors.darkPinkColor,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            labelStyle: textDecoration,
                            labelText: strLiveIn,
                            border: InputBorder.none),
                        initialValue: _vm.isLivein, //null,
                        name: strLiveIn,
                        onChanged: (e) => _vm.updateLivein(e!),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required()]),
                        options: [strYes, strNo]
                            .map((v) => FormBuilderFieldOption(
                                value: v, child: Text(v)))
                            .toList(growable: false)),
                    (_vm.isLivein == null || _vm.isLivein != strYes)
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              CommonText(strrateinhourSleepingB,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.sleepingLive,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                              SizedBox(height: 10.h),
                              CommonText(strrateinhourWakingB,
                                  color: AppColors.blueGreyColor,
                                  fontSize: 14),
                              SizedBox(height: 5.h),
                              CommonTextFiled(
                                  controller: _vm.wakingLive,
                                  hintText: strPricePerHor,
                                  name: strPricePerHor,
                                  validator:
                                      FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ])),
                            ],
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
