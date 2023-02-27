import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/feature/home/account/account_screen.dart';
import 'package:zip_care/src/feature/home/chat/chat_screen.dart';
import 'package:zip_care/src/feature/home/home/home_screen.dart';
import 'package:zip_care/src/feature/home/job/job_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _Home();
}

class _Home extends State<BottomBar> {
  int _selectedIndex = 0;
  static const List _list = [
    HomeScreen(),
    JobScreen(),
    ChatScreen(),
    Text("Timesheet"),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _list.elementAt(_selectedIndex)),
        bottomNavigationBar: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(50),
                                  color: _selectedIndex == 0
                                      ? AppColors.lightestGreyColor
                                      : AppColors.whiteColor),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(homeUnImage,
                                      height: height_25)))),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(50),
                                  color: _selectedIndex == 1
                                      ? AppColors.lightestGreyColor
                                      : AppColors.whiteColor),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(jobUnImage,
                                      height: height_25)))),
                      label: "Jobs"),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(50),
                                  color: _selectedIndex == 2
                                      ? AppColors.lightestGreyColor
                                      : AppColors.whiteColor),
                              child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Image.asset(chatUnImage,
                                      height: height_25)))),
                      label: "Chat"),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(50),
                                  color: _selectedIndex == 3
                                      ? AppColors.lightestGreyColor
                                      : AppColors.whiteColor),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(
                                      timesheetUnSelectedImage,
                                      height: height_25)))),
                      label: "Timesheet"),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(50),
                                  color: _selectedIndex == 4
                                      ? AppColors.lightestGreyColor
                                      : AppColors.whiteColor),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(accountUnImage,
                                      height: height_22)))),
                      label: "Account")
                ],
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.whiteColor,
                currentIndex: _selectedIndex,
                unselectedItemColor: AppColors.blackColor,
                selectedItemColor: AppColors.darkPinkColor,
                selectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.lexendSemiBold),
                unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.lexendSemiBold),
                onTap: _onItemTapped)));
  }
}
