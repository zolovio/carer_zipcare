import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';
import 'package:zip_care/src/core/constants/font_family.dart';
import 'package:zip_care/src/core/ui_component/common_app_bar_with_back.dart';
import 'package:zip_care/src/core/ui_component/common_text.dart';
import 'package:zip_care/src/feature/home/account/my_reviews/my_reviews_vm.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(myReviewsVmProvider);
      return Scaffold(
          appBar: CommonAppBarWithBack(
              title: "My Reviews",
              fontSize: font_20,
              isBackActive: true,
              nofi: true),
          body: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  child: Column(children: [
                    CommonText("$rat",
                        fontSize: font_40, fontFamily: FontFamily.lexendBold),
                    RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {
                          print(rating);
                          rat = rating;
                          _vm.notifyListeners();
                        }),
                    CommonText(_vm.myReviews["reviewsCount"],
                        color: AppColors.blueGreyColor),
                    SizedBox(height: height_40),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _vm.myReviews["name"].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var list = _vm.reviewList[i];
                          return Padding(
                              padding: EdgeInsets.only(bottom: 20.sp),
                              child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          CircleAvatar(),
                                          SizedBox(width: width_20),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(list["name"]!,
                                                    fontFamily: FontFamily
                                                        .lexendSemiBold,
                                                    textAlign: TextAlign.start),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      RatingBar.builder(
                                                          initialRating: 3,
                                                          minRating: 1,
                                                          itemSize: 20,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemBuilder: (context,
                                                                  _) =>
                                                              const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            print(rating);
                                                          }),
                                                      SizedBox(width: width_5),
                                                      CommonText(
                                                          list["rating"]!,
                                                          fontSize: font_17)
                                                    ])
                                              ])
                                        ]),
                                        CommonText(list["rating"]!,
                                            color: AppColors.blueGreyColor,
                                            fontSize: font_14)
                                      ]),
                                  subtitle: Padding(
                                      padding: EdgeInsets.only(top: 15.sp),
                                      child: CommonText(
                                          maxLines: 150,
                                          list["des"]!,
                                          color: AppColors.blueGreyColor,
                                          textAlign: TextAlign.start,
                                          fontSize: font_14))));
                        })
                  ]))));
    });
  }
}
