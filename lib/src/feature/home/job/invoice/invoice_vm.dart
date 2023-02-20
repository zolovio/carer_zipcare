import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invoiceVmProvider =
    ChangeNotifierProvider.autoDispose<InvoiceVm>((ref) {
  return InvoiceVm();
});

class InvoiceVm extends ChangeNotifier {
  List<Map> invoiceList = [
    {
      "invoiceTitle": "INV17307",
      "invoiceDate": "02/08/2022",
      "Amount": "£30",
      "status": "0"
    },
    {
      "invoiceTitle": "INV17307",
      "invoiceDate": "02/08/2022",
      "Amount": "£30",
      "status": "1"
    },
    {
      "name": "John Watson",
      "jobId": "126565",
      "invoiceTitle": "INV17307",
      "invoiceDate": "02/08/2022",
      "Amount": "£30",
      "status": "0"
    }
  ];

  InvoiceVm() {
    onInit();
  }

  void onInit() {}
}
