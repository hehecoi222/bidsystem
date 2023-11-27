import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class TextSubButton extends StatelessWidget {
  const TextSubButton({super.key, this.onPressed, this.icon, this.text});

  final VoidCallback? onPressed;
  final Widget? icon;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            text ??
                CustomText(
                  text: "Sign in",
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
            if (icon != null) SizedBox(width: 6,),
            if (icon != null) icon!,
          ],
        ));
  }
}
