import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/home/bottom_bar.dart';

final appointmentVmProvider =
    ChangeNotifierProvider.autoDispose<AppointmentVm>((ref) {
  return AppointmentVm();
});

class AppointmentVm extends ChangeNotifier {
  DateTime day = DateTime.now();

  List<String> slotList = [
    "2:30 PM",
    "3:30 PM",
    "4:45 PM",
    "5:35 PM",
    "6:30 PM",
    "7:30 PM",
    "8:45 PM",
    "9:35 PM"
  ];
  String selectedSlot = "";

  setDate(DateTime d) {
    day = d;
    notifyListeners();
  }

  setSlot(String s) {
    selectedSlot = s;
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }
}
