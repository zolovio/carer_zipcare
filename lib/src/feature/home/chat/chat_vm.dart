import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatVmProvider =
    ChangeNotifierProvider.autoDispose<ChatVm>((ref) {
  return ChatVm();
});

class ChatVm extends ChangeNotifier {
  List<Map> data = [
    {
      "name": "Elli Watson",
      "msg": "Lorem ipsum is a placeholder text commonly used to ",
      "time": "10:00am",
    },
    {
      "name": "Kiran Thakur",
      "msg": "Lorem ipsum is a placeholder text commonly used to ",
      "time": "10:00am",
    },
    {
      "name": "Kiran Abrahim",
      "msg": "Lorem ipsum is a placeholder text commonly used to ",
      "time": "10:00am",
    },
    {
      "name": "Kiran Thakur",
      "msg": "Lorem ipsum is a placeholder text commonly used to ",
      "time": "10:00am",
    }
  ];
  ChatVm() {
    onInit();
  }

  void onInit() {}
}
