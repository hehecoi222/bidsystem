import 'package:bidsystem/constants/controllers.dart';
import 'package:bidsystem/controllers/user_controller.dart';
import 'package:bidsystem/pages/sign/widgets/sign_panel.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/snackbar_info.dart';

class SignupPanel extends GetView<UserController> {
  SignupPanel({super.key, this.error});

  final checkEula = false.obs;
  Future? error;
  final errorMessage = "".obs;

  @override
  Widget build(BuildContext context) {
    return SignPanel(
        content: controller.obx((state) {
          if (error != null) {
            error?.then((value) {
              errorMessage.value = value;
            });
          }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Sign up",
            textStyle: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(
            height: 25,
          ),
          SignForm(
            labelText: "Email",
            inputType: TextInputType.emailAddress,
            controller: userController.emailController,
            autofillHints: const [
              AutofillHints.email
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SignForm(
            labelText: "Username",
            inputType: TextInputType.name,
            controller: userController.usernameController,
            autofillHints: const [
              AutofillHints.newUsername
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SignForm(
            labelText: "Phone Number",
            inputType: TextInputType.phone,
            controller: userController.phoneController,
            autofillHints: const [
              AutofillHints.telephoneNumber
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SignForm(
            labelText: "Password",
            inputType: TextInputType.visiblePassword,
            password: true,
            controller: userController.passwordController,
            autofillHints: const [
              AutofillHints.newPassword
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SignForm(
            labelText: "Re-Enter Password",
            inputType: TextInputType.visiblePassword,
            password: true,
            controller: userController.repasswordController,
            autofillHints: const [
              AutofillHints.newPassword
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Have an account",
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
              TextButton(
                  onPressed: () {
                    navigationController.navigateTo(SignInPageRoute);
                  },
                  child: CustomText(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    text: "Sign in here",
                    color: Theme.of(context).colorScheme.primary,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Checkbox(
                  value: checkEula.value,
                  onChanged: (newValue) {
                    checkEula.value = newValue ?? false;
                  })),
              CustomText(
                textStyle: Theme.of(context).textTheme.labelMedium,
                text: "I have read the Eula",
              ),
              Obx(() => Checkbox(
                  value: userController.isSeller.value,
                  onChanged: (newValue) {
                    userController.isSeller.value = newValue ?? false;
                  })),
              CustomText(
                textStyle: Theme.of(context).textTheme.labelMedium,
                text: "I want to be seller",
              )
            ],
          ),
          if (userController.failed.value ?? false)
            Container(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(child: CustomText(
                text: "An error occured" + errorMessage.value,
                textStyle: Theme.of(context).textTheme.bodyMedium,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ), padding: EdgeInsets.all(10),),
            ),
          SizedBox(
            height: 10,
          ),
          SignButton(
            labelText: "Sign up",
            onPressed: () {
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(userController.emailController.text)) {
                createSnackbar(context, "Please enter correct email");
                return;
              }

              if (!RegExp(
                      r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$')
                  .hasMatch(userController.usernameController.text)) {
                createSnackbar(context,
                    "Please enter valid username. Username has 8-20 characters, which have letters, numbers only");
                return;
              }

              if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                  .hasMatch(userController.phoneController.text)) {
                createSnackbar(context, "Please enter valid phone number");
                return;
              }

              if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                  .hasMatch(userController.passwordController.text)) {
                createSnackbar(context,
                    "Please enter strong password. Valid passwword requires at least 8 characters, which have letters and numbers only");
                return;
              }

              if (userController.passwordController.text !=
                  userController.repasswordController.text) {
                createSnackbar(context, "Repeated password does not match");
                return;
              }

              if (!checkEula.value) {
                createSnackbar(context, "Please read the Eula");
                return;
              }

              error = userController.register();
            },
          ),
        ],
      );
    },
            onLoading: Container(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(),
                ))));
  }
}
