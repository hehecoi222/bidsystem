import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class TextSubButton extends StatelessWidget {
  const TextSubButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: CustomText(text: "Sign in", color: Theme.of(context).colorScheme.onSurface,));
  }
}
