import 'package:flutter/material.dart';
import 'package:get/get.dart';

void createSnackbar(BuildContext context, String message) {
  Get.closeAllSnackbars();
  Get.snackbar("Caution", message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      colorText: Theme.of(context).colorScheme.onErrorContainer);
}