import 'package:bidsystem/controllers/user_controller.dart';
import 'package:bidsystem/pages/sign/widgets/sign_panel.dart';
import 'package:bidsystem/routing/routes.dart';
import 'package:bidsystem/widgets/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/controllers.dart';

class SigninPanel extends GetView<UserController> {
  SigninPanel({super.key});

  Future? error;

  @override
  Widget build(BuildContext context) {
    return SignPanel(
      content: controller.obx((state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Sign in",
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
              labelText: "Password",
              inputType: TextInputType.visiblePassword,
              password: true,
              controller: userController.passwordController,
              autofillHints: const [
                AutofillHints.password
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: "Don't have an account",
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                TextButton(
                    onPressed: () {
                      navigationController.navigateTo(SignUpPageRoute);
                    },
                    child: CustomText(
                      textStyle: Theme.of(context).textTheme.labelMedium,
                      text: "Sign up here",
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (userController.failed.value ?? false)
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Obx(() => CustomText(
                        text: "An error occured: ${userController.errorMessage.value}",
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      )),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            SignButton(
              labelText: "Sign in",
              onPressed: () {
                // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                //     .hasMatch(userController.emailController.text)) {
                //   createSnackbar(context, "Please enter correct email");
                //   return;
                // }

                error = userController.login();
              },
            ),
          ],
        );
      },
          onLoading: Container(
              height: 500,
              child: Center(
                child: CircularProgressIndicator(),
              ))),
    );
  }
}
