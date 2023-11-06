import 'package:bidsystem/constants/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  static var _isCustom = false;
  static get isCustom => _isCustom;
  static final _darkTheme = false.obs;
  static get isDarkTheme => _darkTheme;

  static void changeThemeMode() {_darkTheme.value = true; _isCustom = true;}
  static get colorScheme  => _darkTheme.value ? lightColorScheme : darkColorScheme;
}