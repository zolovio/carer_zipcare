import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final acceptedProvider = ChangeNotifierProvider.autoDispose<AcceptedVm>((ref) {
  return AcceptedVm();
});

class AcceptedVm extends ChangeNotifier {
  // late TextEditingController search;
  AcceptedVm() {
    onInit();
  }
  Map acceptedJobs = {
    "availableJobs": "17 Jobs Available",
    "jobId": "#126565",
    "title": "Female Hourly Day Carer Required.",
    "name": "Riya Watson",
    "year": "53",
    "location": "W2P, London",
    "dateTime": "22-07-2022, 4:00pm",
    "hour": "4 hr/week",
    "careTypeAndSchedule": [
      "Hourly",
      "One Time",
      "Immediately",
      "Pet friendly",
      "Female",
      "Driver Required",
      "Autism spectrum disorder"
    ],
  };

  void onInit() {
    intializeEditText();
  }

  intializeEditText() {
    // search = TextEditingController();
  }
}
