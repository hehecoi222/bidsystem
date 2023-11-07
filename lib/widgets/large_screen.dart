import 'package:bidsystem/pages/item/widgets/image_carousel.dart';
import 'package:bidsystem/pages/item/widgets/info_card.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: 600,
            child: Row(
              children: [
                Expanded(
                  child: ItemImageCarousel(imageURLs: [
                    'https://picsum.photos/800/600',
                  ]),
                  flex: 1,
                ),
                Expanded(
                  child: InfoItem(),
                  flex: 1,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ],
    );
  }
}
