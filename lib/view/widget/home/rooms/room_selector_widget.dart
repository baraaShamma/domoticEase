import 'package:domotic_ease/core/constant/colors.dart';
import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RoomSelector extends StatelessWidget {
  final String roomName;
  final String roomImageURL;
  final bool isSelected;

  const RoomSelector({
    Key? key,
    required this.roomName,
    required this.roomImageURL,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected
                  ? Get.isDarkMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor
                  : Get.isDarkMode
                      ? AppColor.white
                      : Colors.white,
              border: Border.all(
                color: Get.isDarkMode
                    ? AppColor.primaryColorLight
                    : AppColor.primaryColorDark,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppSizeR.s18),
            ),
            child: SvgPicture.asset(roomImageURL,
                colorFilter: ColorFilter.mode(
                    isSelected
                        ? Get.isDarkMode
                            ? AppColor.white
                            : AppColor.black
                        : Get.isDarkMode
                            ? AppColor.black
                            : AppColor.black,
                    BlendMode.srcIn)),
          ),
        ),
        Text(
          roomName,
          style: TextStyle(fontSize: AppSizeSp.s15),
        ),
      ],
    );
  }
}
