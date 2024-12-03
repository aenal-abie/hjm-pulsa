import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/atoms/buttons/index.dart';
import 'package:core/utils/get.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';

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
            return GSText(
              controller.selectedProduct.value.sellingPrice.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.teal, fontSize: 18),
            );
          }),
          Container(
              width: 100,
              child: const GSPrimaryButton(
                text: "Pesan",
              ))
        ],
      ),
    );
  }
}
