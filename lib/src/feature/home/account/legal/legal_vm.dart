import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final legalVmProvider = ChangeNotifierProvider.autoDispose<LegalVm>((ref) {
  return LegalVm();
});

class LegalVm extends ChangeNotifier {
  LegalVm() {
    onInit();
  }
  Map legal = {
    "des":
        "Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying \non meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. n publishing and graphic design, Lorem ipsum is a placeholder text commonl used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. \n\nPublishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. ",
  };
  void onInit() {}
}
