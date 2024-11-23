import 'package:flutter/material.dart';

import '../../styles/index.dart';

class GSCheckBox extends StatelessWidget {
  final bool isMarked;
  final Function(bool newValue) onChange;

  const GSCheckBox({
    Key? key,
    required this.isMarked,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(color: Color(0xffA3A3A3)),
      value: isMarked,
      onChanged: (value) async {
        onChange(isMarked);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      activeColor: primaryColor500,
    );
  }
}
