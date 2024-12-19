import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';
import '../text/p_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(title1Semibold.copyWith(
                color: enabled ? Colors.white : Colors.grey)),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(
                enabled ? bluePothan[800]! : bluePothan[200]!),
            overlayColor: WidgetStateProperty.all(
                enabled ? bluePothan[800]! : bluePothan[200]!),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(
                      width: 1.0,
                      color: enabled ? bluePothan[800]! : bluePothan[200]!)),
            ),
          ),
          onPressed: enabled ? onPressed : () {},
          child: SizedBox(
            child: PText(
              text,
              style: heading6Regular.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
