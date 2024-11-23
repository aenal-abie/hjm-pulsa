import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomGap extends StatelessWidget {
  const CustomGap(this.size, {Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Gap(size);
  }
}
