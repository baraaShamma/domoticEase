import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedSwitch extends StatelessWidget {
  final bool isToggled;
  final void Function() onTap;

  const AnimatedSwitch({
    Key? key,
    required this.isToggled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Theme.of(context).cardColor,
            )),
        child: Stack(
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                height: 30,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  // color: Colors.red,
                ),
              ),
              secondChild: Container(
                height: 30,
                width: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  // color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              crossFadeState: isToggled
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(
                milliseconds: 200,
              ),
            ),
            AnimatedAlign(
              duration: Duration(
                milliseconds: 300,
              ),
              alignment:
                  isToggled ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                height: 42 * 0.5,
                width: 42 * 0.5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isToggled
                        ? Get.isDarkMode
                            ? Colors.green
                            : Colors.green
                        : Get.isDarkMode
                            ? Colors.white
                            : Colors.deepPurpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
