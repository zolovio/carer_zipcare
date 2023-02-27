import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/common/widgets/decoration.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/job/add_invoice/add_invoice_vm.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(addInvoiceVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: strInvoice, isBackActive: true, nofi: true),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FormBuilder(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.05),
                        FormBuilderRadioGroup<String>(
                            activeColor: AppColors.darkPinkColor,
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                labelStyle: textDecoration,
                                labelText: "Select invoice type:",
                                border: InputBorder.none),
                            initialValue: _vm.invoiceType, //null,
                            name: strRelavantQualification,
                            onChanged: (e) => _vm.setInvoice(e!),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required()]),
                            options: [
                              "Job Invoice",
                              "Expense Invoice"
                            ]
                                .map((v) => FormBuilderFieldOption(
                                    value: v, child: Text(v)))
                                .toList(growable: false)),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText("Invoice No.: INV17307",
                                fontSize: 14),
                            CommonText("Job id: 126565",
                                fontSize: 14),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        _vm.invoiceType == "Expense Invoice"
                            ? Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          alignment:
                                              Alignment.centerLeft,
                                          width: size.width / 2,
                                          child: CommonText(
                                              "Add Multiple Expenses",
                                              fontSize: font_12)),
                                      CommonText("Add Cost",
                                          fontSize: font_12),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          NeverScrollableScrollPhysics(),
                                      itemCount:
                                          _vm.expensesList.length,
                                      itemBuilder:
                                          (BuildContext context,
                                              int i) {
                                        var item =
                                            _vm.expensesList[i];
                                        return Padding(
                                          padding: const EdgeInsets
                                                  .symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CommonTextFiled(
                                                    fillColor: AppColors
                                                        .darkPinkColor
                                                        .withOpacity(
                                                            .4),
                                                    suffixIcon: Icon(Icons
                                                        .edit_square),
                                                    hintText: "Title",
                                                    name: "Title",
                                                    validator: null,
                                                    controller:
                                                        item.name),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: CommonTextFiled(
                                                    fillColor: AppColors
                                                        .darkPinkColor
                                                        .withOpacity(
                                                            .4),
                                                    suffixIcon: Icon(Icons
                                                        .edit_square),
                                                    hintText:
                                                        "£ Cost",
                                                    name: "Cost",
                                                    validator: null,
                                                    keyboardType:
                                                        TextInputType
                                                            .number,
                                                    controller:
                                                        item.cost),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  SizedBox(height: 10.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 100.w,
                                      child: GestureDetector(
                                          onTap: () {
                                            print("asdasdasdasd");
                                            _vm.addExpenses();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.add_circle,
                                                  color: AppColors
                                                      .darkPinkColor),
                                              CommonText("Add More"),
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  CommonText("Description",
                                      fontSize: font_12),
                                  SizedBox(height: 5.h),
                                  CommonTextFiled(
                                      fillColor: AppColors
                                          .darkPinkColor
                                          .withOpacity(.4),
                                      hintText: "Write here...",
                                      name: "Write here...",
                                      validator: null,
                                      maxLine: 4,
                                      controller: _vm.desc),
                                  SizedBox(height: 10.h),
                                  SizedBox(height: 10.h),
                                  CommonText("Upload Receipt",
                                      fontSize: font_12),
                                  SizedBox(height: 5.h),
                                  Wrap(
                                      spacing: 5,
                                      runSpacing: 0.0,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.all(5),
                                            child: GestureDetector(
                                              onTap: () {
                                                _vm.mediaOption(
                                                    context);
                                              },
                                              child: Container(
                                                  height: 100.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                      border: Border
                                                          .all(),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  7)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .create_new_folder_outlined,
                                                          color: Colors
                                                                  .grey[
                                                              600]),
                                                      CommonText(
                                                          "Upload Receipt",
                                                          fontSize:
                                                              font_10)
                                                    ],
                                                  )),
                                            )),
                                        ..._vm.files
                                            .map((v) => Stack(
                                                  alignment: Alignment
                                                      .topRight,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets
                                                            .all(2),
                                                        height: 100.h,
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10),
                                                            child: Image.file(
                                                                v,
                                                                fit: BoxFit
                                                                    .fill))),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _vm.removeFile(
                                                            v);
                                                      },
                                                      child:
                                                          CircleAvatar(
                                                        radius: 10,
                                                        backgroundColor:
                                                            AppColors
                                                                .darkPinkColor,
                                                        child: Icon(
                                                            Icons
                                                                .close,
                                                            color: Colors
                                                                .white,
                                                            size: 20),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                            .toList(),
                                      ]),
                                  SizedBox(height: 10.h),
                                ],
                              )
                            : Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          NeverScrollableScrollPhysics(),
                                      itemCount: _vm.shiftList.length,
                                      itemBuilder:
                                          (BuildContext context,
                                              int i) {
                                        var item = _vm.shiftList[i];
                                        return Container(
                                          margin:
                                              EdgeInsets.symmetric(
                                                  vertical: 10),
                                          padding: EdgeInsets.all(10),
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(15)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: FormBuilderDateTimePicker(
                                                        name: 'from',
                                                        controller:
                                                            item
                                                                .start,
                                                        initialEntryMode:
                                                            DatePickerEntryMode
                                                                .calendar,
                                                        initialValue:
                                                            null,
                                                        inputType:
                                                            InputType
                                                                .date,
                                                        decoration: textFieldDecoration(
                                                            hintText:
                                                                "Start Date",
                                                            suffix: Icon(
                                                                Icons
                                                                    .calendar_month))),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormBuilderDateTimePicker(
                                                        name: 'to',
                                                        controller:
                                                            item.end,
                                                        initialEntryMode:
                                                            DatePickerEntryMode
                                                                .calendar,
                                                        initialValue:
                                                            null,
                                                        inputType:
                                                            InputType
                                                                .date,
                                                        decoration: textFieldDecoration(
                                                            hintText:
                                                                "End Date",
                                                            suffix: Icon(
                                                                Icons
                                                                    .calendar_month))),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: FormBuilderDateTimePicker(
                                                        name:
                                                            'fromTime',
                                                        controller:
                                                            item
                                                                .start,
                                                        initialEntryMode:
                                                            DatePickerEntryMode
                                                                .calendar,
                                                        initialValue:
                                                            null,
                                                        inputType:
                                                            InputType
                                                                .time,
                                                        decoration: textFieldDecoration(
                                                            hintText:
                                                                "Start Time",
                                                            suffix: Icon(
                                                                Icons
                                                                    .schedule))),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormBuilderDateTimePicker(
                                                        name:
                                                            'toTime',
                                                        controller:
                                                            item.end,
                                                        initialEntryMode:
                                                            DatePickerEntryMode
                                                                .calendar,
                                                        initialValue:
                                                            null,
                                                        inputType:
                                                            InputType
                                                                .time,
                                                        decoration: textFieldDecoration(
                                                            hintText:
                                                                "End Time",
                                                            suffix: Icon(
                                                                Icons
                                                                    .schedule))),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              CommonTextFiled(
                                                  controller:
                                                      item.fees,
                                                  hintText:
                                                      "Shift Fees (€)",
                                                  name: "fees",
                                                  validator: null),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 150.w,
                                      child: GestureDetector(
                                          onTap: () {
                                            _vm.addModel();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                  Icons
                                                      .add_circle_outline,
                                                  color: AppColors
                                                      .darkPinkColor),
                                              Text(
                                                  "Add another shift"),
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(height: 10),
                        CommonNextButtonWidget(
                          onTap: () {
                            // if (formKey.currentState!
                            //     .validate()) {
                            _vm.onNext(context);
                            // }
                          },
                          text: strView,
                          icon: Icons.visibility_outlined,
                        ),
                        SizedBox(height: 20.h),
                        CommonNextButtonWidget(
                          onTap: () {
                            // if (formKey.currentState!
                            //     .validate()) {
                            // _vm.onNext(context);
                            // }
                          },
                          text: strMessage,
                          icon: Icons.chat_outlined,
                        ),
                        SizedBox(height: 20.h),
                      ])),
            ),
          )));
    });
  }
}
