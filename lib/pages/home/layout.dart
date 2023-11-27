import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/pages/home/widgets/board.dart';
import 'package:bidsystem/pages/home/widgets/text_sub_button.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:flutter/material.dart';

import '../../widgets/cutom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeBoard(),
        SizedBox(
          height: 25,
        ),
        Padding(
            padding: EdgeInsets.only(left: 16),
            child: CustomText(
              text: "Highlight",
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontWeight: FontWeight.bold,
            )),
        GridListAuction(
          isHidden: true,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(child: Container()),
            TextSubButton(
              text: CustomText(
                text: "View more",
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
              icon: Icon(
                Icons.arrow_forward,
                size: 20,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                navigationController.navigateTo(BrowsePageRoute);
              },
            )
          ],
        )
      ],
    );
  }
}
