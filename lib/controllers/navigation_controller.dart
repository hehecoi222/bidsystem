import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<Object?> navigateTo(String routeName) {
    return navigationKey.currentState?.pushNamed(routeName) ?? Future(() => null);
  }

  goBack() => navigationKey.currentState?.pop();
}