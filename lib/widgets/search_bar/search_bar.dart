import 'package:flutter/material.dart';

class SimpleSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback onPressed;

  const SimpleSearchBar({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 200,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onPressed,
              ),
            ),
          ),
        ));
  }
}
