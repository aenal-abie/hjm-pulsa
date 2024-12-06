import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/atoms/index.dart';
import 'package:core/component/styles/index.dart';
import 'package:flutter/material.dart';

import '../../manager/buy_controller.dart';

class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key, required this.buyController});
  final BuyController buyController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
      child: GSBoxShadow(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GSText.headingSeven("Nomor HP"),
            GSTextField(
              "081907666555",
              textInputType: TextInputType.phone,
              hintsStyle: heading6Style.copyWith(color: Colors.black26),
              style: heading6Style.copyWith(color: Colors.black),
              numericOnly: true,
              onChange: (value) {
                if (value.length == 4) {
                  buyController.getProducts("XL");
                }
                buyController.phone.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
