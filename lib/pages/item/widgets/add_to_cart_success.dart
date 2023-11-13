import 'package:bidsystem/controllers/auction_controller.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartDone extends GetView<AuctionController> {
  AddToCartDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: controller.obx(
            (state) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: "Successfully add to cart",
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
            onLoading: Container(
              height: 500,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )));
  }
}
