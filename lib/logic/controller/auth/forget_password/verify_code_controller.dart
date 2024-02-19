import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';
import 'package:domotic_ease/data/datasource/remote/auth/forget_password/verify_code_reset.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(verifyCode );

}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;
  VerifyCodeResetPasswordData verifyCodeResetPasswordData = VerifyCodeResetPasswordData(Get.find());
  StatusRequest ?statusRequest;
  @override
  checkCode(verifyCode) async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetPasswordData.postData(
        email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        Get.offNamed(AppRoute.resetPassword,arguments: {
          "email":email
        });


      } else {
        Get.defaultDialog(
            title: "32".tr,
            middleText: "34".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  void onInit() {
    email = Get.arguments['email'];

  super.onInit();
  }


}