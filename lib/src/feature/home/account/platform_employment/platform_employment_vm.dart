import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final platformEmploymentVmProvider =
    ChangeNotifierProvider.autoDispose<PlatformEmploymentVm>((ref) {
  return PlatformEmploymentVm();
});

class PlatformEmploymentVm extends ChangeNotifier {
  PlatformEmploymentVm() {
    onInit();
  }
  var payslips = [
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
  ];
  var contract = [
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
    {"date": "02/08/2022"},
  ];
  void onInit() {}
}
