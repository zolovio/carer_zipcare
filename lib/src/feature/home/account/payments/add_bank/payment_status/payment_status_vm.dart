import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentStatusProvider =
    ChangeNotifierProvider.autoDispose<PaymentStatusVm>((ref) {
  return PaymentStatusVm();
});

class PaymentStatusVm extends ChangeNotifier {
  PaymentStatusVm() {
    onInit();
  }

  void onInit() {}
}
