import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myAvailabilityVmProvider =
    ChangeNotifierProvider.autoDispose<MyAvailabilityVm>((ref) {
  return MyAvailabilityVm();
});

class MyAvailabilityVm extends ChangeNotifier {
  MyAvailabilityVm() {
    onInit();
  }
  List<AvailabilityModel> avalible = [
    AvailabilityModel(day: "Monday"),
    AvailabilityModel(day: "Tuesday"),
    AvailabilityModel(day: "Wednesday"),
    AvailabilityModel(day: "Thrusday"),
    AvailabilityModel(day: "Friday"),
    AvailabilityModel(day: "Saturday"),
    AvailabilityModel(day: "Sunday"),
  ];

  updatedSwitch(index) {
    avalible[index].enable = !avalible[index].enable;
    notifyListeners();
  }

  void onInit() {}
}

class AvailabilityModel {
  String day;
  bool enable;

  bool six;
  bool nine;
  bool twelve;
  bool three;
  bool six2;
  bool nine2;
  AvailabilityModel(
      {required this.day,
      this.enable = false,
      this.six = false,
      this.nine = false,
      this.twelve = false,
      this.three = false,
      this.nine2 = false,
      this.six2 = false});
}
