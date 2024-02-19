import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/start/onboarding_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImplement> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                  onBoardingList[i].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: AppSizeSp.s22, color: AppColor.black),
                ),),
                 SizedBox(
                  height: AppSizeH.s10,
                ),
                Expanded(
                  flex: 3,
                  child:    Image.asset(
                  onBoardingList[i].image!,
                  width: Get.width,
                  height: Get.width/1.8,
                  fit: BoxFit.fill,
                ),),

                 SizedBox(
                  height: AppSizeH.s20,
                ),
               Expanded(
                 flex: 2,
                 child:  Container(
                   width: double.infinity,
                   alignment: Alignment.center,
                   child: Text(
                     onBoardingList[i].body!,
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         color: AppColor.grey,
                         fontWeight: FontWeight.bold,
                         fontSize: AppSizeSp.s15),
                   )),)
              ],
            ));
  }
}
