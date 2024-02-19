import 'package:domotic_ease/core/services/services.dart';
import 'package:get/get.dart';

class PersonalController extends GetxController {
  MyServices myServices = Get.find();

  goToPageSecondaryUsers() {
    Get.toNamed("secondaryUsers");
  }


}
