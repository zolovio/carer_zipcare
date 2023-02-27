import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/chat/chat_vm.dart';
import 'package:zip_care/src/feature/home/chat/view_chat/view_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(chatVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Chat",
              fontSize: font_20,
              logo: true,
              nofi: true),
          body: SingleChildScrollView(
            child: Column(children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _vm.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var list = _vm.data[index];
                    return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors
                                              .blueGreyColor
                                              .withOpacity(0.3),
                                          blurRadius: 10)
                                    ]),
                                child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewChatScreen()));
                                    },
                                    title: CommonText(
                                        "${list['name']}",
                                        textAlign: TextAlign.start),
                                    trailing: CommonText(
                                        "${list['time']}",
                                        fontSize: font_10,
                                        color: Colors.grey,
                                        textAlign: TextAlign.start),
                                    subtitle: CommonText(
                                        maxLines: 3,
                                        "${list['msg']}",
                                        textAlign: TextAlign.start,
                                        fontSize: font_14,
                                        color:
                                            AppColors.blueGreyColor),
                                    leading: CircleAvatar(
                                        backgroundColor:
                                            AppColors.darkPinkColor,
                                        child: CommonText(
                                            getInitials(list['name']),
                                            color: Colors.white))))));
                  })
            ]),
          ));
    });
  }
}

String getInitials(String bankAccountName) =>
    bankAccountName.isNotEmpty
        ? bankAccountName
            .trim()
            .split(RegExp(' +'))
            .map((s) => s[0])
            .take(2)
            .join()
        : '';
