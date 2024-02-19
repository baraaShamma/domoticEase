import 'dart:io';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: TextStyle(
          color: Get.isDarkMode
              ? AppColor.primaryColorDark
              : AppColor.primaryColorLight,
          fontWeight: FontWeight.bold),
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Get.isDarkMode
                    ? AppColor.primaryColorDark
                    : AppColor.primaryColorLight)),
            onPressed: () {
              exit(0);
            },
            child: const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Get.isDarkMode
                    ? AppColor.primaryColorDark
                    : AppColor.primaryColorLight)),
            onPressed: () {
              Get.back();
            },
            child: const Text("الغاء"))
      ]);
  return Future.value(true);
}
