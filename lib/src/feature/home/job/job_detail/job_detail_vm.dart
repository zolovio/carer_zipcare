import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobDetailVmProvider =
    ChangeNotifierProvider.autoDispose<JobDetailVm>((ref) {
  return JobDetailVm();
});

class JobDetailVm extends ChangeNotifier {
  Map jobDetail = {
    "name": "Riya Watson",
    "jobId": "#126565",
    "year": "53",
    "location": "W2P,London",
    "date": "22-07-2022 4:00pm",
    "hour": "4 hr/week",
    "jobStatus": "Accepted",
    "selfEmployedPosition": ["Yes"],
    "urgentRequirement": ["Yes"],
    "carerRequested": ["Yes"],
    "personNeedingCare": ["Yes"],
    "typeOfCare": ["Hourly"],
    "typeOfJob": ["One Time"],
    "startDate": "24-sep-2022",
    "time": "4PM",
    "carerGender": ["Female"],
    "healthConditions": [
      "Eating Disorder",
      "Learning Disabilities",
      "Mental Health"
    ],
    "carer": ["Cooking", "Hoisting", "Gardening"],
    "accessToFunding": ["Yes"],
    "specificRequirements":
        "Lorem Ipsum i Lorem Ipsum i Lorem Ipsum i v Lorem Ipsum i Lorem Ipsum i Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
  };

  JobDetailVm() {
    onInit();
  }

  void onInit() {}
}
