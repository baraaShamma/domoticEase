import 'package:domotic_ease/core/class/handling_data_request.dart';
import 'package:domotic_ease/core/class/handling_data_view.dart';
import 'package:domotic_ease/core/class/status_request.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:domotic_ease/core/function/alert_exit_app.dart';
import 'package:domotic_ease/logic/controller/auth/login_controller.dart';
import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/function/valid_input.dart';
import 'package:domotic_ease/view/widget/auth/button-auth-widget.dart';
import 'package:domotic_ease/view/widget/auth/logo_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_body_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_form_auth_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_link_widget.dart';
import 'package:domotic_ease/view/widget/auth/text_title_auth_widget.dart';
import 'package:domotic_ease/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Get.isDarkMode?AppColor.backgroundColorDark:AppColor.backgroundColorLight,
            elevation: 0.0,
            title: Text(
              '9'.tr,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.grey,
                  ),
            )),
        body: PopScope(
          canPop: false,
          //When false, blocks the current route from being popped.
          onPopInvoked: (didPop) {
            alertExitApp();
          },
          // onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizeH.s5, horizontal: AppSizeW.s10),
                      child: Form(
                        key: controller.formState,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            const LogoAuthWidget(),
                            TextTitleAuthWidget(text: "10".tr),
                            SizedBox(height: AppSizeH.s20),
                            TextBodyAuthWidget(text: "11".tr),
                            SizedBox(height: AppSizeH.s40),
                            TextFormAuthWidget(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              myController: controller.email,
                              hintText: "12".tr,
                              iconData: Icons.alternate_email_outlined,
                              labelText: "16".tr,
                            ),
                            GetBuilder<LoginControllerImp>(
                                builder: (_) => TextFormAuthWidget(
                                      obscureText: controller.isShowPassword,
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      isNumber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, "password");
                                      },
                                      myController: controller.password,
                                      hintText: "13".tr,
                                      iconData: Icons.lock_outline_rounded,
                                      labelText: "17".tr,
                                    )),
                            SizedBox(height: AppSizeH.s40),
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "39".tr,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "14".tr,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            ButtonAuthWidget(
                                text: "15".tr,
                                onPressed: () {
                                  controller.login();
                                }),
                            SizedBox(height: AppSizeH.s10),
                          ]),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
