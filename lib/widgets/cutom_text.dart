import 'package:bidsystem/constants/color_scheme.dart';
import 'package:bidsystem/controllers/dark_theme_controller.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
        this.text = "",
        this.size = 16,
        this.color = const Color(0xFF191C1D),
        this.fontWeight = FontWeight.normal})
      : super(key: key);
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight));
  }
}
