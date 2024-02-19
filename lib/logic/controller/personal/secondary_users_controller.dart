import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/function/handling_data_controller.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:domotic_ease/data/datasource/remote/personal_data.dart';
import 'package:get/get.dart';

class SecondaryUsersController extends GetxController {
  MyServices myServices = Get.find();
  PersonalData personalData = PersonalData(Get.find());
  int? users_id;

  List secondaryUsers = [];
  late StatusRequest statusRequest;

  getSecondaryUsers() async {
    print("===========");
    secondaryUsers.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await personalData.getSecondaryUsersDetails(users_id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        secondaryUsers.addAll(response['data']);
        if (secondaryUsers.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverFailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    print(secondaryUsers);
    update();
  }

  @override
  void onInit() {
    users_id = myServices.sharedPreferences.getInt("users_id");
    getSecondaryUsers();
  }
}
