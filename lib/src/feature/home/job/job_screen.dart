import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/feature/home/job/accepted/accepted_screen.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBarWithBack(
            title: "My Jobs",
            logo: true,
            nofi: true,
            fontSize: font_19),
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                        backgroundColor: Colors.transparent,
                        bottom: TabBar(
                            unselectedLabelColor:
                                AppColors.blueGreyColor,
                            labelColor: AppColors.whiteColor,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    50), // Creates border
                                color: AppColors.darkPinkColor),
                            tabs: [
                              Tab(icon: Text("Accepted")),
                              Tab(icon: Text("Approved")),
                              Tab(icon: Text("Applied")),
                            ]))
                  ];
                },
                body: TabBarView(children: [
                  AcceptedScreen(),
                  Center(child: Text("Approved")),
                  Center(child: Text("Applied")),
                ]))));
  }
}
