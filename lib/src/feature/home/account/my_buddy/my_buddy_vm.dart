import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myBuddyVmProvider = ChangeNotifierProvider.autoDispose<MyBuddyVm>((ref) {
  return MyBuddyVm();
});
bool switchValue = true;

class MyBuddyVm extends ChangeNotifier {
  MyBuddyVm() {
    onInit();
  }

  var buddyList = [
    {
      "name": "Ellie Andrew",
      "location": "635 Jacabs Stream",
      "bag": "Care-Taker",
      "years": "3 Years"
    },
    {
      "name": "Ellie Andrew",
      "location": "635 Jacabs Stream",
      "bag": "Care-Taker",
      "years": "3 Years"
    },
    {
      "name": "Ellie Andrew",
      "location": "635 Jacabs Stream",
      "bag": "Care-Taker",
      "years": "3 Years"
    },
  ];

  void onInit() {}
}
