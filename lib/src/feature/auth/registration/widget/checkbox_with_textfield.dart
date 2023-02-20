import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zip_care/src/core/common/commonTextFiled.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';

class CheckboxWithTextfield extends StatelessWidget {
  final Function onTap;
  final Function onFiletap;
  final String title;
  final bool isCheck;
  final String filePath;
  final TextEditingController ctrl;

  const CheckboxWithTextfield(
      {super.key,
      required this.isCheck,
      required this.filePath,
      required this.title,
      required this.onTap,
      required this.onFiletap,
      required this.ctrl});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: isCheck,
            activeColor: AppColors.darkPinkColor,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? value) {
              onTap();
            },
            title: Text("$title")),
        !isCheck
            ? SizedBox()
            : Column(
                children: [
                  CommonTextFiled(
                      controller: ctrl,
                      hintText: strEnterDetail,
                      name: strEnterDetail,
                      validator: (FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]))),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: size.width / 1.7,
                            child: Text(filePath,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.colorGrey))),
                        InkWell(
                            onTap: () {
                              onFiletap();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.upload,
                                    color: AppColors.darkPinkColor),
                                CommonText(strUploadCertificate,
                                    fontSize: 13,
                                    color: AppColors.blueGreyColor),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
      ],
    );
  }
}
