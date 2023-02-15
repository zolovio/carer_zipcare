import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';

import '../app_utils/textstyle.dart';
import '../constants/strings.dart';
import 'bounce_widget.dart';
import 'common_text.dart';
import 'custom_image.dart';

Widget vGap(double height) => SizedBox(height: height);

Widget hGap(double width) => SizedBox(width: width);

// flashBar({required String message}) => Get.snackbar(keyAppName.tr, message,
//     isDismissible: false,
//     colorText: Colors.black,
//     snackPosition: SnackPosition.BOTTOM,
//     barBlur: radius_50,
//     duration: Duration(seconds: 2),
//     margin: EdgeInsets.symmetric(horizontal: margin_10, vertical: margin_20));

setFileImage(
    {required String url, double? height, double? width, double? radius}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 100),
    child: Image.file(File(url),
        height: height, width: width, fit: BoxFit.contain),
  );
}

circleImageNetWork({imageurl, height, width, radius}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: FadeInImage.assetNetwork(
        fit: BoxFit.contain,
        width: width,
        height: height,
        placeholder: ICON_profile,
        image: imageurl != null ? imageurl : ""),
  );
}

circleAssetImage(
    {required String asset, double? height, double? width, double? radius}) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 100),
      child:
          imageAsset(asset, height: height, width: width, fit: BoxFit.contain));
}

divider() {
  return Divider(
    color: Colors.grey.withOpacity(0.5),
    thickness: width_1,
    height: height_30,
  );
}

verticalDivider() {
  return VerticalDivider(
    color: Colors.grey.withOpacity(0.5),
    thickness: 2,
  );
}

backAppBar(context, {String? title, onPress, actions, height, backWidget}) =>
    PreferredSize(
      preferredSize: Size.fromHeight(height ?? height_50),
      child: PhysicalModel(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    backWidget ??
                        InkWell(
                            onTap: onPress ??
                                () {
                                  FocusScope.of(context).unfocus();
                                  // Get.back(result: true);
                                  Navigator.pop(context);
                                },
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Transform.scale(
                                scaleX: 1.1,
                                child: imageAsset(
                                  ICON_back,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            )),
                    hGap(16),
                    CommonText(
                      title ?? "",
                      fontSize: 24,
                      color: AppColors.darkPinkColor,
                      isBold: true,
                    ),
                  ],
                ),
              ),
              actions ?? Container()
            ],
          ),
        ),
      ),
    );

// appBarWidget(
//         {bool showBack = true,
//         onLeadingTap,
//         backPressData,
//         GetxController? controller,
//         actions,
//         title}) =>
//     PreferredSize(
//       child: setPadding(
//         left: width_15,
//         right: width_20,
//         widget: AppBar(
//           backgroundColor: whiteColor,
//           leading: showBack
//               ? getInkWell(
//                   onTap: () {
//                     Get.back(result: backPressData);
//                   },
//                   widget: imageAsset(ICON_back, width: margin_25))
//               : imageAsset(splashLogoImage, width: margin_25),
//           leadingWidth: showBack ? margin_20 : margin_30,
//           titleTextStyle: textStyleMedium(
//               color: Colors.black87,
//               fontsize: font_16,
//               weight: FontWeight.w600),
//           centerTitle: true,
//           title: setPadding(
//               bottom: height_5,
//               widget: Text(
//                 title ?? '',
//                 textAlign: TextAlign.center,
//               )),
//           actions: actions ??
//               [
//                 _onlineOfflineWidget(controller: controller),
//                 _gotoNotificationIcon()
//               ],
//         ),
//       ),
//       preferredSize: Size.fromHeight(height_50),
//     );
//
// bool isOnline = true;
// _onlineOfflineWidget({GetxController? controller}) {
//   return getInkWell(
//       widget: Row(
//         children: [
//           Text(
//             isOnline ? strGoOffline_ : strGoOnline_,
//             style: textStyleMedium(
//               color: blackColor,
//               fontsize: font_16,
//             ),
//           ),
//           imageAsset(isOnline ? iconOffline : iconOnline,
//               width: isOnline ? margin_35 : margin_38),
//         ],
//       ),
//       onTap: () {
//         isOnline = !isOnline;
//         controller?.update();
//       });
// }
//
// _gotoNotificationIcon() {
//   return getInkWell(
//       widget: imageAsset(notificationImage, width: margin_20),
//       onTap: () {
//         Get.toNamed(Routes.notificationRoute);
//       });
// }
//
// DateTime? currentBackPressTime;
//
// Future<bool> onWillPop() {
//   DateTime now = DateTime.now();
//   if (currentBackPressTime == null ||
//       now.difference(currentBackPressTime!) > Duration(seconds: 1)) {
//     currentBackPressTime = now;
//     flashBar(message: strEndTime);
//     return Future.value(false);
//   }
//   return Future.value(true);
// }

