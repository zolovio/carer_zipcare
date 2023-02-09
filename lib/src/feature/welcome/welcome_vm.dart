import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/strings.dart';

final welcomeVmProvider = ChangeNotifierProvider.autoDispose<WelcomeVm>((ref) {
  return WelcomeVm();
});

class WelcomeVm extends ChangeNotifier {
  List<Pages> selectData = [];
  PageController pageController = PageController();
  int selectedIndex = 0;

  WelcomeVm() {
    onLoad();
  }

  void onLoad() {
    selectData.add(Pages(
      title: strOnBoardingTitle1,
      desc: strOnBoardingDescription,
      image: onBoarding1Image,
    ));
    selectData.add(Pages(
      title: strOnBoardingTitle2,
      desc: strOnBoardingDescription,
      image: onBoarding2Image,
    ));
    selectData.add(Pages(
      title: strOnBoardingTitle3,
      desc: strOnBoardingDescription,
      image: onBoarding3Image,
    ));
    selectData.add(Pages(
      title: strOnBoardingTitle4,
      desc: strOnBoardingDescription,
      image: onBoarding4Image,
    ));
  }

  void onPageChanged(int page) {
    selectedIndex = page;
    notifyListeners();
  }
}

class Pages {
  final title, desc, image;

  Pages({this.title, this.desc, this.image});
}
