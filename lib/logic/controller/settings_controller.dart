import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  goToPageSettingWifi() {
    Get.toNamed("wifiScreen");
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.loginScreen);
  }
}
