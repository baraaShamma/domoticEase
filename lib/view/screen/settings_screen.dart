import 'package:domotic_ease/core/constant/theme_controller.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/settings_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget.dart';
import 'package:domotic_ease/view/widget/home/devices/animated_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    ThemeController themeController = Get.put(ThemeController());
    return AppBarWidget(
      title: "45".tr,
      widget: Column(children: [
        Card(
          color: Theme.of(context).cardColor,
          child: Container(
            height: AppSizeH.s70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: () {},
              trailing: Icon(Icons.help_outline_rounded),
              title: Text("36".tr),
            ),
          ),
        ),
        Card(
          color: Theme.of(context).cardColor,
          child: Container(
            height: AppSizeH.s70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: () {
                controller.goToPageSettingWifi();
              },
              trailing: Icon(Icons.wifi),
              title: Text("42".tr),
            ),
          ),
        ),
        Card(
          color: Theme.of(context).cardColor,
          child: Container(
            height: AppSizeH.s70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: () {},
              trailing: Icon(Icons.phone_callback_outlined),
              title: Text("37".tr),
            ),
          ),
        ),
        GetBuilder<ThemeController>(
            builder: (controller) => Card(
                  color: Theme.of(context).cardColor,
                  child: Container(
                    height: AppSizeH.s70,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      onTap: () {
                        themeController.changesTheme();
                      },
                      trailing: AnimatedSwitch(
                          isToggled: themeController.isDarkModes, onTap: () {}),
                      title: Text("43".tr),
                    ),
                  ),
                )),
        Card(
          color: Theme.of(context).cardColor,
          child: Container(
            height: AppSizeH.s70,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: () {
                controller.logout();
              },
              title: Text("38".tr),
              trailing: Icon(Icons.exit_to_app),
            ),
          ),
        ),
      ]),
    );
  }
}
