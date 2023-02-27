import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/registration/skills/skills_screen.dart';

final invoiceDetailVmProvider =
    ChangeNotifierProvider.autoDispose<InvoiceDetailVm>((ref) {
  return InvoiceDetailVm();
});

class InvoiceDetailVm extends ChangeNotifier {
  int status = 4;
  bool jobCompleted = false;
  @override
  void dispose() {
    super.dispose();
  }

  updateStatus(int s) {
    print("s >>$s");
    status = s;
    notifyListeners();
  }

  updateComplete() {
    jobCompleted = true;

    notifyListeners();
  }

  onNext(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SkillsScreen()));
  }
}
