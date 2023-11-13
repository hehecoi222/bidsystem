import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/cur_formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/cutom_text.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: auctionController.currentAuction.item.value.name.value,
                size: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                leading: CustomText(
                  text:
                      "${auctionController.currentAuction.item.value.name.value} x1",
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                trailing: CustomText(
                  text:
                      "${currencyFormat(auctionController.nextPrice.text.replaceAll(RegExp(r' '), ''))}",
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Divider(
                height: 0,
              )
            ],
          )),
    );
  }
}
