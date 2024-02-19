import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/data/model/device_model.dart';
import 'package:domotic_ease/data/model/rooms_model.dart';
import 'package:domotic_ease/logic/controller/home_controller.dart';
import 'package:domotic_ease/view/widget/home/devices/smart_device.dart';
import 'package:domotic_ease/view/widget/home/rooms/room_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicesWidget extends GetView<HomeControllerImp> {
  const DevicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.devices.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.9, crossAxisSpacing: 5),
      itemBuilder: (BuildContext context, index) {
        return Devices(
          deviceModel: controller.devices[index],
        );
      },
    );
  }
}

class Devices extends StatelessWidget {
  final DeviceModel deviceModel;

  const Devices({Key? key, required this.deviceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SmartDevice(
        state: deviceModel.state == "0" ? true : false,
        color:Theme.of(context).primaryColor,
        title: deviceModel.deviceName,
        imageUrl: deviceModel.state == "0"
            ? 'assets/images/on.png'
            : 'assets/images/off.png',
        onTap: () {
          if (deviceModel.state == "1") {
            controller.updateDeviceState(deviceModel.deviceId.toString(), "0");
            controller.sendMessage(deviceModel.espHome.idEsp,
                deviceModel.pinNumberOutput.toString(), "0");
          } else {
            controller.updateDeviceState(deviceModel.deviceId.toString(), "1");
            controller.sendMessage(deviceModel.espHome.idEsp,
                deviceModel.pinNumberOutput.toString(), "1");
          }
        },
      ),
    );
  }
}
