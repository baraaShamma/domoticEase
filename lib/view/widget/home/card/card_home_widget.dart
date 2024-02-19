import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/logic/controller/home_controller.dart';
import 'package:domotic_ease/view/widget/home/card/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHomeWidget extends GetView<HomeControllerImp> {
  final String username;

  const CardHomeWidget({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Container(
      color: Theme.of(context).primaryColor,
      width: size.width,
      height: AppSizeH.s150,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: AppSizeW.s22,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${'41'.tr} $username",
                style: TextStyle(
                    fontSize: AppSizeSp.s20,
                    fontWeight: FontWeight.w600,
                    height: AppSizeH.s2,
                    color: Get.isDarkMode ? AppColor.white : AppColor.black),

                // TextStyle (color: Theme.of(context).primaryColorDark,),
              ),
            ),
            Expanded(

              child: UserAvatar(
                radius: AppSizeR.s100,
              ),
            ),
            SizedBox(
              width: AppSizeW.s22,
            ),
          ],
        ),
      ),
    );
  }
}
