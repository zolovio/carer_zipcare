import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/strings.dart';

final jobInfoVmProvider = ChangeNotifierProvider.autoDispose<JobInfoVm>((ref) {
  return JobInfoVm();
});

class JobInfoVm extends ChangeNotifier {
  late TextEditingController search;
  late TextEditingController message;

  Map jobDetail = {
    "name": "J W",
    "jobId": "#126565",
    "year": "53",
    "location": "Whitestonecliffe",
    "date": "22-07-2022 4:00pm",
    "hour": "4 hr/week",
    "typesOfJob": ["Employed"],
    "service": [strCooking, strMedicationprompting, "Hoisting"],
    "conditions": ["Mental Health", "Learning Disabilities", "Mental Health"],
    "language": ["English"],
    "careTypeAndSchedule": ["Hourly", "One Time", "Immediately"],
    "preferenceGender": ["Female"],
    "thingsYouEnjoy": ["Reading", "Watching TV", "DIY"],
    "specificRequirements":
        "Lorem Ipsum i Lorem Ipsum i Lorem Ipsum i v Lorem Ipsum i Lorem Ipsum i Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
  };

  JobInfoVm() {
    onInit();
  }

  void onInit() {
    intializeEditText();
  }

  intializeEditText() {
    search = TextEditingController();
    message = TextEditingController();
  }
}
