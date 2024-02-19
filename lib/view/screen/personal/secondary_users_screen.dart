import 'package:domotic_ease/logic/controller/personal/secondary_users_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryUsersScreen extends StatelessWidget {
  const SecondaryUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SecondaryUsersController controller = Get.put(SecondaryUsersController());

    return AppBarWidgetTwo(
      title: "46".tr,
      widget: Container(),
    );
  }
}
