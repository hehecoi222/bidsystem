import 'package:bidsystem/pages/home/layout.dart';
import 'package:bidsystem/pages/item/layout.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:flutter/material.dart';

Route<Object?> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return _getPageRoute(const HomepPage(), settings);
    case ItemPageDefaultRoute:
      return _getPageRoute(const ItemPage(), settings);
    default:
      if (settings.name!.startsWith(ItemPagePrefix)) {
        final subRoute = settings.name?.substring(ItemPagePrefix.length);
        return _getPageRoute(const ItemPage(), settings);
      }
      return _getPageRoute(const HomepPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => child, settings: settings);
}
