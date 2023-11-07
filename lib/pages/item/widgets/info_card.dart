import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            text: "This is a description",
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          Expanded(child: Container()),
          CustomText(
            text: "hi",
          )
        ],
      ),
    );
  }
}
