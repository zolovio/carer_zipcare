import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';

final paymentsVmProvider =
    ChangeNotifierProvider.autoDispose<PaymentsVm>((ref) {
  return PaymentsVm();
});

class PaymentsVm extends ChangeNotifier {
  PaymentsVm() {
    onInit();
  }
  var transactionsList = [
    {
      "img": dp,
      "name": "John Watson",
      "status": "Pending",
      "amount": "£80",
      "date": "02/08/2022"
    },
    {
      "img": dp,
      "name": "Ellie Andrew",
      "status": "Refund",
      "amount": "£50",
      "date": "02/08/2022"
    },
    {
      "img": dp,
      "name": "Ellie Andrew",
      "status": "Completed",
      "amount": "£80",
      "date": "02/08/2022"
    }
  ];

  void onInit() {}
}
