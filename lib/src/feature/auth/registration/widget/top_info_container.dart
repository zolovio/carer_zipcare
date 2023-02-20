import 'package:flutter/material.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';

class TopInfoContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopInfoContainer(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.darkPinkColor.withOpacity(.2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.info_outline, color: Colors.black)),
          Container(
            width: size.width - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(title,
                    fontSize: 16, color: AppColors.darkPinkColor),
                CommonText(subTitle,
                    maxLines: 3,
                    color: AppColors.blueGreyColor,
                    fontSize: 13,
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
