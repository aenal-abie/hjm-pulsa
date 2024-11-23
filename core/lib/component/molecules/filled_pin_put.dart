import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class GSFilledPinPut extends StatefulWidget {
  final ValueChanged<String> onCompleted;

  const GSFilledPinPut({Key? key, required this.onCompleted}) : super(key: key);

  @override
  State<GSFilledPinPut> createState() => _GSFilledPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _GSFilledPinPutState extends State<GSFilledPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    final defaultPinTheme = PinTheme(
      textStyle: heading4Style.copyWith(color: neutralColor500),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: neutralColor100,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 100,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: widget.onCompleted,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 50,
          width: 50,
          textStyle: heading4Style.copyWith(color: optionalColor500),
          decoration: defaultPinTheme.decoration?.copyWith(
            color: primaryColor500,
            border: Border.all(color: primaryColor500),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor500,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
