import 'package:domotic_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

translationDatabase(columnEn, columnAr) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "en") {
    return columnEn;
  } else if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    if (Locale(Get.deviceLocale!.languageCode).toString() == 'ar') {
      return columnAr;
    } else {
      return columnEn;
    }
  }
}
