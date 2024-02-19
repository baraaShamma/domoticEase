import 'package:domotic_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  MyServices myServices = Get.find();

  // final key = 'isDarkModes';
  bool isDarkModes = false;

  saveThemeDataInBox(bool isDark) {
    myServices.sharedPreferences.setBool("isDark", isDark);
  }

  bool getThemeDataFromBox() {
    if (myServices.sharedPreferences.getBool("isDark") == false ||
        myServices.sharedPreferences.getBool("isDark") == null) {
      isDarkModes = true;
      update();
      return false;
    } else {
      isDarkModes = false;
      update();
      return true;
    }
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
