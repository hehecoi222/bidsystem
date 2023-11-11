import 'package:bidsystem/pages/home/widgets/board.dart';
import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:flutter/material.dart';

class HomepPage extends StatelessWidget {
  const HomepPage({super.key});

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
