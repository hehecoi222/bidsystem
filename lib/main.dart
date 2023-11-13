import 'package:bidsystem/constants/color_scheme.dart';
import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/controllers/auction_controller.dart';
import 'package:bidsystem/controllers/bid_controller.dart';
import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:bidsystem/controllers/item_controller.dart';
import 'package:bidsystem/controllers/navigation_controller.dart' as navigation_controller;
import 'package:bidsystem/controllers/user_controller.dart';
import 'package:bidsystem/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(navigation_controller.NavigationController());
  Get.put(AuctionController());
  Get.put(UserController());
  Get.put(BidController());
  Get.put(ItemController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      themeMode: ThemeController.isCustom
          ? ThemeController.isDarkTheme
              ? ThemeMode.dark
              : ThemeMode.light
          : ThemeMode.system,
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          }),
          useMaterial3: true,
          colorScheme: lightColorScheme),
      darkTheme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          }),
          scaffoldBackgroundColor: ThemeController.colorScheme.surface,
          primaryColor: ThemeController.colorScheme.primary,
          useMaterial3: true,
          colorScheme: darkColorScheme),
      home: WillPopScope(
          onWillPop: () {
            navigationController.goBack();
            return Future(() => true);
          },
          child: SiteLayut()),
      // initialRoute: "/home",
      // getPages: [
      //   GetPage(name: "/home", page: () => HomepPage()),
      //   GetPage(name: "/item", page: () => ItemPage()),
      // ],
    );
  }
}
