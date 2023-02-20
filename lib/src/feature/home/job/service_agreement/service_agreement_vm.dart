import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceAgreementVmProvider =
    ChangeNotifierProvider.autoDispose<ServiceAgreementVm>((ref) {
  return ServiceAgreementVm();
});

class ServiceAgreementVm extends ChangeNotifier {
  TextEditingController serviceAgreement = TextEditingController();
  bool isEdit = false;
  bool isPreview = false;
  bool isSent = false;
  bool isApprove = false;

  String data =
      "Service Agreement between Ali Abrahim  and John Watson\nCare recipient name : Ali Abrahim\nCare recipient address : 28 Narrowboat Close, Coventry, CV6 6RD, UK\nServices also include : Cooking, Medication prompting, Hoisting\nYour Sincerely\nJohn Watson\nwww.ZipCare.com is an Online platform for individuals requiring care or their agents and carers, to connect with each other. We do not introduce or supply to those seeking care Dummy text here...... ";

  ServiceAgreementVm() {
    onInit();
  }

  setEdit({bool isView = false}) {
    if (isView) {
      isPreview = !isPreview;
    }
    print("isPreview >> $isPreview");
    isEdit = !isEdit;
    print("isEdit >> $isEdit");
    notifyListeners();
  }

  setReset() {
    isEdit = !isEdit;
    serviceAgreement.text = data;
    notifyListeners();
  }

  onApprove() {
    isApprove = true;
    notifyListeners();
  }

  onSend() {
    isSent = true;
    notifyListeners();
  }

  void onInit() {
    serviceAgreement.text = data;
  }
}
