import 'package:domotic_ease/core/constant/them.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  Locale? languageDevices;
  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      languageDevices = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      languageDevices = const Locale("en");
    } else {
      languageDevices = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
