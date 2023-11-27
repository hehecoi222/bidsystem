import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/controllers/auction_controller.dart';
import 'package:bidsystem/pages/item/widgets/dialog.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_card.dart';

class GridListAuction extends GetView<AuctionController> {
  const GridListAuction({super.key, this.isHidden = false});

  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(16.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: auctionController.listAuctionsPreview
                  .map(
                    (element) => ShoppingItemCard(
                        imageURL: 'item' + element.id.value.toString(),
                        title: element.item.value.name.value,
                        description: element.item.value.description.value,
                        price: element.currentPrice.value.toDouble(),
                        onAddToCart: () {
                          auctionController.getAuction(element.id.value);
                          showDialog(context: context, builder: CustomDialog().build);
                        },
                        onPressed: () {onPressed(element.id.value);}),
                  )
                  .toList().sublist(0, isHidden ? 9 : null),
            ),
        onLoading: Container(
            height: 500,
            child: Center(
              child: CircularProgressIndicator(),
            )));
  }

  onPressed(int id) {
    auctionController.getAuction(id);
    navigationController.navigateTo(ItemPagePrefix + id.toString());
  }
}
