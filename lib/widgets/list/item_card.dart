import 'package:flutter/material.dart';

class ShoppingItemCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String description;
  final double price;
  final VoidCallback onPressed;
  final VoidCallback onAddToCart;

  const ShoppingItemCard({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.description,
    required this.price,
    required this.onPressed, required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child:
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(imageURL,
                  height: double.infinity, width: double.infinity, fit: BoxFit.cover),
            ),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text(description, style: TextStyle(fontSize: 14.0)),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: onAddToCart,
                        child: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Theme
                                .of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            backgroundColor:
                            Theme
                                .of(context)
                                .colorScheme
                                .primaryContainer),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
