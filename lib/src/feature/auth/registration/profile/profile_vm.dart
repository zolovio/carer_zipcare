import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/auth/registration/id_verification/id_verification_screen.dart';
import 'package:zip_care/src/feature/auth/registration/search_address/search_address_screen.dart';

final profileVmProvider =
    ChangeNotifierProvider.autoDispose<ProfileVm>((ref) {
  return ProfileVm();
});

class ProfileVm extends ChangeNotifier {
  File? file;
  File? image;

  @override
  void dispose() {
    super.dispose();
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    notifyListeners();
  }

  pickImage() async {
    PickedFile? result = await imageFromCamera();
    if (result != null) {
      image = File(result.path);
    }
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => IDverificationScreen()));
  }
}