personalInfoTopView(
    {title, pageCount, hideBottomText, subTitle, subTap, titleColor}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height_5, horizontal: margin_0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width_10,
        ),
        Column(
          children: [
            Text(
              title ?? "",
              style: textStyleMedium(
                color: AppColors.blackColor,
                fontsize: font_18,
              ),
            ),
            hideBottomText == null ? vGap(height_10) : emptyContainer(),
            hideBottomText == null
                ? Text.rich(
                    TextSpan(text: pageCount ?? "", children: [
                      TextSpan(
                        text: '/9',
                        style: textStyleMedium(
                            color: titleColor ?? AppColors.blackColor,
                            weight: FontWeight.w600,
                            fontsize: font_18),
                      )
                    ]),
                    textAlign: TextAlign.center,
                    style: textStyleMedium(
                      color: AppColors.darkPinkColor,
                      fontsize: font_18,
                      weight: FontWeight.w600,
                    ),
                  )
                : emptyContainer(),
          ],
        ),
        InkWell(
          onTap: subTap != null
              ? subTap
              : () {
                  // Get.offAllNamed(Routes.mainScreenRoute);
                },
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: margin_5, horizontal: margin_5),
            child: Text(
              subTitle ?? strSkip,
              style: textStyleBold(
                  fontWeight: FontWeight.w600,
                  fontsize: font_12,
                  color: AppColors.darkPinkColor),
            ),
          ),
        ),
      ],
    ),
  );
}

emptyContainer() {
  return Container(
    height: margin_0,
    width: margin_0,
  );
}

Widget headingFormText(
    {title, String star = '', fontSize, textColor, FontWeight? fontWeight}) {
  return CommonText("$title$star",
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      textAlign: TextAlign.start,
      maxLines: 2);
}

headingFormText2({title, fontSize}) {
  return CommonText(title,
      fontSize: fontSize ?? font_13,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.start,
      maxLines: 2,
      color: AppColors.blueGreyColor);
}

radioTextWithHeading({
  required String headingTxt,
  required bool value,
  onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vGap(height_10),
      headingFormText(title: headingTxt, fontSize: font_13),
      vGap(height_10),
      commonRadioButtons(
        value,
        title1: strYes,
        title2: strNo,
        onTap: onTap,
      ),
      vGap(height_10),
    ],
  );
}

radioTextHeading({
  required bool value,
  onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonRadioButtons(
        value,
        title1: strYes,
        title2: strNo,
        onTap: onTap,
      ),
      vGap(height_10),
    ],
  );
}

commonRadioButtons(bool isSelected,
    {String title1 = '', String title2 = '', Function()? onTap}) {
  return Row(
    children: [
      Expanded(
          child: radioTitleText(
              tick: isSelected,
              title: title1,
              onTap: () {
                if (onTap != null && !isSelected) onTap();
              })),
      Expanded(
          child: radioTitleText(
              tick: !isSelected,
              title: title2,
              onTap: () {
                if (onTap != null && isSelected) onTap();
              }))
    ],
  );
}

radioTitleText({tick, title, onTap, textColor, hideCheckBox}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        hideCheckBox == null
            ? imageAsset(tick == true ? iconSelectedRadio : iconUnSelectedRadio,
                height: height_20)
            : SizedBox(),
        hideCheckBox == null ? hGap(width_5) : SizedBox(),
        CommonText(title,
            fontWeight: FontWeight.w600,
            fontSize: font_13,
            textAlign: TextAlign.start,
            color: textColor ?? AppColors.blackColor),
      ],
    ),
  );
}

