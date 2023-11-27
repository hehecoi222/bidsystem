import 'package:bidsystem/pages/home/layout.dart';
import 'package:bidsystem/pages/item/layout.dart';
import 'package:bidsystem/pages/listall/layout.dart';
import 'package:bidsystem/pages/sign/layout.dart';
import 'package:bidsystem/pages/user/layout.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:flutter/material.dart';

Route<Object?> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return _getPageRoute(const HomePage(), settings);
    case ItemPageDefaultRoute:
      return _getPageRoute(const ItemPage(), settings);
    case UserPageDefaultRoute:
      return _getPageRoute(const UserInfoPage(), settings);
    case SignInPageRoute:
      return _getPageRoute(
          const SignLayout(
            signIn: true,
          ),
          settings);
    case SignUpPageRoute:
      return _getPageRoute(
          const SignLayout(
            signIn: false,
          ),
          settings);
      case BrowsePageRoute:
        return _getPageRoute(ListAll(), settings);
    default:
      if (settings.name!.startsWith(ItemPagePrefix)) {
        final subRoute = settings.name?.substring(ItemPagePrefix.length);
        final id = int.tryParse(subRoute!);
        return _getPageRoute(
            ItemPage(
              auctionId: id,
            ),
            settings);
      }

      if (settings.name!.startsWith(UserPagePrefix)) {
        final subRoute = settings.name?.substring(ItemPagePrefix.length);
        return _getPageRoute(const UserInfoPage(), settings);
      }
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => child, settings: settings);
}
