import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactVmProvider = ChangeNotifierProvider.autoDispose<ContactVm>((ref) {
  return ContactVm();
});

class ContactVm extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  ContactVm() {
    onInit();
  }

  void onInit() {}
}
