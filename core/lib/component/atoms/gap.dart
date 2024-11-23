import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GSGap extends StatelessWidget {
  const GSGap(this.size, {Key? key}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Gap(size);
  }
}
