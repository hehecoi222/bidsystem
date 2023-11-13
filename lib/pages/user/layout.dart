import 'package:bidsystem/pages/user/widgets/my_auction.dart';
import 'package:bidsystem/pages/user/widgets/user_card.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: UserCard(),
          flex: 1,
        ),
        Expanded(
          child: MyAuction(),
          flex: 2,
        ),
      ],
    );
  }
}
