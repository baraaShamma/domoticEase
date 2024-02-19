import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();

  onPageChanged(int indexPage);
}

class OnBoardingControllerImplement extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find() ;

  @override
  nextPage() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onBoarding", "1") ;

      Get.offAllNamed(AppRoute.loginScreen);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInCirc);
    }
    update();
  }

  @override
  onPageChanged(int indexPage) {
    currentPage = indexPage;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    pageController = PageController();
  }
}
