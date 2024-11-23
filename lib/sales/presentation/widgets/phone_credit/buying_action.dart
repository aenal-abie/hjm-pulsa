import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/atoms/buttons/index.dart';
import 'package:flutter/material.dart';

class BuyingAction extends StatelessWidget {
  const BuyingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GSText("Rp.5,000"),
          Container(
              width: 100,
              child: GSPrimaryButton(
                text: "Pesan",
              ))
        ],
      ),
    );
  }
}
