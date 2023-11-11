import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

const EXAMPLE_LIST = [
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "What", money: "Monet", time: "This the time")
];

class Info {
  const Info({required this.name, required this.money, required this.time});

  final String name;
  final String money;
  final String time;
}

class DialogInfo extends StatelessWidget {
  const DialogInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: ListView(
                children: EXAMPLE_LIST
                    .map((e) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(e.name[0]),
                                ),
                                title: CustomText(
                                  text: "By ${e.name}",
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: CustomText(
                                  text: "${e.money} at ${e.time}",
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                            ),
                          ],
                        ))
                    .toList()),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
          ),
          flex: 1,
        )
      ],
    );
  }
}
