import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/auth/registration/additional_info/additional_info_screen.dart';

final serviceRatesVmProvider =
    ChangeNotifierProvider.autoDispose<ServiceRatesVm>((ref) {
  return ServiceRatesVm();
});

class ServiceRatesVm extends ChangeNotifier {
  String isUrgent = strYes;
  TextEditingController urgent = TextEditingController();
  String isHourly = strYes;
  TextEditingController hourly = TextEditingController();

  String isOvernight = strYes;
  TextEditingController sleeping = TextEditingController();
  TextEditingController waking = TextEditingController();

  String isLivein = strYes;
  TextEditingController sleepingLive = TextEditingController();
  TextEditingController wakingLive = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  updateUrgent(String urgent) {
    isUrgent = urgent;
    notifyListeners();
  }

  updateOvernight(String over) {
    isOvernight = over;
    notifyListeners();
  }

  updateHourly(String hourly) {
    isHourly = hourly;
    notifyListeners();
  }

  updateLivein(String livein) {
    isLivein = livein;
    notifyListeners();
  }

  onNext(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AdditionalInfoScreen()));
  }
}
