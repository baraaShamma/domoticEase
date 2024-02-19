import 'package:domotic_ease/logic/controller/auth/success_reset_password_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/view/widget/auth/button-auth-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode?AppColor.backgroundColorDark:AppColor.backgroundColorLight,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
           Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Theme.of(context).primaryColor,
          )),
          Text("25".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("24".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ButtonAuthWidget(
                text: "21".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
