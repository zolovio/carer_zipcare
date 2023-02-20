import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/registration/appointment/appointment_screen.dart';

final iDverificationVmProvider =
    ChangeNotifierProvider.autoDispose<IDverificationVm>((ref) {
  return IDverificationVm();
});

class IDverificationVm extends ChangeNotifier {
  onNext(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AppointmentScreen()));
  }
}
