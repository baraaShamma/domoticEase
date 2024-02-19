// import 'package:domotic_ease/core/constant/colors.dart';
// import 'package:domotic_ease/core/constant/values_manager.dart';
// import 'package:flutter/material.dart';
//
// class ButtonAppBar extends StatelessWidget {
//   final void Function()? onPressed;
//   final String textButton;
//   final IconData iconData;
//   final bool? active   ;
//   const ButtonAppBar(
//       {Key? key,
//         required this.textButton,
//         required this.iconData,
//         required this.onPressed,
//         required this.active})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPressed,
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         Expanded(
//           child: Icon(iconData,size: AppSizeW.s20,
//               color: active == true ? AppColor.primaryColor : AppColor.black),
//         ),
//       Expanded(child:   Text(textButton,
//           style: TextStyle(
//               color: active == true ? AppColor.primaryColor : AppColor.black,fontSize: AppSizeSp.s14)))
//       ]),
//     );
//   }
// }