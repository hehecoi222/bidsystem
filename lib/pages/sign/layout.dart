import 'package:bidsystem/pages/sign/widgets/sign_in.dart';
import 'package:bidsystem/pages/sign/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class SignLayout extends StatelessWidget {
  const SignLayout({super.key, required this.signIn});

  final bool signIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              "images/backmain.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ).image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25), BlendMode.dstATop),
          ),),
      child: Center(
          child: Container(
        width: 500,
        child: signIn ? SigninPanel() : SignupPanel(),
      )),
    );
  }
}
