import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addBankVmProvider = ChangeNotifierProvider.autoDispose<AddBankVm>((ref) {
  return AddBankVm();
});

class AddBankVm extends ChangeNotifier {
  TextEditingController acName = TextEditingController();
  TextEditingController bankAddress = TextEditingController();
  TextEditingController sortCode = TextEditingController();
  TextEditingController acNo = TextEditingController();
  AddBankVm() {
    onInit();
  }

  void onInit() {}
}