checkTitleText({bool? tick, title, onTap, textColor, hideCheckBox}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        hideCheckBox == null
            ? imageAsset(tick == true ? tickedImage : unTickedImage,
                height: height_18)
            : SizedBox(),
        hideCheckBox == null ? hGap(width_5) : SizedBox(),
        CommonText(title,
            fontWeight: FontWeight.w400,
            fontSize: font_13,
            textAlign: TextAlign.start,
            color: textColor ?? AppColors.blueGreyColor),
      ],
    ),
  );
}

checkTitleTextTitle({tick, title, onTap, textColor, hideCheckBox}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      hideCheckBox == null
          ? InkWell(
              onTap: onTap,
              child: imageAsset(tick == true ? tickedImage : unTickedImage,
                  height: height_15))
          : SizedBox(width: 0, height: 0),
      hideCheckBox == null ? hGap(width_5) : Container(width: 0, height: 0),
      CommonText(title,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
          color: textColor ?? AppColors.blueGreyColor),
    ],
  );
}

nameLetterContainer({letter}) {
  return Container(
    padding: EdgeInsets.all(margin_25),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightestPinkColor,
        border: Border.all(color: Colors.white, width: 3)),
    child: Center(
        child: Text(
      letter ?? "JW",
      style: textStyleMedium(
          fontsize: font_17,
          weight: FontWeight.w600,
          letterSpacing: 3,
          color: AppColors.blackColor),
    )),
  );
}

viewPostedDate(String date) {
  DateTime tempDate = DateTime.parse(date).toUtc().toLocal();
  String formatTime = DateFormat('dd-MMM-yyyy').format(tempDate);

  debugPrint("DateFormat $formatTime");

  return formatTime;
}

iconTextView({icon, text, textSize, color}) {
  return Row(
    children: [
      imageAsset(
        icon,
        height: margin_15,
        width: margin_15,
      ),
      hGap(width_5),
      Text(
        text,
        style: textStyleMedium(
          fontsize: textSize ?? font_12,
          weight: FontWeight.w500,
          color: color ?? AppColors.lightGreyColor,
        ),
        maxLines: 1,
      ),
    ],
  );
}

gridHeadView({title, list, isText = false, value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      isText == false
          ? Text(
              title,
              style: textStyleNormal(
                  fontsize: font_12, color: AppColors.blackColor),
            )
          : Container(),
      vGap(height_10),
      _gridView(list: list, value: value)
    ],
  );
}

detailColumn(
    {firstTxt,
    secondTxt,
    thirdTxt,
    fourthTxt,
    fifthTxt,
    color,
    lastTxtColor,
    lastText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        firstTxt,
        style: textStyleBold(
            fontWeight: FontWeight.w600,
            fontsize: font_11point5,
            color: color ?? AppColors.blueGreyColor),
      ),
      vGap(height_15),
      Text(
        secondTxt,
        style: textStyleBold(
            fontWeight: FontWeight.w600,
            fontsize: font_11point5,
            color: color ?? AppColors.blueGreyColor),
      ),
      vGap(height_15),
      Text(
        thirdTxt,
        style: textStyleBold(
            fontWeight: FontWeight.w600,
            fontsize: font_11point5,
            color: color ?? AppColors.blueGreyColor),
      ),
      vGap(height_15),
      Text(
        fourthTxt,
        style: textStyleBold(
            fontWeight: FontWeight.w600,
            fontsize: font_11point5,
            color: color ?? AppColors.blueGreyColor),
      ),
      lastText == null ? emptyContainer() : vGap(height_35),
      lastText == null
          ? emptyContainer()
          : Text(
              fifthTxt,
              style: textStyleBold(
                  fontWeight: FontWeight.w600,
                  fontsize: font_11point5,
                  color: lastTxtColor ?? AppColors.blueGreyColor),
            ),
    ],
  );
}

