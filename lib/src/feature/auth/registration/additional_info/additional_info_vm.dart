import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/auth/registration/references/references_screen.dart';

final additionalInfoVmProvider =
    ChangeNotifierProvider.autoDispose<AdditionalInfoVm>((ref) {
  return AdditionalInfoVm();
});

class AdditionalInfoVm extends ChangeNotifier {
  String hasUKRight = strYes;
  String? ukDoc;
  String? jobType;
  String? businessType;
  TextEditingController soleTax = TextEditingController();
  TextEditingController ltdTax = TextEditingController();
  TextEditingController llpTax = TextEditingController();

  RangeValues rangeHour = RangeValues(0.0, 0.0);
  RangeValues rangeDistance = RangeValues(0.0, 0.0);

  String? yearAsCarer;
  String? hoursPerWeek;
  String? travelDistance;
  List<RadioQuestion> questionList = [
    RadioQuestion(
        "Do you have access to personal transport e.g. car?"),
    RadioQuestion("Do you have a full UK driving licence?"),
    RadioQuestion("Do you smoke?"),
    RadioQuestion("Do you have issues working in homes with pets?"),
    RadioQuestion("Do you want to be matched with a buddy?"),
  ];
  List<RadioQuestion> jobtypeList = [
    RadioQuestion(strSelfemployed,
        value:
            "You will be able to work for all employers including participate in the matching service for urgent jobs."),
    RadioQuestion(strClientemployed),
    RadioQuestion(strPlatformEmploymentTxt),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  updateWorkRight(String right) {
    hasUKRight = right;
    notifyListeners();
  }

  updateJobType(String type) {
    jobType = type;
    notifyListeners();
  }

  updateBusinessType(String type) {
    businessType = type;
    notifyListeners();
  }

  updateRange(RangeValues v, {bool isHour = true}) {
    isHour ? rangeHour = v : rangeDistance = v;
    notifyListeners();
  }

  setRadio(index, v) {
    jobtypeList[index].value = v;
    notifyListeners();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      ukDoc = File(result.files.single.path!).path;
    }
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ReferencesScreen()));
  }
}

class RadioQuestion {
  String title;
  String value;
  RadioQuestion(this.title, {this.value = strYes});
}

class RadioJobtype {
  String title;
  String info;
  RadioJobtype(this.title, {this.info = ""});
}
