import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/app_utils/app_router.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/feature/welcome/welcome_vm.dart';

import '../../core/app_utils/textstyle.dart';
import '../../core/constants/dimens.dart';
import '../../core/constants/strings.dart';
import '../../core/ui_component/custom_button.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer(
      builder: (context, ref, _) {
        final _vm = ref.watch(welcomeVmProvider);
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: AppColors.lightPinkColor,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColors.lightPinkColor,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.lightPinkColor,
                      AppColors.darkPinkColor,
                      AppColors.lightPinkColor,
                      AppColors.darkPinkColor,
                      AppColors.lightPinkColor,
                      AppColors.darkPinkColor,
                    ],
                  )),
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: elvation_5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(margin_40))),
                        child: Container(
                          height: size.height * 0.8,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(margin_40)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: PageView.builder(
                                    controller: _vm.pageController,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: _vm.selectData.length,
                                    onPageChanged: (page) {
                                      _vm.onPageChanged(page);
                                    },
                                    itemBuilder: (context, index) {
                                      return _pagesContainer(index, size, _vm);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: margin_15,
                                child: ListView.builder(
                                    itemCount: _vm.selectData.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.all(2),
                                          height: margin_10,
                                          width: margin_10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: _vm.selectedIndex == index
                                                ? AppColors.darkPinkColor
                                                : AppColors.lightGreyColor,
                                          ));
                                    }),
                              ),
                              SizedBox(height: height_30)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _skipButton(_vm.selectedIndex, context, _vm),
                )
              ],
            ));
      },
    ));
  }

  _pagesContainer(index, Size size, WelcomeVm vm) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(
          top: margin_15, bottom: margin_30, left: margin_20, right: margin_20),
      padding: EdgeInsets.only(top: margin_50, bottom: margin_30),
      color: AppColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height_20),
          _title(index, vm),
          SizedBox(height: height_20),
          _description(index, vm),
          Expanded(child: _image(index, vm))
        ],
      ),
    );
  }

  _title(index, WelcomeVm vm) {
    return Text(
      vm.selectData[index].title,
      style: textStyleSemiBold(color: Colors.black, fontsize: font_25),
      textAlign: TextAlign.center,
    );
  }

  _description(index, WelcomeVm vm) {
    return Text(
      '${vm.selectData[index].desc}',
      style: textStyleMedium(color: AppColors.colorGrey, fontsize: font_16),
      textAlign: TextAlign.center,
    );
  }

  _image(index, WelcomeVm vm) {
    return Image.asset(
      '${vm.selectData[index].image}',
      height: height_30,
    );
  }
}

_skipButton(int index, context, WelcomeVm vm) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width_100, vertical: height_20),
    child: cbtnTextButton1(
      height: height_45,
      textSize: font_16,
      roundedSize: height_10,
      buttonText: index == 3 ? strGetStarted : strSkip,
      textColor: AppColors.blackColor,
      onPressed: () {
        if (index == 3) {
          Navigator.pushNamed(context, AppRouter.login);
        } else {
          vm.pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        }
      },
      buttonColor: AppColors.whiteColor,
    ),
  );
}
