import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pulsa/core/presentation/atoms/buttons/primary_button.dart';
import 'package:pulsa/user/presentation/manager/user_controller.dart';

import '../../../core/presentation/atoms/style/colors.dart';
import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';

class ChangingPin extends StatefulWidget {
  const ChangingPin({super.key});

  @override
  State<ChangingPin> createState() => _ChangingPinState();
}

class _ChangingPinState extends State<ChangingPin> {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: heading1Bold.copyWith(color: bluePothan[950]),
      decoration: BoxDecoration(
        border: Border.all(color: bluePothan),
        borderRadius: BorderRadius.circular(5),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: "Ubah PIN",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),
              PText.body1Medium("Masukkan PIN Lama"),
              Gap(10),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusNode: FocusNode(),
                obscureText: true,
                autofocus: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                cursor: cursor,
                onCompleted: (pin) async {
                  userController.oldPin = pin;
                },
              ),
              Gap(20),
              PText.body1Medium("Masukkan PIN Baru"),
              Gap(10),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusNode: FocusNode(),
                obscureText: true,
                autofocus: true,
                cursor: cursor,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                onCompleted: (pin) async {
                  userController.newPin = pin;
                },
              ),
              Gap(20),
              PText.body1Medium("Ulangi PIN Baru"),
              Gap(10),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusNode: FocusNode(),
                obscureText: true,
                autofocus: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                cursor: cursor,
                onCompleted: (pin) async {
                  userController.reNewPin = pin;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Obx(() {
          return PrimaryButton(
            text: "Simpan",
            onPressed: submitPin,
            enabled: !userController.changePinLoading.value,
          );
        }),
      ),
    );
  }

  Widget get cursor {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Divider(
        color: bluePothan,
      ),
    );
  }

  void submitPin() async {
    var success = await userController.changePin();
    if (success) {
      Get.snackbar("Berhasil", "PIN baru berhasil diganti",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.green,
          overlayBlur: 10,
          barBlur: 10);
    } else if (!success) {}
  }
}
