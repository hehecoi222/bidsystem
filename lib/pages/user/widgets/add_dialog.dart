import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/helpers/time_parse.dart';
import 'package:bidsystem/pages/sign/widgets/sign_panel.dart';
import 'package:bidsystem/state/item_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/cutom_text.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: CustomText(
        text: "Add Auction",
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      content: Container(
        width: width * 0.6,
        height: 600,
        child: Column(
          children: [
            SignForm(
              labelText: "Name of item",
              controller: itemController.itemName,
            ),
            SizedBox(
              height: 10,
            ),
            SignForm(
                labelText: "Description of item",
                controller: itemController.itemDescription),
            SizedBox(
              height: 10,
            ),
            SignButton(
              labelText: "Add Item",
              onPressed: () {
                itemController.addItem();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "Select Item if Already Add",
              size: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => DropdownMenu<ItemState>(
                  dropdownMenuEntries:
                      itemController.listAllItems.map((element) {
                    return DropdownMenuEntry(
                        value: element, label: element.name.value);
                  }).toList(),
                  label: const Text("Item"),
                  leadingIcon: const Icon(Icons.search),
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  controller: itemController.itemSelect,
                  onSelected: (ItemState? state) {
                    itemController.itemStateSelect.value = state!;
                  },
                  width: 400,
                )),
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: "Select Date Range",
              size: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SignButton(
                  labelText: "Pick Date",
                  onPressed: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      lastDate: DateTime(2030),
                      firstDate: DateTime.now(),
                    );
                    if (picked != null && picked != null) {
                      auctionController.startDate.value =
                          picked.start.toIso8601String() + "Z";
                      auctionController.endDate.value =
                          picked.end.toIso8601String() + "Z";
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() => CustomText(
                      text:
                          "${toDisplay(auctionController.startDate.value)} - ${toDisplay(auctionController.endDate.value)}",
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
              ],
            ),
            CustomText(
              text: "Select Price",
              size: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(
              height: 10,
            ),
            SignForm(
              labelText: "Price",
              controller: auctionController.itemPrice,
            ),
            SizedBox(
              height: 10,
            ),
            SignForm(
                labelText: "Minimum Increase",
                controller: auctionController.itemMinimum),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            auctionController.addAuction();
            Navigator.pop(context);
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
