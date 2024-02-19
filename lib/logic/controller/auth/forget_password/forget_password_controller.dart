import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/data/datasource/remote/auth/forget_password/check_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest statusRequest=StatusRequest.none;

  late TextEditingController email;

  @override
  checkEmail() async  {
    if (formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkEmailData.postData(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode , arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(title: "32".tr , middleText: "33".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}