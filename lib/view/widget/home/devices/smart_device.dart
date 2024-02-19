import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animated_switch.dart';

class SmartDevice extends StatelessWidget {
  // final controller = Get.put(HomeController());
  final Color color;
  final bool state;
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  SmartDevice({
    Key? key,
    required this.color,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.width * 0.414,
        width: Get.width * 0.4,
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: AppSizeH.s10,
                width: AppSizeW.s100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizeR.s20),
                    color: color.withOpacity(0.45)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: AppSizeH.s200,
                width: AppSizeW.s200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizeR.s18),
                  color: color,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: AppSizeH.s15,
                      left: AppSizeW.s10,
                      child: Image(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                        height: AppSizeH.s80,
                      ),
                    ),
                    Positioned(
                      top: AppSizeH.s40,
                      right: AppSizeW.s15,
                      child: AnimatedSwitch(isToggled: state, onTap: onTap),
                    ),
                    Positioned(
                      bottom: AppSizeH.s30,
                      left: AppSizeW.s20,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: AppSizeSp.s18, color: Get.isDarkMode?AppColor.white:AppColor.black),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
