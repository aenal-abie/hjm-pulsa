import 'package:core/component/atoms/fields/index.dart';
import 'package:flutter/material.dart';

class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GSText("Nomor HP"),
          GSTextField("masukkan no hp"),
        ],
      ),
    );
  }
}
