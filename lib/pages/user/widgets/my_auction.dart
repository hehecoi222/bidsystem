import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/pages/home/widgets/button.dart';
import 'package:bidsystem/pages/user/widgets/add_dialog.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:bidsystem/widgets/list/list_auction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const filter = ["Registered", "Won", "Purchased"];

class MyAuction extends StatelessWidget {
  MyAuction({super.key});

  final selected = "".obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: CustomText(
                  text: "My Auction",
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontWeight: FontWeight.bold,
                )),
            userController.myState.role.value == "seller" ? Padding(padding: EdgeInsets.only(right: 16), child:
              CTAButton(
                onPressed: () {
                  itemController.getAllItem();
                  showDialog(
                      context: context,
                      builder: AddDialog().build);
                },
                text: "Add Item",
                icon: Icon(Icons.add),
              ),) : Container(),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
            padding: EdgeInsets.only(left: 25),
            child: Wrap(
              spacing: 5,
              children: filter
                  .map((e) => Obx(() => ChoiceChip(
                        label: Text(e),
                        selected: e == selected.value,
                        onSelected: (value) {
                          selected.value = value ? e : "";
                        },
                      )))
                  .toList(),
            )),
        GridListAuction(),
      ],
    );
  }
}
