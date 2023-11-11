import 'package:bidsystem/pages/item/widgets/dialog.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                  child: CustomText(
                text: "Special Item",
                size: 36,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              )),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_add_outlined,
                    size: 24,
                  )),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          CustomText(
            text: "Sell by: \$seller",
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 200,),
          Row(
            children: [
              Expanded(child: Container()),
              CustomText(
                  text: "End date: \$endDate",
                  size: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ],
          ),
          Row(children: [
            Expanded(child: LinearProgressIndicator(value: 0.5,)),
            SizedBox(width: 10,),
            CustomText(text: "Remaining time: \$remainingTime",)
          ],),
          Row(
            children: [
              FloatingActionButton.extended(onPressed: () => showDialog(context: context, builder: CustomDialog().build), label: Row(
                children: [
                  Icon(Icons.monetization_on_outlined, color: Theme.of(context).colorScheme.onPrimaryContainer,),
                  SizedBox(width: 12,),
                  CustomText(text: "Place bid", size: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer,)
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
