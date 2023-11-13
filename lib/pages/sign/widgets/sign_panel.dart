import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignPanel extends StatelessWidget {
  const SignPanel({super.key, this.content});

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: content,
          )),
    );
  }
}

class SignForm extends StatelessWidget {
  const SignForm(
      {super.key,
      this.labelText,
      this.inputType,
      this.formatter,
      this.password,
      this.controller,
      this.autofillHints});

  final String? labelText;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatter;
  final bool? password;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: autofillHints,
      obscureText: password ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: inputType,
      inputFormatters: [
        ...?formatter,
      ],
      controller: controller,
    );
  }
}

class SignButton extends StatelessWidget {
  const SignButton({super.key, this.labelText = "", this.onPressed});

  final String labelText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: CustomText(
          textStyle: Theme.of(context).textTheme.labelMedium,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary,
          text: labelText,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 4.0));
  }
}
