import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      this.text = "",
      this.size,
      this.color,
      this.fontWeight,
      this.textStyle})
      : super(key: key);
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyle?.copyWith(
                color: color, fontSize: size, fontWeight: fontWeight) ??
            TextStyle(
                fontSize: size ?? 12,
                color: color ?? Theme.of(context).colorScheme.onSurface,
                fontWeight: fontWeight ?? FontWeight.normal));
  }
}
