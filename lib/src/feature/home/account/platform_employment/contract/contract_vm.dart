import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contractVmProvider =
    ChangeNotifierProvider.autoDispose<ContractVm>((ref) {
  return ContractVm();
});

class ContractVm extends ChangeNotifier {
  Map contract = {
    "recipientName": "Ali Abrahim",
    "yourSincerely": "John Watson ",
    "address": "28 Narrowboat Close, Coventry, CV6 6RD, UK",
    "employmentBegin": "22-10-2022",
    "employmentEnd": "22-11-2022",
    "services": "Cooking, Medication prompting, Hoisting.",
  };

  ContractVm() {
    onInit();
  }

  void onInit() {}
}
