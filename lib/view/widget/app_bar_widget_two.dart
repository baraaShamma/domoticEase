import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/image_assets.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppBarWidgetTwo extends StatelessWidget {
  final Widget widget;
  final String title;

  const AppBarWidgetTwo({super.key, required this.widget, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Theme.of(context).primaryColor,
                statusBarIconBrightness: Brightness.light)
            : SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Theme.of(context).primaryColor,
                statusBarIconBrightness: Brightness.dark),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title),
      ),
      body: SafeArea(
        child: widget,
      ),
    );
  }
}
