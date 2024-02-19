// import 'package:domotic_ease/core/constant/colors.dart';
// import 'package:flutter/material.dart';
//
// ThemeData themeEnglish = ThemeData(
//   fontFamily: "PlayfairDisplay",
//   textTheme: const TextTheme(
//       headline1: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
//       headline2: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
//       bodyText1: TextStyle(
//           height: 2,
//           color: AppColor.grey,
//           fontWeight: FontWeight.bold,
//           fontSize: 14),
//       bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
//   primarySwatch: Colors.red,
// );
//
// ThemeData themeArabic = ThemeData(
//   fontFamily: "Cairo",
//   textTheme: const TextTheme(
//       headline1: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
//       headline2: TextStyle(
//           fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
//       bodyText1: TextStyle(
//           height: 2,
//           color: AppColor.grey,
//           fontWeight: FontWeight.bold,
//           fontSize: 14),
//       bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
//   primarySwatch: Colors.blue,
// );

import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesApp {
  static final light = ThemeData(
    textTheme: TextTheme(
      titleSmall: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: GoogleFonts.amiri(
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      headlineSmall: GoogleFonts.amiri(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        // shadows: [Shadow(blurRadius: 2)]
      ),
    ),
    primaryColor: AppColor.primaryColorLight,
    cardColor: AppColor.white,
    colorScheme: const ColorScheme(
      secondary: AppColor.primaryColorLight,
      brightness: Brightness.light,
      background: AppColor.backgroundColorLight,
      primary: AppColor.primaryColorLight,
      error: Colors.white,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: AppColor.primaryColorLight,
      onSecondary: AppColor.primaryColorLight,
      onSurface: AppColor.black,
      surface: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: AppColor.primaryColorDark,
    cardColor: AppColor.black,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: GoogleFonts.amiri(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      headlineSmall:
          GoogleFonts.amiri(fontSize: 12, fontStyle: FontStyle.normal),
    ),
    colorScheme: const ColorScheme(
      secondary: AppColor.primaryColorDark,
      brightness: Brightness.dark,
      background: AppColor.backgroundColorDark,
      primary: AppColor.primaryColorDark,
      error: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      onPrimary: AppColor.primaryColorDark,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      surface: Colors.white,
    ),
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
