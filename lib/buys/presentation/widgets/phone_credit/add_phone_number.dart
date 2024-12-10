import 'package:flutter/material.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/widgets/box_shadow.dart';
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
            PText.heading4Regular("Nomor HP"),
            PTextField(
              hintText: "081907666555",
              // textInputType: TextInputType.phone,
              // hintsStyle: heading6Style.copyWith(color: Colors.black26),
              // style: heading6Style.copyWith(color: Colors.black),
              // numericOnly: true,
              // onChange: (value) {
              //   if (value.length == 4) {
              //     buyController.getProducts("XL");
              //   }
              //   buyController.phone.value = value;
              // },
            ),
          ],
        ),
      ),
    );
  }
}
