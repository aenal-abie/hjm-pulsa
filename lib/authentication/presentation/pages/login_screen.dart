import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/buttons/primary_button.dart';
import 'package:pulsa/core/presentation/atoms/fields/text_field.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../manager/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController(di()));
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PAppBar(),
      body: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(22),
              PText.heading2Medium("Masuk ke"),
              PText.heading4Regular(
                "CHM Pulsa Agent",
                color: bluePothan[800],
              ),
              const Gap(41),
              PTextField(
                hintText: "Email",
                labelText: "Email",
                controller: username,
              ),
              const Gap(25),
              PTextField.password(
                hintText: "Password",
                labelText: "Password",
                controller: password,
              ),
              const Gap(13),
              Row(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  PText.body2Regular("Lupa password ?", color: bluePothan[800]),
                ],
              ),
              const Gap(42),
              PrimaryButton(text: "Login", onPressed: loginPressed)
            ],
          ),
        ),
      ),
    );
  }

  void loginPressed() async {
    loginController.username(username.text);
    loginController.password(password.text);
    loginController.login();
  }
}
