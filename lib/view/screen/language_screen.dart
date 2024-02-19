// import 'dart:ui';
//
// import 'package:domotic_ease/core/constant/app_route.dart';
// import 'package:domotic_ease/core/localization/change_language_controller.dart';
// import 'package:domotic_ease/view/widget/language/buttom_lang_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class LanguageScreen extends GetView<ChangeLanguageController> {
//   const LanguageScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("1".tr, style: Theme.of(context).textTheme.headline1),
//               const SizedBox(height: 20),
//               ButtonLangWidget(
//                   textButton: "Ar",
//                   onPressed: () {
//                     controller.changeLang("ar");
//                     Get.toNamed(AppRoute.onBoarding) ;
//                   }),
//               ButtonLangWidget(
//                   textButton: "En",
//                   onPressed: () {
//                     controller.changeLang("en");
//                     Get.toNamed(AppRoute.onBoarding) ;
//                   }),
//             ],
//           )),
//     );
//   }
// }