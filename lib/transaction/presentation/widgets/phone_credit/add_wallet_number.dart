import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';

class AddWalletNumber extends StatelessWidget {
  final Category packetType;

  const AddWalletNumber(
      {super.key, required this.buyController, required this.packetType});

  final BuyController buyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PTextField(
              hintText: "081 907 666 555",
              keyboardType: TextInputType.phone,
              labelText: "No Wallet",
              hintStyle: heading4Regular.copyWith(color: Colors.black26),
              style: heading4Regular.copyWith(color: Colors.black),
              onChanged: (temp) {
                var value = temp.replaceAll(' ', '');
                buyController.setWalletNumber(value, packetType);
              },
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '### ### ### ### ##',
                  filter: {
                    '#': RegExp(r'[0-9]'),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
