import 'package:domotic_ease/core/class/handling_data_request.dart';
import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/core/function/valid_input.dart';
import 'package:domotic_ease/logic/controller/auth/forget_password/forget_password_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/view/widget/auth/button-auth-widget.dart';
import 'package:domotic_ease/view/widget/auth/text_body_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_form_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_title_auth_widget.dart';
import 'package:domotic_ease/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Get.isDarkMode?AppColor.backgroundColorDark:AppColor.backgroundColorLight,
          elevation: 0.0,
          title: Text('14'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizeH.s20, horizontal: AppSizeW.s20),
                      child: ListView(children: [
                        SizedBox(height: AppSizeH.s20),
                        TextTitleAuthWidget(text: "18".tr),
                        SizedBox(height: AppSizeH.s10),
                        TextBodyAuthWidget(text: "19".tr),
                        SizedBox(height: AppSizeH.s15),
                        TextFormAuthWidget(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 50, "email");
                          },
                          myController: controller.email,
                          hintText: "12".tr,
                          iconData: Icons.email_outlined,
                          labelText: "16".tr,
                        ),
                        ButtonAuthWidget(
                            text: "20".tr,
                            onPressed: () {
                              controller.checkEmail();
                            }),
                        SizedBox(height: AppSizeH.s10),
                      ]),
                    ),
                  ),
                )));
  }
}
