import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../../core/presentation/atoms/buttons/primary_button.dart';
import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';

class BuyingAction extends StatelessWidget {
  final BuyController controller;

  const BuyingAction({super.key, required this.controller});

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
              child: PrimaryButton(
                text: "Pesan",
                onPressed: buyProduct,
              ))
        ],
      ),
    );
  }

  void buyProduct() {
    controller.buyProduct();
  }
}
