import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  const CTAButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: CustomText(
        text: "Sign up now",
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
