import 'package:bidsystem/helpers/responsiveness.dart';
import 'package:bidsystem/widgets/large_screen.dart';
import 'package:bidsystem/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayut extends StatelessWidget {
  SiteLayut({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(), // TODO: consider to implement a drawer or not
      body: ResponsiveWidget(largeScreen: LargeScreen(),
      ),
    );
  }
}
