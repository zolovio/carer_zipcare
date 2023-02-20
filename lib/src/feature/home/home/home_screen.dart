import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/app_utils/textstyle.dart';
import 'package:zip_care/src/core/common/widgets/job_card.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/home/home_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(homeVmProvider);
      return Scaffold(
          body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: CommonAppBarWithBack(
                              isOffline: true,
                              logo: true,
                              nofi: true)),
                      TextField(
                          decoration: InputDecoration(
                              constraints:
                                  BoxConstraints.tightFor(height: 50),
                              hintText: strSearch,
                              hintStyle:
                                  textStyleNormal(fontsize: 15),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.search,
                                      color: AppColors.colorGrey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors
                                          .lightGreyColor)))),
                      SizedBox(height: 15.h),
                      Container(
                          height: height_30,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: _vm.topList.length,
                              itemBuilder:
                                  (BuildContext context, int i) {
                                var list = _vm.topList[i];
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: TopFilter(
                                        text: list["name"]!));
                              })),
                      SizedBox(height: 20.h),
                      Row(children: [
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors
                                          .blueGreyLightColor,
                                      offset: Offset(2, 2),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0)
                                ]),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                    child: CommonText("Filter",
                                        fontSize: 14)))),
                        SizedBox(width: width_10),
                        Text(_vm.jobs["availableJobs"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15))
                      ]),
                      SizedBox(height: height_10),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _vm.topList.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: JobCard());
                          })
                    ]),
                  ))));
    });
  }
}

class TopFilter extends StatelessWidget {
  final String text;
  const TopFilter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth / 3.5,
        decoration: BoxDecoration(
            color: AppColors.blueGreyLightColor,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Center(child: CommonText(text, fontSize: 14))));
  }
}
