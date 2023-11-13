import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/cur_formater.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

const EXAMPLE_LIST = [
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
  Info(name: "Hyyy", money: "787", time: "UTCG"),
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
          child: Padding(
              padding: EdgeInsets.all(20),
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
                      Obx(() => CustomText(
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            text:
                                "${currencyFormat(auctionController.currentAuction.currentPrice.value.toString()) + " đ"}",
                          ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 0,
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => CustomText(
                            text: auctionController.currentAuction.item.value.name.value,
                            size: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),),
                          Obx(() => CustomText(
                            text: "Sell by: ${userController.viewInfoState.username.value}",
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),)
                        ],
                      )
                    ],
                  ),SizedBox(height: 15,),
                  Wrap(
                    spacing: 5,
                    children: [
                      FilledButton.tonal(
                          onPressed: () {
                            auctionController.multiply(1.5);
                          },
                          child: CustomText(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            text: "x1.5",
                          )),
                      FilledButton.tonal(
                          onPressed: () {
                            auctionController.multiply(2);
                          },
                          child: CustomText(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            text: "x2",
                          )),
                      FilledButton.tonal(
                          onPressed: () {
                            auctionController.multiply(3);
                          },
                          child: CustomText(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            text: "x3",
                          )),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Your price",
                          suffixText: "đ",
                        ),
                        controller: auctionController.nextPrice,
                        keyboardType:
                            TextInputType.numberWithOptions(signed: true),
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
                                value = currencyFormat(value);
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
              )),
        )
      ],
    );
  }
}
