import 'package:bidsystem/pages/home/widgets/board.dart';
import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeBoard(),
        GridListAuction(),
      ],
    );
  }
}