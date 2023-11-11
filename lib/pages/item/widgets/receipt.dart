import 'package:flutter/material.dart';

import '../../../widgets/cutom_text.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Special Item",
            size: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            leading: CustomText(
              text: "Special Item x1",
              size: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            trailing: CustomText(
              text: "\$Money",
              size: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Divider(height: 0,)
        ],
      ),
    );
  }
}
