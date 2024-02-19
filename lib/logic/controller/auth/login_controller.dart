import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async{
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          email.text, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {

      if (response['status'] == "success") {
        myServices.sharedPreferences.setInt("users_id", response['data']['users_id']) ;
        myServices.sharedPreferences.setString("first_name_en", response['data']['first_name_en']) ;
        myServices.sharedPreferences.setString("first_name_ar", response['data']['first_name_ar']) ;
        myServices.sharedPreferences.setString("middle_name_en", response['data']['middle_name_en']) ;
        myServices.sharedPreferences.setString("middle_name_ar", response['data']['middle_name_ar']) ;
        myServices.sharedPreferences.setString("last_name_en", response['data']['last_name_en']) ;
        myServices.sharedPreferences.setString("last_name_ar", response['data']['last_name_ar']) ;
        myServices.sharedPreferences.setString("email", response['data']['email']) ;
        myServices.sharedPreferences.setString("phone", response['data']['phone']) ;
        myServices.sharedPreferences.setString("type_user", response['data']['type_user']) ;
        myServices.sharedPreferences.setString("user","2") ;
        Get.offNamed(AppRoute.mainScreen);
        } else {
          Get.defaultDialog(
              title: "32".tr,
              middleText: "35".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }


  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
