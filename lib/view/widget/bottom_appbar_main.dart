import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarMain extends StatelessWidget {
  const BottomAppBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainControllerImp>(
        builder: (controller) => ConvexAppBar(
          backgroundColor:Theme.of(context).primaryColor,
          style:TabStyle.reactCircle,
          // initialActiveIndex:1,
          height: AppSizeH.s56,
          top: -20,
          curveSize: 100,
          items: [

                ...List.generate(controller.listPage.length, ((index) {
                  return TabItem(
                    icon: controller.iconBottomAppbar[index],
                  );
                })),
              ],
              onTap: (int i) => controller.changePage(i),
            )
        // BottomAppBar(
        // height: AppSizeH.s70,
        // padding: EdgeInsets.symmetric(horizontal: AppSizeSp.s5),
        // child: Row(
        //   children: [
        //     ...List.generate(
        //       controller.listPage.length,
        //       ((index) {
        //         return Expanded(
        //           child: ButtonAppBar(
        //               textButton: controller.titleBottomAppbar[index],
        //               iconData: controller.iconBottomAppbar[index],
        //               onPressed: () {
        //                 controller.changePage(index);
        //               },
        //               active: controller.currentPage == index ? true : false),
        //         );
        //       }),
        //     ),
        //   ],
        // )),
        );
  }
}
