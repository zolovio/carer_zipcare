import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addCouponsVmProvider =
    ChangeNotifierProvider.autoDispose<AddCouponsVm>((ref) {
  return AddCouponsVm();
});

class AddCouponsVm extends ChangeNotifier {
  AddCouponsVm() {
    onInit();
  }
  var coupons = [
    {
      "title": "TRYNEW",
      "off": "60% Off",
      "save": "Save \$10 on this order",
      "des": "Use  code TRYNEW & get 60% off on orders above \$30."
    },
    {
      "title": "TRYNEW",
      "off": "60% Off",
      "save": "Save \$10 on this order",
      "des": "Use  code TRYNEW & get 60% off on orders above \$30."
    },
    {
      "title": "TRYNEW",
      "off": "60% Off",
      "save": "Save \$10 on this order",
      "des": "Use  code TRYNEW & get 60% off on orders above \$30."
    }
  ];

  void onInit() {}
}
