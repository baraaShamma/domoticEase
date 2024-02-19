import 'package:domotic_ease/core/class/handling_data_request.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/core/function/alert_exit_app.dart';
import 'package:domotic_ease/core/function/valid_input.dart';
import 'package:domotic_ease/logic/controller/settings/wifi_controller.dart';
import 'package:domotic_ease/logic/controller/settings_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiScreen extends StatelessWidget {
  const WifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WifiController());
    return AppBarWidgetTwo(
      title: "42".tr,
      widget: GetBuilder<WifiController>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(
              vertical: AppSizeH.s5, horizontal: AppSizeW.s10),
          child: Form(
            key: controller.formState,
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  controller: controller.ssidController,
                  decoration: InputDecoration(labelText: 'WiFi SSID'),
                  validator: (val) {
                    return validInput(val!, 2, 10, "SSID");
                  },
                ),
                SizedBox(height: AppSizeH.s20),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'WiFi Password'),
                  validator: (val) {
                    return validInput(val!, 5, 20, "SSID");
                  },
                ),
                SizedBox(height: AppSizeH.s40),
                ElevatedButton(
                  onPressed: () {
                    controller.connectToESP32();
                  },
                  child: Text('Send to ESP32'),
                ),
                SizedBox(height: AppSizeH.s10),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
