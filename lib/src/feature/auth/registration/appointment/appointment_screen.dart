import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/common_widget.dart';
import 'package:zip_care/src/feature/auth/registration/appointment/appointment_vm.dart';
import 'package:zip_care/src/feature/auth/registration/widget/page_no.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(appointmentVmProvider);
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
                        title: strAppointment,
                        isBackActive: true),
                    PageNumber(
                        no: "9", noColor: AppColors.darkPinkColor),
                    SizedBox(height: size.height * 0.05),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonText(
                            strAppointmentforIDverification,
                            fontSize: 15)),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonText(strSelectaDateTime,
                            fontSize: 15)),
                    SizedBox(height: 20.h),
                    TableCalendar(
                      onDaySelected: (a, b) => _vm.setDate(b),
                      calendarFormat: CalendarFormat.week,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _vm.day,
                      selectedDayPredicate: (day) {
                        return isSameDay(_vm.day, day);
                      },
                    ),
                    SizedBox(height: 20.h),
                    CommonText("${dayFormat(_vm.day)}"),
                    SizedBox(height: 20.h),
                    CommonText(strSelectyourslots),
                    SizedBox(height: 20.h),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: _vm.slotList.length,
                      gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 4.0),
                      itemBuilder: (BuildContext context, int i) {
                        var item = _vm.slotList[i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              _vm.setSlot(item);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _vm.selectedSlot == item
                                      ? AppColors.darkPinkColor
                                      : Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x2d000000),
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Text(item)),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 50.h),
                    CommonNextButtonWidget(
                        onTap: () {
                          // if (formKey.currentState!
                          //     .validate()) {
                          _vm.onNext(context);
                          // }
                        },
                        icon: Icons.save,
                        text: strSave),
                    SizedBox(height: 20.h)
                  ])),
        ),
      )));
    });
  }
}
