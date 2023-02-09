import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';
import 'font_family.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: FontFamily.mazzard,
  hoverColor: AppColors.darkPinkColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPinkColor,
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.w400),
    bodyLarge: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
    labelLarge: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
    bodySmall:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
    headlineMedium: const TextStyle(
        color: Colors.grey, fontSize: 22, fontWeight: FontWeight.w900),
    displaySmall: const TextStyle(color: Colors.black),
    titleLarge: const TextStyle(color: Colors.black),
    headlineSmall: const TextStyle(
        color: Colors.red, fontSize: 17, fontWeight: FontWeight.w800),
    displayLarge: const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
    displayMedium: const TextStyle(
        color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
    labelSmall: const TextStyle(color: Colors.black),
    titleMedium: const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
    titleSmall: const TextStyle(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.red),
  inputDecorationTheme: InputDecorationTheme(
      border: outlineBorder(),
      enabledBorder: outlineBorder(),
      hoverColor: AppColors.darkPinkColor,
      focusedBorder: outlineBorder(),
      errorBorder: outlineBorder(),
      disabledBorder: outlineBorder(),
      focusedErrorBorder: outlineBorder(),
      labelStyle: const TextStyle(
          color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.w400)),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: font_16, fontWeight: FontWeight.w600)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      overlayColor: MaterialStateProperty.all<Color>(Colors.red.shade50),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: font_16, fontWeight: FontWeight.w600)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      overlayColor: MaterialStateProperty.all<Color>(Colors.red.shade50),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: font_16, fontWeight: FontWeight.w600)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.red.shade50),
      overlayColor: MaterialStateProperty.all<Color>(Colors.red),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white)
      .copyWith(background: Colors.white),
);

OutlineInputBorder outlineBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red.withOpacity(0.5),
      ),
    );
