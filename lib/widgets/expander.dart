import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        child: Row(
          children: [
            if (icon != null) icon as Widget,
            CustomText(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontWeight: FontWeight.w600,
              text: value,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onPressed,
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final VoidCallback onPressed;
  final Widget subIcon;
  final VoidCallback onSubPressed;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.onPressed, required this.subIcon, required this.onSubPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
        child: Container(
      width: 400,
      height: 80,
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(
                      "images/${this.imageAsset}",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12,),
            Column(children: [
              IconButton(onPressed: onSubPressed, icon: subIcon),
            ],)
          ],
        ),
      ),
    ));
  }
}
