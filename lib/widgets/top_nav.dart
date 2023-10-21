import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: Icon(
      Icons.menu,
      color: Colors.white,
    ), // Logo instead
    title: Row(
      children: [
        // Action button and etc
      ],
    ),
    backgroundColor: Colors.white, // TODO: define color theme
    iconTheme: IconThemeData(color: Colors.black), // TODO: define color theme
  );
}
