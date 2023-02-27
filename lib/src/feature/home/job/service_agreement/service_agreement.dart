import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/common/widgets/commonButton.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/core/ui_component/custom_image.dart';
import 'package:zip_care/src/feature/home/job/service_agreement/service_agreement_vm.dart';

class ServiceAgreementScreen extends StatelessWidget {
  const ServiceAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(serviceAgreementVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "Service Agreement",
              isBackActive: true,
              nofi: true,
              fontSize: font_18),
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height_10),
                        _vm.isEdit || _vm.isPreview || _vm.isApprove
                            ? StatusContainer(
                                bgColor: _vm.isApprove
                                    ? Colors.green
                                    : AppColors.darkPinkColor,
                                title: _vm.isApprove
                                    ? "Approved"
                                    : _vm.isEdit
                                        ? "Edit service agreement"
                                        : _vm.isSent
                                            ? "Pending for client approval"
                                            : "Preview service agreement")
                            : SizedBox(),
                        SizedBox(height: height_20),
                        FormBuilderTextField(
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                            enabled: _vm.isEdit,
                            maxLines: 15,
                            controller: _vm.serviceAgreement,
                            name: strServiceAgreement),
                        Divider(height: height_60),
                        _vm.isSent
                            ? CommonButtonWidget(
                                buttonWidth: screenWidth,
                                onTap: () {
                                  _vm.onApprove();
                                },
                                text: "Download",
                                icon: Icon(Icons.download,
                                    color: Colors.white))
                            : CommonButtonWidget(
                                buttonWidth: screenWidth,
                                onTap: () {
                                  _vm.isEdit
                                      ? _vm.setEdit(isView: true)
                                      : _vm.setEdit();
                                },
                                text: _vm.isEdit ? "View" : "Edit",
                                icon: _vm.isEdit
                                    ? Icon(Icons.visibility_outlined,
                                        color: Colors.white)
                                    : imageAsset(editsImage,
                                        height: height_20)),
                        SizedBox(height: height_10),
                        _vm.isEdit
                            ? CommonButtonWidget(
                                buttonWidth: screenWidth,
                                onTap: () {
                                  _vm.setReset();
                                },
                                text: "Reset",
                                icon: imageAsset(reset,
                                    height: height_20))
                            : CommonButtonWidget(
                                buttonWidth: screenWidth,
                                onTap: () {
                                  _vm.onSend();
                                },
                                text: "Send",
                                icon: imageAsset(chatsImage,
                                    height: height_20))
                      ]))));
    });
  }
}

class StatusContainer extends StatelessWidget {
  final String title;
  final Color bgColor;

  const StatusContainer(
      {super.key,
      required this.title,
      this.bgColor = AppColors.darkPinkColor});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 55,
        alignment: Alignment.center,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bgColor.withOpacity(.1),
        ),
        child: CommonText(title, color: bgColor, fontSize: 15));
  }
}
