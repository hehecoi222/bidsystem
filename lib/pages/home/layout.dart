import 'package:bidsystem/pages/home/widgets/board.dart';
import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:bidsystem/widgets/list/listview_auction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
