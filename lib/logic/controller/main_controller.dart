import 'package:domotic_ease/view/screen/home_screen.dart';
import 'package:domotic_ease/view/screen/personal_screen.dart';
import 'package:domotic_ease/view/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainController extends GetxController {
  changePage(int currentPage);
}

class MainControllerImp extends MainController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomeScreen(),
    const PersonalScreen(),
    const SettingsScreen()

    // SettingsScreen()
  ];

  List titleBottomAppbar = [
    "home",
    "profile",
    "settings",
  ];

  List iconBottomAppbar = [
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
