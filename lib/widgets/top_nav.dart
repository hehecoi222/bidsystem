import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/responsiveness.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              InkWell(
                onTap: () {
                  navigationController.navigateTo(HomePageRoute);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Image.network("https://picsum.photos/200/301",
                      height: 32, width: 32, fit: BoxFit.cover),
                ),
              ),
            ],
          )
        : IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {
              key?.currentState?.openDrawer();
            }), // Logo instead
    title: Row(
      children: [
        // Action button and etc
        InkWell(
          onTap: () {navigationController.navigateTo(HomePageRoute); },
          child: Visibility(
              child: CustomText(
            text: "Bid System",
            color: Theme.of(context).colorScheme.primary,
            size: 20,
            fontWeight: FontWeight.bold,
          )),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_bag_outlined),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            Positioned(
              child: Container(
                width: 6,
                height: 6,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.error),
              ),
              top: 7,
              right: 7,
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Container(
          width: 1,
          height: 22,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        SizedBox(
          width: 24,
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {},
                child: CustomText(
                  text: "Sign in",
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: 12,
            ),
            FilledButton(
                onPressed: () {},
                child: CustomText(
                    text: "Sign up",
                    color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,))
          ],
        )
      ],
    ),
  );
}
