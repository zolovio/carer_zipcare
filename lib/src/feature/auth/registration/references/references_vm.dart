import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/auth/registration/profile/profile_screen.dart';
import 'package:zip_care/src/feature/auth/registration/search_address/search_address_screen.dart';

final referencesVmProvider =
    ChangeNotifierProvider.autoDispose<ReferencesVm>((ref) {
  return ReferencesVm();
});

class ReferencesVm extends ChangeNotifier {
  List<ReferencesModel> refList = [
    ReferencesModel(
        title: strReference1,
        subTitle: strReferenceNotAccepeted,
        name: TextEditingController(),
        email: TextEditingController(),
        phone: TextEditingController(),
        address: TextEditingController(),
        relation: "",
        howLong: ""),
    ReferencesModel(
        title: strReference2,
        subTitle: strReferenceNotAccepeted,
        name: TextEditingController(),
        email: TextEditingController(),
        phone: TextEditingController(),
        address: TextEditingController(),
        relation: "",
        howLong: ""),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  setRef(index, String v, {bool isRelation = true}) {
    isRelation
        ? refList[index].relation = v
        : refList[index].howLong = v;
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfileScreen()));
  }
}

class ReferencesModel {
  String title;
  String subTitle;
  TextEditingController name;
  TextEditingController email;
  TextEditingController phone;
  TextEditingController address;
  String relation;
  String howLong;

  ReferencesModel({
    required this.title,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.relation,
    required this.howLong,
    this.subTitle = strReferenceNotAccepeted,
  });
}
