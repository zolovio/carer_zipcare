import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/main.dart';

import '../../core/app_utils/app_router.dart';

final splashVmProvider = ChangeNotifierProvider.autoDispose<SplashVm>((ref) {
  return SplashVm();
});

class SplashVm extends ChangeNotifier {
  // LoginResponseModel loginResponseModel = LoginResponseModel();
  bool isFirstTime = false;

  SplashVm() {
    navigateToNextScreen();
  }

  navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 800));
    navigatorKey.currentState?.pushNamed(AppRouter.welcome);
  }

  bool appExpirationDateCheck() {
    return DateTime.now().isAfter(DateTime(
      2023,
      1,
      3,
    ).add(Duration(days: 15)));
  }
}
