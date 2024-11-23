import 'package:core/component/atoms/fields/index.dart';
import 'package:flutter/material.dart';

class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GSText("Nomor HP"),
          GSTextField(
            "081907666555",
            textInputType: TextInputType.phone,
            numericOnly: true,
          ),
        ],
      ),
    );
  }
}
