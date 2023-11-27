import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/image_fallback.dart';
import 'package:bidsystem/helpers/responsiveness.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:bidsystem/widgets/expander.dart';
import 'package:bidsystem/widgets/user_short_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      child: Image.asset("images/icon.png",
                          height: 32, width: 32, fit: BoxFit.cover,
                          errorBuilder: imageObject,)),
                ),
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                key?.currentState?.openDrawer();
              }), // Logo instead
      title: Obx(
        () => Row(
          children: [
            // Action button and etc
            InkWell(
              onTap: () {
                navigationController.navigateTo(HomePageRoute);
              },
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
                        border: Border.all(
                            color: Theme.of(context).colorScheme.error),
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
            userController.myState.id.value < 0
                ? Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            navigationController.navigateTo(SignInPageRoute);
                          },
                          child: CustomText(
                            text: "Sign in",
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      FilledButton(
                          onPressed: () {
                            navigationController.navigateTo(SignUpPageRoute);
                          },
                          child: CustomText(
                            text: "Sign up",
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )
                : ExpandMenu(
                    contents: [
                        SimpleMenuItem(
                            value: "My home",
                            onPressed: () {
                              navigationController
                                  .navigateTo(UserPageDefaultRoute);
                            }),
                        SimpleMenuItem(
                            value: "Sign out",
                            onPressed: () {
                              userController.logOut();
                            }),
                      ],
                    builder: (builder, controller, child) {
                      return UserShortRow(
                        userName: userController.myState.username.value,
                        onPressed: () {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                      );
                    }),
          ],
        ),
      ));
}
