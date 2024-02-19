import 'package:domotic_ease/core/class/handling_data_request.dart';
import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/function/valid_input.dart';
import 'package:domotic_ease/logic/controller/auth/forget_password/reset_password_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/view/widget/auth/button-auth-widget.dart';
import 'package:domotic_ease/view/widget/auth/text_body_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_form_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_title_auth_widget.dart';
import 'package:domotic_ease/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Get.isDarkMode?AppColor.backgroundColorDark:AppColor.backgroundColorLight,
          elevation: 0.0,
          title: Text('ResetPassword',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        TextTitleAuthWidget(text: "23".tr),
                        const SizedBox(height: 10),
                        TextBodyAuthWidget(text: "23".tr),
                        const SizedBox(height: 15),
                        TextFormAuthWidget(
                          isNumber: false,
                          valid: (val) {},
                          myController: controller.password,
                          hintText: "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "17".tr,
                        ),
                        TextFormAuthWidget(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          myController: controller.rePassword,
                          hintText: "Re" + " " + "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "17".tr,
                        ),
                        ButtonAuthWidget(
                            text: "22".tr,
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            }),
                        const SizedBox(height: 40),
                      ]),
                    ),
                  ),
                )));
  }
}
