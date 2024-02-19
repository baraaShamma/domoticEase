import 'package:domotic_ease/core/constant/app_route.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/logic/controller/main_controller.dart';
import 'package:domotic_ease/view/widget/bottom_appbar_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainControllerImp());
    return GetBuilder<MainControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: const BottomAppBarMain(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
