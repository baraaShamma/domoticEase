import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class WifiController extends GetxController {
  late StatusRequest statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController ssidController;

  late TextEditingController passwordController;

  Future connectToESP32() async {
    var formData = formState.currentState;
    String ssid = ssidController.text.trim();
    String password = passwordController.text.trim();
    if (formData!.validate()) {
      // statusRequest = StatusRequest.loading;
      var response = await http.get(
        Uri.parse('http://192.168.5.33:82/?ssid=$ssid&password=$password'),
      );
      if (response.statusCode == 200) {
        print('Successfully sent data to ESP32');
        print('Response from ESP32: ${response.body}');
      } else {
        print('Failed to send data to ESP32');
      }
      update();
    }

    // print(response);
    // statusRequest = handlingData(response);
  }

  @override
  void onInit() {
    ssidController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    ssidController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
