import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsVmProvider =
    ChangeNotifierProvider.autoDispose<SettingsVm>((ref) {
  return SettingsVm();
});

bool switchValue = true;

class SettingsVm extends ChangeNotifier {
  SettingsVm() {
    onInit();
  }

  void onInit() {}
}
