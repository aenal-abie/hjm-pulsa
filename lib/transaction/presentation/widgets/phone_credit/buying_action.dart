import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pinput/pinput.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../../core/presentation/atoms/buttons/primary_button.dart';
import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';
import 'processing_product.dart';

class BuyingAction extends StatelessWidget {
  final Category packetType;
  final BuyController controller;

  const BuyingAction(
      {super.key, required this.controller, required this.packetType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PText.body1Regular("Jumlah bayar"),
                PText(
                  rupiah(controller.selectedProduct.value.sellingPrice ?? 0),
                  style: heading4Bold.copyWith(color: bluePothan[700]),
                ),
              ],
            );
          }),
          SizedBox(
              width: 150,
              child: Obx(() {
                return PrimaryButton(
                  text: "Pesan",
                  enabled: controller.enableSendButton,
                  onPressed: () => buyProduct(context),
                );
              }))
        ],
      ),
    );
  }

  void buyProduct(BuildContext context) async {
    controller.secondNavigation.value = "";
    inputPin(context);
  }

  void inputPin(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: heading1Bold.copyWith(color: bluePothan[950]),
      decoration: BoxDecoration(
        border: Border.all(color: bluePothan),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: natural[50]!.withOpacity(.7),
        builder: (context) {
          return Scaffold(
            backgroundColor: natural[50]!.withOpacity(.7),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PText.heading4Medium("Masukkan PIN"),
                  Gap(10),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusNode: FocusNode(),
                    autofocus: true,
                    obscureText: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: false,
                    onCompleted: (pin) async {
                      Get.back();
                      !context.mounted ? null : showDialogProcess(context);
                      await controller.buyProduct(pin, packetType);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showDialogProcess(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: PText(
              "Pembelian ${packetType.value}",
              style: heading6Bold,
              textAlign: TextAlign.center,
            ),
            content: ProcessingProduct(controller: controller),
          );
        });
  }
}
