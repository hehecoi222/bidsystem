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
          onPressed: () {
            print('Product card tapped 1');
          },
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/300',
          title: 'Product Title 2',
          description: 'Product description 2',
          price: 24.99,
          onPressed: () {
            print('Product card tapped 2');
          },
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/302',
          title: 'Product Title 3',
          description: 'Product description 3',
          price: 14.99,
          onPressed: () {
            print('Product card tapped 3');
          },
        ),
        ShoppingItemCard(
          imageURL: 'https://picsum.photos/200/303',
          title: 'Product Title 4',
          description: 'Product description 4',
          price: 39.99,
          onPressed: () {
            print('Product card tapped 4');
          },
        ),
      ],
    );

  }
}
