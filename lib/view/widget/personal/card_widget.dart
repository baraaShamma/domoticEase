import 'package:domotic_ease/core/constant/values_manager.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function() onTap;

  const CardWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizeH.s100,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: ListTile(
          onTap: onTap,
          trailing: Icon(icon),
          title: Text(title, style: Theme.of(context).textTheme.titleSmall),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
