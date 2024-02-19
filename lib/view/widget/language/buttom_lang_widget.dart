import 'package:domotic_ease/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLangWidget extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const ButtonLangWidget({Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textButton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}