import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/registration/qualification/qualification_screen.dart';

final personalInfoVmProvider =
    ChangeNotifierProvider.autoDispose<PersonalInfoVm>((ref) {
  return PersonalInfoVm();
});

class PersonalInfoVm extends ChangeNotifier {
  late List<TextInputFormatter> emojiHide;
  late bool isPasswordHide = true;
  bool isRemember = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController streetAddress2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController issueDate = TextEditingController();
  TextEditingController certiNo = TextEditingController();
  TextEditingController insuranceNo = TextEditingController();
  String? certi;
  String? isService;
  File? file;
  List<String> countryList = ["India", "USA"];
  String? selectedCountry;
  List<String> nationalityList = ["Indian", "USA"];
  String? selectedNationality;

  setCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }

  setNationality(String nationality) {
    selectedNationality = nationality;
    notifyListeners();
  }

  setCerti(String certi) {
    certi = certi;
    notifyListeners();
  }

  setService(String service) {
    isService = service;
    notifyListeners();
  }

  pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QualificationScreen()));
  }
}
