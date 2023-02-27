import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/chat/view_chat/view_chat_vm.dart';

class ViewChatScreen extends StatelessWidget {
  const ViewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var size = MediaQuery.of(context).size;
      final _vm = ref.watch(viewChatVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Chat",
              nofi: true,
              isBackActive: true,
              fontSize: font_19),
          body: Column(children: [
            Container(
              padding: EdgeInsets.all(5),
              child:
                  CommonText("04  February  2023", fontSize: font_11),
              decoration: BoxDecoration(
                  color: AppColors.darkPinkColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)),
            ),
            ListTile(
                title: CommonText("Elli Watson",
                    textAlign: TextAlign.left),
                leading: CircleAvatar(
                    backgroundColor:
                        AppColors.darkPinkColor.withOpacity(.4),
                    child: CommonText("EW"))),
            Expanded(
                child: ListView.builder(
                    itemCount: _vm.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var list = _vm.data[index];
                      return Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: GestureDetector(
                              child: Align(
                            alignment: list['sender'] == 0
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: list['sender'] == 0
                                      ? AppColors.darkPinkColor
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    topLeft: Radius.circular(15.0),
                                    bottomLeft: list['sender'] != 0
                                        ? Radius.circular(0.0)
                                        : Radius.circular(15.0),
                                    bottomRight: list['sender'] == 0
                                        ? Radius.circular(0.0)
                                        : Radius.circular(15.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    CommonText(
                                      list['msg'],
                                      textAlign: TextAlign.start,
                                      maxLines: 4,
                                      fontSize: font_13,
                                      color: list['sender'] == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    Align(
                                      alignment: list['sender'] == 0
                                          ? Alignment.topRight
                                          : Alignment.topLeft,
                                      child: CommonText(
                                        list['time'],
                                        fontSize: font_10,
                                        textAlign: TextAlign.left,
                                        color: list['sender'] == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                )),
                          )));
                    })),
            CommonTextFiled(
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sentiment_satisfied)),
                suffixIcon: Container(
                  width: 110,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.attachment)),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColors.darkPinkColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  bottomRight:
                                      Radius.circular(15.0))),
                          child:
                              Icon(Icons.send, color: Colors.white)),
                    ],
                  ),
                ),
                hintText: "",
                name: "",
                validator: null),
            SizedBox(height: 10.h)
          ]));
    });
  }
}
