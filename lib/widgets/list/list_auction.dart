import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class GridListAuction extends StatelessWidget {
  const GridListAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(16.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: [
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/301',
          title: 'Product Title 1',
          description: 'Product description 1',
          price: 19.99,
          onAddToCart: () {
            print('Product card tapped 1');
          },
          onPressed: onPressed
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/300',
          title: 'Product Title 1',
          description: 'Product description 1',
          price: 19.99,
          onAddToCart: () {
            print('Product card tapped 1');
          },
          onPressed: onPressed
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/302',
          title: 'Product Title 1',
          description: 'Product description 1',
          price: 19.99,
          onAddToCart: () {
            print('Product card tapped 1');
          },
          onPressed: onPressed
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/308',
          title: 'Product Title 1',
          description: 'Product description 1',
          price: 19.99,
          onAddToCart: () {
            print('Product card tapped 1');
          },
          onPressed: onPressed
        ),
      ],
    );

  }

  onPressed() {
    navigationController.navigateTo(ItemPageDefaultRoute);
  }
}
