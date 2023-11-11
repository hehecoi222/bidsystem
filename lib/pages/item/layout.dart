import 'package:bidsystem/pages/item/widgets/image_carousel.dart';
import 'package:bidsystem/pages/item/widgets/info_card.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, this.itemId});

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
              children: [
                Expanded(
                  child: Padding(
                    child: ItemImageCarousel(imageURLs: [
                      'https://picsum.photos/800/600',
                    ]),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Padding(
                    child: InfoItem(),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  flex: 1,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ],
    );
  }
}
