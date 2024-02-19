
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find() ;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("user") == "2"){
      return const RouteSettings(name: AppRoute.mainScreen) ;
    }
    if(myServices.sharedPreferences.getString("onBoarding") == "1"){
      return const RouteSettings(name: AppRoute.loginScreen) ;
    }
  }
}