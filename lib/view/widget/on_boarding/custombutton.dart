import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/start/onboarding_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<OnBoardingControllerImplement> {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: AppSizeH.s30),
      height: AppSizeH.s50,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s22),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: AppSizeW.s22, vertical: AppSizeH.s1),
          textColor: AppColor.white,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            controller.nextPage();
          },
          child: Text(
            "8".tr,
            style: TextStyle(fontSize: AppSizeSp.s16,color: AppColor.black),
          )),
    );
  }
}
