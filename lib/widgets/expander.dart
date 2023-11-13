import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandMenu extends StatelessWidget {
  const ExpandMenu({super.key, required this.contents, required this.builder});

  final List<Widget> contents;
  final MenuAnchorChildBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
          menuChildren: [...contents],
          builder: builder,
        );
  }
}

class SimpleMenuItem extends StatelessWidget {
  const SimpleMenuItem(
      {super.key, this.icon, required this.value, required this.onPressed});

  final Icon? icon;
  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      child: Container( child: Row(
        children: [
          if (icon != null) icon as Widget,
          CustomText(
            textStyle: Theme.of(context).textTheme.labelMedium,
            fontWeight: FontWeight.w600,
            text: value,
          )
        ],
      ), padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),),
      onPressed: onPressed,
    );
  }
}