_gridView({list, value = false}) {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    children: List.generate(
        list.length,
        (index) => Card(
              elevation: margin_1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius_15)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: margin_5, horizontal: margin_10),
                decoration: BoxDecoration(
                    color: AppColors.lightPinkColor,
                    borderRadius: BorderRadius.circular(radius_15)),
                child: CommonText(
                  value == true ? list[index] : list[index].title ?? "",
                  fontSize: font_10,
                  color: AppColors.blackColor,
                ),
              ),
            )),
  );
}

smallButton(
    {title,
    fontsize,
    color,
    textColor,
    verticalMargin,
    horizontalMargin,
    radius,
    onTap}) {
  return InkWell(
    onTap: onTap ?? () {},
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? margin_10,
          vertical: verticalMargin ?? margin_5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? radius_10)),
      child: Center(
        child: Text(
          title,
          style: textStyleMedium(
              fontsize: fontsize ?? font_14,
              weight: FontWeight.w500,
              color: textColor ?? Colors.white),
        ),
      ),
    ),
  );
}

headContainer({title, titleColor, subTitle, subColor, hideContainer}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonText(title,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
          fontSize: font_15),
      hideContainer == null
          ? vGap(height_5)
          : const SizedBox(
              height: 0,
              width: 0,
            ),
      hideContainer == null
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius_10),
                  color: AppColors.lightestPinkColor),
              padding: EdgeInsets.symmetric(
                  vertical: height_10, horizontal: width_10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageAsset(infoImage, width: margin_18),
                  hGap(width_15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(strHandlingAbility,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                            color: titleColor ?? AppColors.blueGreyColor,
                            fontSize: font_14),
                        vGap(height_5),
                        CommonText(subTitle,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                            color: subColor ?? AppColors.blueGreyColor,
                            maxLines: 2,
                            fontSize: font_11),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: 0,
              width: 0,
            ),
    ],
  );
}

String? dateIntoFormated({String? dateString}) {
  try {
    if (dateString != null && dateString != "") {
      var strToDateTime = DateTime.parse(dateString.toString() + 'Z');
      final convertLocal = strToDateTime.toLocal();
      DateFormat newFormat = DateFormat("EEEE,MMMM y");
      return newFormat.format(convertLocal);
    }
  } catch (e) {
    debugPrint("exceptio occerd $e");
    return "";
  }
  return null;
}

clickableIcon({required String icon, required double iconSize, onTap}) {
  return BouncingWidget(
      onPressed: onTap, child: imageAsset(icon, width: margin_20));
}

// appExpirationDialog() {
//   return Get.dialog(
//     AlertDialog(
//       title: Container(
//           height: height_150,
//           width: Get.width,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(radius_10),
//                 topRight: Radius.circular(radius_10),
//               )),
//           child: Image.asset(alert_gif, fit: BoxFit.cover)),
//       titlePadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       content: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: margin_10,
//           ),
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             Text(strDemoExpired,
//                     maxLines: 5,
//                     textAlign: TextAlign.center,
//                     style: textStyleMedium().copyWith(color: Colors.black))
//                 .marginOnly(bottom: height_10),
//             Text(strAppDemoExpiredDesc,
//                     maxLines: 5,
//                     textAlign: TextAlign.center,
//                     style: textStyleMedium().copyWith(color: Colors.black))
//                 .marginOnly(bottom: height_10)
//           ])),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(radius_10)),
//     ),
//     barrierColor: Colors.grey.shade300,
//     barrierDismissible: false,
//   );
// }

class SelectedIcon {
  String? title;
  bool iconSelected = false;
  bool iconSelected2 = true;
  var serviceType;
  int rateClick = 1;

  SelectedIcon(
      {this.title,
      this.iconSelected = false,
      this.serviceType,
      this.iconSelected2 = true,
      this.rateClick = 1});
}

class SelectedAvailability {
  String? title;
  bool iconSelected = false;
  List<SelectedIcon>? timeList = [];

  SelectedAvailability({this.title, this.iconSelected = false, this.timeList});
}

// void launchUrlW({@required url}) async {
//   debugPrint("launchUrl   $url");
//   if (!await launchUrl(
//     url,
//     mode: LaunchMode.externalApplication,
//   )) {
//     throw 'Could not launch $url';
//   }
// }

todayDateFormat(date) {
  return DateFormat("yyyy-MM-dd HH:mm:ss").parse(date).toUtc();
}

dateFormat(date) {
  return DateFormat("yyyy-MM-dd").parse(date);
}

localFullDateFormat(date) {
  return DateFormat("dd-MM-yyyy")
      .format(DateFormat("yyyy-MM-dd").parse(date, true));
}

invoiceDateFormat(date) {
  return DateFormat("dd/MM/yyyy")
      .format(DateFormat("yyyy-MM-dd").parse(date, true));
}

timeFormat(date) {
  return DateFormat("hh:mm a")
      .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true));
}

