import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/auth/registration/skills/skills_screen.dart';

final qualificationVmProvider =
    ChangeNotifierProvider.autoDispose<QualificationVm>((ref) {
  return QualificationVm();
});

class QualificationVm extends ChangeNotifier {
  String isQualify = strYes;
  List<CheckBoxModel> levelList = [
    CheckBoxModel(
        title: "Entry", controller: TextEditingController()),
    CheckBoxModel(
        title: "Level 2", controller: TextEditingController()),
    CheckBoxModel(
        title: "Level 3", controller: TextEditingController()),
    CheckBoxModel(
        title: "Level 4 or above",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Other ", controller: TextEditingController()),
  ];

  String hasTraining = strYes;
  List<CheckBoxModel> trainingList = [
    CheckBoxModel(
        title: "Moving and handling",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Safeguarding adults",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Infection control",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Health and safety",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Fire safety", controller: TextEditingController()),
    CheckBoxModel(
        title: "First aid", controller: TextEditingController()),
    CheckBoxModel(
        title: "Food safety and catering",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Medication safe handling and awareness",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Mental capacity and deprivation of liberty",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Equality, diversity and human rights",
        controller: TextEditingController()),
    CheckBoxModel(
        title: "Other", controller: TextEditingController()),
  ];

  setRadio(String v, {bool isTraining = false}) {
    isTraining ? hasTraining = v : isQualify = v;
    notifyListeners();
  }

  updateLevelList(index, {bool isTraining = false}) {
    isTraining
        ? trainingList[index].isCheck = !trainingList[index].isCheck
        : levelList[index].isCheck = !levelList[index].isCheck;
    notifyListeners();
  }

  pickFile(index, {bool isTraining = false}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      isTraining
          ? trainingList[index].filePath =
              File(result.files.single.path!).path
          : levelList[index].filePath =
              File(result.files.single.path!).path;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onNext(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SkillsScreen()));
  }
}

class CheckBoxModel {
  bool isCheck;
  String title;
  String filePath;
  TextEditingController controller;

  CheckBoxModel(
      {this.isCheck = false,
      required this.title,
      required this.controller,
      this.filePath = ""});
}
