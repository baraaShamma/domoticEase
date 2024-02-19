import 'package:domotic_ease/core/class/handling_data_view.dart';
import 'package:domotic_ease/logic/controller/personal/secondary_users_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget_two.dart';
import 'package:domotic_ease/view/widget/personal/secondary_users/view_secondary_users_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondaryUsersScreen extends StatelessWidget {
  const SecondaryUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SecondaryUsersController controller = Get.put(SecondaryUsersController());
    return AppBarWidgetTwo(
      title: "46".tr,
      widget: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text("add user"),
            ),
          ),
          Expanded(
              flex: 4,
              child: GetBuilder<SecondaryUsersController>(
                builder: (_) => HandlingDataView(
                  onTap: () {
                    controller.getSecondaryUsers();
                  },
                  statusRequest: controller.statusRequest,
                  widget: ViewSecondaryUsersWidget(),
                ),
              ))
        ],
      ),
    );
  }
}