timeOnlyFormat(date) {
  return DateFormat("hh:mm a").format(DateFormat("HH:mm:ss").parse(date, true));
}

localFullTimeFormat(date) {
  return DateFormat("hh:mm a")
      .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true).toLocal());
}

localFullDateTimeFormat(date) {
  return DateFormat("dd-MM-yyyy hh:mm a")
      .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(date, true).toLocal());
}

hourlyFormat(time) {
  return DateFormat("HH:mm").format(DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, time.hour, time.minute));
}

timedate(String date) {
  DateTime tempDate = DateTime.parse(date);
  String formatTime = DateFormat('yyyy-MM-dd').format(tempDate);

  debugPrint("DateFormat $formatTime");

  return formatTime;
}

// void startIosDownload({String? document, path, name}) async {
//   await Permission.storage.request();
//   await FlutterDownloader.enqueue(
//     url: website + document!,
//     saveInPublicStorage: true,
//     savedDir: path,
//     showNotification: true,
//     openFileFromNotification: true,
//     fileName: '${name ?? ''}' +
//         '_' +
//         DateTime.now().millisecondsSinceEpoch.toString(),
//   );
// }

// startAndroidDownload({String? document, path, String? name}) async {
//   await Permission.storage.request();
//   await FlutterDownloader.enqueue(
//     url: website + document!,
//     saveInPublicStorage: true,
//     fileName: '${name ?? ''}' +
//         '_' +
//         DateTime.now().millisecondsSinceEpoch.toString(),
//     savedDir: path,
//     showNotification: true,
//     // show download progress in status bar (for Android)
//     openFileFromNotification: true,
//     // click on notification to open downloaded file (for Android)
//   );
// }

getCurrentDate() {
  var now = DateTime.now();
  var formatter = DateFormat(strCommonDate);
  return formatter.format(now).trim();
}

getDateWithDay({stringPath}) {
  if (stringPath != null && stringPath != "") {
    return DateFormat(strTimeDate).format(DateTime.parse(stringPath));
  } else {
    return "";
  }
}

// emojiKeyBoardWidget({bool? emojiShowing, onBackspacePressed, onEmojiSelected}) {
//   return Offstage(
//     offstage: !emojiShowing!,
//     child: SizedBox(
//       height: 250,
//       child: EmojiPicker(
//           onEmojiSelected: (c, Emoji emoji) async {
//             onEmojiSelected(emoji);
//           },
//           onBackspacePressed: onBackspacePressed,
//           config: Config(
//               columns: 7,
//               emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
//               verticalSpacing: 0,
//               horizontalSpacing: 0,
//               bgColor: const Color(0xFFF2F2F2),
//               indicatorColor: Colors.black,
//               iconColor: Colors.grey,
//               iconColorSelected: darkPinkColor,
//               backspaceColor: darkPinkColor,
//               skinToneDialogBgColor: Colors.white,
//               skinToneIndicatorColor: Colors.white,
//               enableSkinTones: true,
//               showRecentsTab: true,
//               recentsLimit: 28,
//               tabIndicatorAnimDuration: kTabScrollDuration,
//               categoryIcons: const CategoryIcons(),
//               buttonMode: ButtonMode.MATERIAL)),
//     ),
//   );
// }

String timeAgoSinceDateO(String dateString, {bool numericDates = true}) {
  if (dateString != null) {
    var datetime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString, true).toLocal();
    return DateFormat('hh:mm a').format(datetime.toLocal());
  } else {
    return "";
  }
}
