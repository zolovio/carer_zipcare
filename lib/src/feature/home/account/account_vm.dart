import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/constants/assets.dart';
import 'package:zip_care/src/feature/home/account/contact/contact_screen.dart';
import 'package:zip_care/src/feature/home/account/faq/faq_screen.dart';
import 'package:zip_care/src/feature/home/account/legal/legal_screen.dart';
import 'package:zip_care/src/feature/home/account/my_availability/my_availability_screen.dart';
import 'package:zip_care/src/feature/home/account/my_buddy/my_buddy_screen.dart';
import 'package:zip_care/src/feature/home/account/my_reviews/my_reviews_screen.dart';
import 'package:zip_care/src/feature/home/account/payments/payments_screen.dart';
import 'package:zip_care/src/feature/home/account/platform_employment/platform_employment_screen.dart';
import 'package:zip_care/src/feature/home/account/settings/settings_screen.dart';

final accountVmProvider = ChangeNotifierProvider.autoDispose<AccountVm>((ref) {
  return AccountVm();
});

class AccountVm extends ChangeNotifier {
  AccountVm() {
    onInit();
  }
  List<Map<String, dynamic>> accountList = [
    {
      "title": "Platform Employment",
      "img": ic_employment,
      "on": PlatformEmploymentScreen()
    },
    {"title": "My Buddy", "img": buddyImage, "on": MyBuddyScreen()},
    {
      "title": "My Availability",
      "img": AvailImage,
      "on": MyAvailabilityScreen()
    },
    {"title": "Contact", "img": helpImage, "on": ContactScreen()},
    {"title": "Payments", "img": paymentImage, "on": PaymentsScreen()},
    {"title": "Legal", "img": legalImage, "on": LegalScreen()},
    {"title": "Settings", "img": settingsImage, "on": SettingsScreen()},
    {"title": "My Reviews", "img": reviewImage, "on": MyReviewsScreen()},
    {"title": "FAQ", "img": faqImage, "on": FAQScreen()}
  ];

  void onInit() {}
}
