import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myReviewsVmProvider =
    ChangeNotifierProvider.autoDispose<MyReviewsVm>((ref) {
  return MyReviewsVm();
});

double? rat;

class MyReviewsVm extends ChangeNotifier {
  MyReviewsVm() {
    onInit();
  }
  Map myReviews = {
    "rating": "4.0",
    "reviewsCount": "Based on 23 reviews",
    "name": [
      "John Watson",
      "1 days ago",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ],
  };

  var reviewList = [
    {
      "name": "John Watson",
      "time": "4 days ago",
      "rating": "4.0",
      "des":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    },
    {
      "name": "John Watson",
      "time": "4 days ago",
      "rating": "4.0",
      "des":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    },
    {
      "name": "John Watson",
      "time": "4 days ago",
      "rating": "4.0",
      "des":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    }
  ];

  void onInit() {}
}
