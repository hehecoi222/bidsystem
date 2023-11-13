import 'package:bidsystem/pages/sign/widgets/sign_in.dart';
import 'package:bidsystem/pages/sign/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class SignLayout extends StatelessWidget {
  const SignLayout({super.key, required this.signIn});

  final bool signIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Center(
          child: Container(
        width: 500,
        child: signIn ? SigninPanel() : SignupPanel(),
      )),
    );
  }
}
