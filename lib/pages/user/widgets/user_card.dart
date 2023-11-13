import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Card(
              child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    )),
                flex: 1,
              ),
              Expanded(
                child: Container(),
                flex: 1,
              )
            ],
          )),
          Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                  radius: 50,
                  child: Obx(
                    () => Text(
                      userController.myState.username.value[0],
                      textScaleFactor: 3,
                    ),
                  ))),
          Align(
            alignment: Alignment.center,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 185,
              ),
              CustomText(
                text: userController.myState.username.value,
                textStyle: Theme.of(context).textTheme.headlineMedium,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: userController.myState.role.value.capitalizeFirst ??
                    userController.myState.role.value,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              )
            ]),
          )
        ],
      ),
    );
  }
}
