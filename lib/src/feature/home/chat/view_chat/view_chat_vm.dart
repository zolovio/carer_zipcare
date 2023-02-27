import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewChatVmProvider =
    ChangeNotifierProvider.autoDispose<ViewChatVm>((ref) {
  return ViewChatVm();
});

class ViewChatVm extends ChangeNotifier {
  ViewChatVm() {
    onInit();
  }

  List<Map> data = [
    {
      'sender': 0,
      'msg':
          "Thank you for accepting my application. I have sent over the service agreement for approval ",
      'time': '09.45'
    },
    {
      'sender': 1,
      'msg': "I received it and happy to accept.",
      'time': '09.45'
    },
    {
      'sender': 0,
      'msg':
          "Great. I have sent over the invoice too. Please send the approval, so that we can start.",
      'time': '09.45'
    },
    {
      'sender': 1,
      'msg': "I have approved the invoice. See you today afternoon.",
      'time': '09.45'
    },
  ];

  void onInit() {}
}
