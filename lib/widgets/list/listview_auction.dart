import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/list/item_list_card.dart';
import 'package:flutter/material.dart';

class ListViewAuction extends StatelessWidget {
  const ListViewAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        ItemListTile(
            imageURL: 'https://picsum.photos/200/301',
            title: 'Product Title 1',
            description: 'Product description 1',
            price: 19.99,
            onAddToCart: () {
              print('Product card tapped 1');
            },
            onPressed: onPressed),
        ItemListTile(
            imageURL: 'https://picsum.photos/200/300',
            title: 'Product Title 1',
            description: 'Product description 1',
            price: 19.99,
            onAddToCart: () {
              print('Product card tapped 1');
            },
            onPressed: onPressed),
        ItemListTile(
            imageURL: 'https://picsum.photos/200/302',
            title: 'Product Title 1',
            description: 'Product description 1',
            price: 19.99,
            onAddToCart: () {
              print('Product card tapped 1');
            },
            onPressed: onPressed),
        ItemListTile(
            imageURL: 'https://picsum.photos/200/308',
            title: 'Product Title 1',
            description: 'Product description 1',
            price: 19.99,
            onAddToCart: () {
              print('Product card tapped 1');
            },
            onPressed: onPressed),
      ],);
  }

  onPressed() {
    navigationController.navigateTo(ItemPagePrefix + 'Product');
    // Get.toNamed("/item");
  }
}
