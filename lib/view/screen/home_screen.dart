import 'package:domotic_ease/core/class/handling_data_view.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/theme_controller.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/core/localization/translation_database.dart';
import 'package:domotic_ease/logic/controller/home_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget.dart';
import 'package:domotic_ease/view/widget/home/card/card_home_widget.dart';
import 'package:domotic_ease/view/widget/home/devices/animated_switch.dart';
import 'package:domotic_ease/view/widget/home/devices/devices_widget.dart';
import 'package:domotic_ease/view/widget/home/rooms/list_rooms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return AppBarWidget(
      title:
          "${"41".tr} ${translationDatabase(controller.usernameEn, controller.usernameAr)}",
      widget: GetBuilder<HomeControllerImp>(
        builder: (controller) => SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: HandlingDataView(
                    onTap: () {
                      controller.getRooms();
                    },
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      // mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListRoomsWidget(),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizeW.s25,
                                vertical: AppSizeH.s18),
                            child: ListView(
                              children: [
                                Text(
                                  "${"40".tr} ${controller.name_room}",
                                  style: TextStyle(
                                      fontSize: AppSizeSp.s25,
                                      color: Get.isDarkMode
                                          ? AppColor.white
                                          : AppColor.black),
                                ),
                                HandlingDataView(
                                    statusRequest:
                                        controller.statusRequestDevices,
                                    widget: DevicesWidget(),
                                    onTap: () {
                                      controller.getDevices();
                                    })
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
