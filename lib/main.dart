import 'package:bidsystem/constants/color_scheme.dart';
import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:bidsystem/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          }),
          useMaterial3: true,
          colorScheme: lightColorScheme),
      darkTheme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          }),
          scaffoldBackgroundColor: ThemeController.colorScheme.surface,
          primaryColor: ThemeController.colorScheme.primary,
          useMaterial3: true,
          colorScheme: darkColorScheme),
      home: SiteLayut(),
    );
  }
}
