import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  const CTAButton({super.key, this.onPressed, this.text = "Sign up now", this.icon});

  final VoidCallback? onPressed;
  final String text;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Row(
       children: [
         CustomText(
           text: text,
           color: Theme.of(context).colorScheme.onPrimaryContainer,
           fontWeight: FontWeight.bold,
           size: 14,
         ),
         icon != null ? SizedBox(width: 5,) : Container(),
         icon ?? Container(),
       ],
      )
    );
  }
}
