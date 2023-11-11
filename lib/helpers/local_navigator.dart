import 'package:bidsystem/routing/routes.dart';
import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import '../routing/router.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: HomePageRoute,
  onGenerateRoute: generateRoute,
);