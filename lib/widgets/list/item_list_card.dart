import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.description,
      required this.price,
      required this.onPressed,
      required this.onAddToCart});

  final String imageURL;
  final String title;
  final String description;
  final double price;
  final VoidCallback onPressed;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Row(children: [
          ListTile(
              title: Text('Card Title'),
              subtitle: Text('Card Subtitle'),
              dense: true,
              visualDensity: VisualDensity(vertical: 3),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageURL,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: ElevatedButton(
                onPressed: onAddToCart,
                child: Text('Add to Cart'),
              )),
        ]));
  }
}
