import 'package:bidsystem/pages/item/widgets/image_carousel.dart';
import 'package:bidsystem/pages/item/widgets/info_card.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final int? auctionId;

  const ItemPage({super.key, this.itemId, this.auctionId});

  final String? itemId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Container(
            padding: EdgeInsets.all(20),
            height: 600,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ItemImageCarousel(
                        imageURLs: [1, 2, 3, 4]
                            .map(
                              (e) =>
                                  'https://picsum.photos/800/60' + e.toString(),
                            )
                            .toList()),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    child: InfoItem(auctionId: auctionId,),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
