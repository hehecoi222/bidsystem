import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    text: "Current price:",
                  ),
                  CustomText(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    text: "\$Current Price",
                  )
                ],
              ),
              Divider(
                height: 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "Special Item",
                        size: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      CustomText(
                        text: "Sell by: \$seller",
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  FilledButton.tonal(
                      onPressed: () {},
                      child: CustomText(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        text: "x1.5",
                      )),
                  FilledButton.tonal(
                      onPressed: () {},
                      child: CustomText(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        text: "x2",
                      )),
                  FilledButton.tonal(
                      onPressed: () {},
                      child: CustomText(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        text: "x3",
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    text: "Your price:",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Your price",
                      suffixText: "đ",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        String newText = newValue.text
                            .replaceAll(".", '')
                            .replaceAll(',', '')
                            .replaceAll('_', '')
                            .replaceAll('-', '');
                        String value = newText;
                        int cursorPosition = newText.length;
                        if (newText.isNotEmpty) {
                          if (value.isNotEmpty) {
                            String display = "";
                            for (int i = value.length - 1; i >= 0; i--) {
                              display = display + value[i];
                              if ((value.length - i) % 3 == 0 && i != 0) {
                                display += " ";
                              }
                            }
                            value = display.split('').reversed.join();
                            cursorPosition = value.length;
                          }
                        }
                        return TextEditingValue(
                            text: value,
                            selection: TextSelection.collapsed(
                                offset: cursorPosition));
                      })
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
