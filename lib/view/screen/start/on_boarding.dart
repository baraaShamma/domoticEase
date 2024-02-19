import 'package:domotic_ease/logic/controller/start/onboarding_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/view/widget/on_boarding/custom_slider.dart';
import 'package:domotic_ease/view/widget/on_boarding/custombutton.dart';
import 'package:domotic_ease/view/widget/on_boarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImplement());
    return Scaffold(
        backgroundColor: Get.isDarkMode
            ? AppColor.backgroundColorDark
            : AppColor.backgroundColorLight,
        body: const SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: CustomSlider(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      DotController(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButton()
                    ],
                  ))
            ],
          ),
        ));
  }
}
