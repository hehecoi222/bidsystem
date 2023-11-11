import 'package:bidsystem/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: localNavigator(),);
  }
}
