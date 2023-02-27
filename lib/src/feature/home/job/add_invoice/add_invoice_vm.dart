import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/auth/registration/skills/skills_screen.dart';
import 'package:zip_care/src/feature/home/job/invoice_detail/invoice_detail_screen.dart';
import 'package:zip_care/src/feature/home/job/invoice_expenses_detail/invoice_expenses_detail_screen.dart';

final addInvoiceVmProvider =
    ChangeNotifierProvider.autoDispose<AddInvoiceVm>((ref) {
  return AddInvoiceVm();
});

class AddInvoiceVm extends ChangeNotifier {
  String invoiceType = "Job Invoice";

  List<ShiftModel> shiftList = [
    ShiftModel(
        medicine: TextEditingController(),
        start: TextEditingController(),
        end: TextEditingController(),
        startTime: TextEditingController(),
        endTime: TextEditingController(),
        fees: TextEditingController())
  ];

  List<ExpensesModel> expensesList = [
    ExpensesModel(
        name: TextEditingController(), cost: TextEditingController())
  ];

  TextEditingController desc = TextEditingController();
  List<File> files = [];

  addExpenses() {
    expensesList.add(ExpensesModel(
        name: TextEditingController(),
        cost: TextEditingController()));
    notifyListeners();
  }

  removeExpenses(data) {
    expensesList.remove(data);
    notifyListeners();
  }

  mediaOption(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_camera_outlined),
                      onTap: () {
                        openCamera();
                        Navigator.pop(context);
                      },
                      title: Text("Camera")),
                  ListTile(
                      leading: Icon(Icons.folder_open_outlined),
                      onTap: () {
                        pickFile();
                        Navigator.pop(context);
                      },
                      title: Text("Gallery")),
                ],
              ),
            ),
          );
        });
  }

  pickFile() async {
    var result =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      files.add(File(result.path));
    }
    notifyListeners();
  }

  removeFile(file) async {
    files.remove(file);
    notifyListeners();
  }

  void openCamera() async {
    var imgCamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgCamera != null) {
      files.add(File(imgCamera.path));
    }
    notifyListeners();
  }

  addModel() {
    shiftList.add(ShiftModel(
        medicine: TextEditingController(),
        start: TextEditingController(),
        end: TextEditingController(),
        startTime: TextEditingController(),
        endTime: TextEditingController(),
        fees: TextEditingController()));
    notifyListeners();
  }

  removeModel(data) {
    shiftList.remove(data);
    notifyListeners();
  }

  setInvoice(String val) {
    invoiceType = val;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onNext(context) {
    invoiceType == "Expense Invoice"
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InvoiceExpensesDetailScreen()))
        : Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InvoiceDetailScreen()));
  }
}

class ShiftModel {
  TextEditingController medicine;
  TextEditingController start;
  TextEditingController end;
  TextEditingController startTime;
  TextEditingController endTime;
  TextEditingController fees;
  ShiftModel(
      {required this.medicine,
      required this.start,
      required this.end,
      required this.startTime,
      required this.endTime,
      required this.fees});
}

class ExpensesModel {
  TextEditingController name;
  TextEditingController cost;
  ExpensesModel({required this.name, required this.cost});
}
