/*
 *  @copyright : Ozvid Technologies Pvt. Ltd. < www.ozvid.com >
 *  @author     : Shiv Charan Panjeta < shiv@ozvid.com >
 *  All Rights Reserved.
 *  Proprietary and confidential :  All information contained herein is, and remains
 *  the property of Ozvid Technologies Pvt. Ltd. and its partners.
 *  Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/constants/dimens.dart';

toast(message, {int seconds = 1}) => Fluttertoast.showToast(
      msg: '$message',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.darkPinkColor.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: font_16,
    );
