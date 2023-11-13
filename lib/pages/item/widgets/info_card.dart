import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/controllers/auction_controller.dart';
import 'package:bidsystem/helpers/time_parse.dart';
import 'package:bidsystem/pages/item/widgets/dialog.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoItem extends GetView<AuctionController> {
  InfoItem({
    super.key,
    this.auctionId,
  });

  final int? auctionId;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                          child: CustomText(
                        text: itemController.currentItem.name.value,
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
                    text:
                        "Sell by: ${userController.viewInfoState.username.value}",
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(children: [
                      CustomText(
                        text: itemController.currentItem.description.value,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      CustomText(
                          text:
                              "End date: ${toDisplay(auctionController.currentAuction.deadline.value)}",
                          size: 12,
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Obx(() => LinearProgressIndicator(
                                value: auctionController.portion.value,
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(() => CustomText(
                            text:
                                "Remaining time: ${auctionController.remainingTime.value}",
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      FloatingActionButton.extended(
                          onPressed: () {
                            if (auctionId != null)
                              auctionController.getAuction(auctionId!);
                            showDialog(
                                context: context,
                                builder: CustomDialog().build);
                          },
                          label: Row(
                            children: [
                              Icon(
                                Icons.monetization_on_outlined,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              CustomText(
                                text: "Place bid",
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
        onLoading: Container(
            height: 500,
            child: Center(
              child: CircularProgressIndicator(),
            )));
  }
}
