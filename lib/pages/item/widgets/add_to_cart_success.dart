import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartDone extends StatelessWidget {
  AddToCartDone({super.key});

  final isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => isLoading.value ? CircularProgressIndicator() : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(height: 10,),
          CustomText(text: "Successfully add to cart", textStyle: Theme.of(context).textTheme.labelLarge,)
        ],
      )),
    );
  }
}
