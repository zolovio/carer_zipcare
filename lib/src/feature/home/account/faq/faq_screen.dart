import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/faq/faq_vm.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(faqVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "FAQ",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _vm.faqList.length,
                itemBuilder: (BuildContext context, int i) {
                  var list = _vm.faqList[i];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: ExpansionTile(
                          backgroundColor: AppColors.lighterPinkColor,
                          title: CommonText(list["title"]!,
                              fontSize: font_18,
                              textAlign: TextAlign.start),
                          trailing: Icon(Icons.add,
                              color: AppColors.blackColor,
                              size: 18.sp),
                          children: [
                            ListTile(
                                title: CommonText(list["des"]!,
                                    fontSize: font_14,
                                    maxLines: 5000,
                                    color: AppColors.colorGrey,
                                    fontFamily:
                                        FontFamily.lexendLight,
                                    textAlign: TextAlign.start))
                          ]));
                })
          ])));
    });
  }
}
