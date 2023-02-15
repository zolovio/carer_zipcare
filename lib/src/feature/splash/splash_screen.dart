import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/splash/splash_vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(splashVmProvider);
      return Scaffold(
          body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColors.lightPinkColor, AppColors.darkPinkColor])),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: SizedBox(
              height: height_90,
              width: height_90,
              child: Transform.scale(
                scale: 1.3,
                child: imageAsset(splashAppLogoImage,
                    height: height_100, width: height_90),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
