import 'package:bidsystem/pages/home/widgets/button.dart';
import 'package:bidsystem/pages/home/widgets/text_sub_button.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class HomeBoard extends StatelessWidget {
  const HomeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.inverseSurface,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //   image: AssetImage('images/test.png'),
                    //   fit: BoxFit.cover,
                    //   colorFilter: ColorFilter.mode(
                    //       Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    // ),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "The best bid system in the world",
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        size: 48,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: "This is a subtext",
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        size: 24,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CTAButton(),
                          SizedBox(
                            width: 10,
                          ),
                          TextSubButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
