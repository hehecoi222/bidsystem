import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';

class UserShortRow extends StatelessWidget {
  const UserShortRow({super.key, this.userName = "User", this.userImage, this.onPressed});

  final String userName;
  final Image? userImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget? image;
    if (userImage != null) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(50),
          child: Image(
        image: userImage!.image,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
      ));
    }
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          CustomText(
            text: userName,
            textStyle: Theme.of(context).textTheme.labelLarge,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            width: 12,
          ),
          image ??
              CircleAvatar(
                radius: 16,
                child: Text(userName[0]),
              )
        ],
      ),
    );
  }
}
