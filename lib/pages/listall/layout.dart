import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:flutter/material.dart';

import '../../widgets/cutom_text.dart';

class ListAll extends StatelessWidget {
  const ListAll({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomText(
            text: "My Auction",
            textStyle: Theme.of(context).textTheme.displayMedium,
            fontWeight: FontWeight.bold,
          )),
      SizedBox(height: 25,),
      GridListAuction(),
    ],);
  }
}
