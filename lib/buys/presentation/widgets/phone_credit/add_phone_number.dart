import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../manager/buy_controller.dart';

class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key, required this.buyController});
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
              hintText: "081907666555",
              keyboardType: TextInputType.phone,
              labelText: "NO HP",
              hintStyle: heading4Regular.copyWith(color: Colors.black26),
              style: heading4Regular.copyWith(color: Colors.black),
              onChanged: (value) {
                if (value.length == 4) {
                  buyController.getProducts(value);
                }
                buyController.phoneNumber.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
