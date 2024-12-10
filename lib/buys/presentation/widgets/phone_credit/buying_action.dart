import 'package:flutter/material.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';

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
            return PText(
              controller.selectedProduct.value.sellingPrice.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.teal, fontSize: 18),
            );
          }),
          SizedBox(
              width: 100,
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
