import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/my_availability/my_availability_vm.dart';

class MyAvailabilityScreen extends StatelessWidget {
  const MyAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(myAvailabilityVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "My Availability",
              isBackActive: true,
              fontSize: font_20,
              logo: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 15.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText("Urgent care availabilite",
                            fontSize: font_15,
                            fontFamily: FontFamily.lexendSemiBold),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _vm.avalible.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              var list = _vm.avalible[index];
                              return Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.circle,
                                              size: 10,
                                              color:
                                                  Colors.grey[800]),
                                          CommonText(list.day),
                                        ],
                                      ),
                                      CupertinoSwitch(
                                          value: list.enable,
                                          activeColor: AppColors
                                              .darkGreenColor,
                                          onChanged: (bool? value) {
                                            _vm.updatedSwitch(index);
                                          }),
                                    ],
                                  ),
                                  list.enable
                                      ? Column(
                                          children: [
                                            DateDay(
                                                time:
                                                    "6:00am to 9:00am"),
                                            DateDay(
                                                time:
                                                    "9:00am to 12:00pm"),
                                            DateDay(
                                                time:
                                                    "12:00pm to 3:00pm"),
                                            DateDay(
                                                time:
                                                    "3:00pm to 6:00pm"),
                                            DateDay(
                                                time:
                                                    "6:00pm to 9:00pm"),
                                            DateDay(
                                                time:
                                                    "9:00pm Onwards")
                                          ],
                                        )
                                      : SizedBox(),
                                ],
                              );
                            }),
                        SizedBox(height: 10.h),
                        CommonNextButtonWidget(
                            icon: Icons.save,
                            onTap: () {},
                            text: 'Save')
                      ]))));
    });
  }
}

class DateDay extends StatelessWidget {
  final String time;
  const DateDay({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: size.width / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: Color(0x2d000000),
                  blurRadius: 6.07,
                  offset: Offset(0, 1.21),
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Text(time)),
        Container(
          width: size.width / 3,
          child: FormBuilderRadioGroup<String>(
              activeColor: AppColors.darkPinkColor,
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none),
              initialValue: null,
              name: time,
              onChanged: (e) {},
              validator: null,
              options: [strYes, strNo]
                  .map((e) => FormBuilderFieldOption(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(growable: false)),
        ),
      ],
    );
  }
}
