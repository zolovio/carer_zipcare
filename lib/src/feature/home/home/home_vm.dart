import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeVmProvider = ChangeNotifierProvider.autoDispose<HomeVm>((ref) {
  return HomeVm();
});

class HomeVm extends ChangeNotifier {
  late TextEditingController search;

  HomeVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
  }

  Map jobs = {
    "availableJobs": "17 Jobs Available",
    "jobId": "#126565",
    "title": "Female Hourly Day Carer Required.",
    "year": "53",
    "location": "W2P, London",
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
    "postedOn": "11 Aug 2022",
  };

  var topList = [
    {"name": "Hourly"},
    {"name": "Overnight"},
    {"name": "Live-In"},
  ];

  intializeEditText() {
    search = TextEditingController();
  }
}
