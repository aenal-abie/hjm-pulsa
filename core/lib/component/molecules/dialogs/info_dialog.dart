import 'package:core/component/atoms/buttons/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../atoms/fields/text.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({super.key,
    this.message,
    this.buttonText,
    this.onConfirm,
    this.messageWidget});

  final String? message;
  final Widget? messageWidget;
  final String? buttonText;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          GSText.headingSevenMedium("Informasi", textAlign: TextAlign.center),
          message != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GSText.body(
                    message,
                    textAlign: TextAlign.center,
                  ),
                )
              : messageWidget ?? Container(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                width: 140,
                child: GSPrimaryButton(
                  buttonSize: ButtonSize.small,
                  text: buttonText ?? "Konfirmasi",
                  onPress: () {
                    if (onConfirm != null) {
                      onConfirm?.call();
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
