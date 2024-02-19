import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/image_assets.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class AppBarWidget extends StatelessWidget {
 final String title;
 final Widget widget;
  const AppBarWidget({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Get.isDarkMode
            ? SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Theme.of(context).primaryColor,
            statusBarIconBrightness: Brightness.light)
            : SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Theme.of(context).primaryColor,
            statusBarIconBrightness: Brightness.dark),
        child: SafeArea(
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: AppSizeH.s150,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: AppSizeW.s18),
                            child:Text(
                            title,
                              style: TextStyle(
                                  fontSize: AppSizeSp.s20,
                                  fontWeight: FontWeight.w600,
                                  height: AppSizeH.s2,
                                  color: Get.isDarkMode ? AppColor.white : AppColor.black),

                              // TextStyle (color: Theme.of(context).primaryColorDark,),
                            ),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: CircleAvatar(
                            minRadius: AppSizeR.s75,
                            backgroundColor: Colors.grey[100],
                            backgroundImage: AssetImage(AppImageAssets.logo),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: AppSizeH.s160,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppSizeW.s5),
                    child:widget,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
