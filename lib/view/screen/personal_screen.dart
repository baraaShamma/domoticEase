import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/personal_controller.dart';
import 'package:domotic_ease/view/widget/app_bar_widget.dart';
import 'package:domotic_ease/view/widget/personal/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalController controller = Get.put(PersonalController());

    return AppBarWidget(
      title: "44".tr,
      widget: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          CardWidget(
            title: "46".tr,
            subTitle: "47".tr,
            icon: Icons.person_2_sharp,
            onTap: () {
              controller.goToPageSecondaryUsers();
            },
          ),
          CardWidget(
            title: "48".tr,
            subTitle: "49".tr,
            icon: Icons.password,
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
